package edu.nju.proticket.controller;

import edu.nju.proticket.model.Member;
import edu.nju.proticket.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CurrentUserController {

//    public final static String CURRENT_USER = "CURRENT_USER";
    public final static String CURRENT_USER_ID = "CURRENT_USER_ID";
    public final static String CURRENT_USER_NAME = "CURRENT_USER_NAME";

    @Autowired
    private MemberService memberService;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(){
        return "display";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session){
        if(memberService.login(email,password)){
            Member member = memberService.getProfileByEmail(email);
//            session.setAttribute(CURRENT_USER, member);
            session.setAttribute(CURRENT_USER_ID, member.getUserid());
            session.setAttribute(CURRENT_USER_NAME, member.getUsername());
            return "login/login_success";
        }
        return "login/login_failure";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout(HttpSession session){
        if(session.getAttribute(CURRENT_USER_ID)!=null){
            session.removeAttribute(CURRENT_USER_ID);
            session.removeAttribute(CURRENT_USER_NAME);
        }
        return "login/logout_success";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public String deleteUser(HttpSession session){
        if(session.getAttribute(CURRENT_USER_ID)!=null){
            Member member = memberService.getProfile((Integer)session.getAttribute(CURRENT_USER_ID));
            memberService.deleteMember(member);
            session.removeAttribute(CURRENT_USER_ID);
            session.removeAttribute(CURRENT_USER_NAME);
        }
        return "login/delete_success";
    }

    @RequestMapping(value = "/updateName", method = RequestMethod.POST)
    public String updateName(@RequestParam("name")String name, HttpSession session, Model model){
        if(session.getAttribute(CURRENT_USER_ID)!=null) {
            Member member = memberService.getProfile((Integer) session.getAttribute(CURRENT_USER_ID));
            member.setUsername(name);
            memberService.updateProfile(member);
            session.setAttribute(CURRENT_USER_NAME, name);
            model.addAttribute("member", member);
        }
        return "mypage";
    }

    @RequestMapping(value = "/getMembers", method = RequestMethod.GET)
    public @ResponseBody List<Member> getMembers(){
        return memberService.getMembers();
    }
}
