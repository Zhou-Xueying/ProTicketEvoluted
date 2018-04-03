package edu.nju.proticket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import edu.nju.proticket.service.MemberService;
import edu.nju.proticket.utils.ServiceException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;

@Controller
public class RegisterController {

    @Autowired
    private MemberService service;

    @RequestMapping(value="/register", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView load(HttpServletRequest request, HttpServletResponse response) throws ParseException{
        String action = request.getParameter("action");
        System.out.println("-----r----"+action);
        ModelAndView mav=new ModelAndView();

        if("register".equals(action)) {//注册
            String email = request.getParameter("email");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            service.processRegister(email,userName,password);//发邮箱激活
            mav.addObject("text","注册成功");
            mav.setViewName("register/register_success");
        } else if("activate".equals(action)) {//激活
            String email = request.getParameter("email");//获取email
            String validateCode = request.getParameter("validateCode");//激活码
            try {
                service.processActivate(email , validateCode);//调用激活方法
                mav.setViewName("register/activate_success");
            } catch (ServiceException e) {
                request.setAttribute("message" , e.getMessage());
                mav.setViewName("register/activate_failure");
            }
        }
        return mav;
    }


}