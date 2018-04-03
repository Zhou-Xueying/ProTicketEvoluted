package edu.nju.proticket.controller;

import edu.nju.proticket.model.Member;
import edu.nju.proticket.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
public class MyPageController {

    public final static String CURRENT_USER_ID = "CURRENT_USER_ID";

    @Autowired
    private MemberService memberService;

    //url:/mypage1?memberId=1
    @RequestMapping(value = "/mypage1",method = RequestMethod.GET)
    public String viewInfo(@RequestParam("memberId") Integer memberId, Model model){
        Member member = memberService.getProfile(memberId);
        model.addAttribute(member);
        return "mypage";
    }

    //url:/mypage2/{memberId}
    @RequestMapping(value="/mypage2/{memberId}",method = RequestMethod.GET)
    public String viewInfo2(@PathVariable("memberId") Integer memberId, Map<String, Object> model){
        Member member = memberService.getProfile(memberId);
        model.put("member",member);
        return "mypage";
    }

    //url:/mypage3?memberId=1
    @RequestMapping("mypage3")
    public String viewInfo3(HttpServletRequest request){
        Integer memberId = Integer.valueOf(request.getParameter("memberId"));
        Member member = memberService.getProfile(memberId);
        request.setAttribute("member",member);
        return "mypage";
    }

    @RequestMapping(value = "/{memberId}",method = RequestMethod.GET)
    public @ResponseBody Member getMemberInJson(@PathVariable Integer memberId){
        return memberService.getProfile(memberId);
    }

    @RequestMapping(value = "jsontype/{memberId}",method = RequestMethod.GET)
    public ResponseEntity<Member> getMemberInJson2(@PathVariable Integer memberId){
        Member member = memberService.getProfile(memberId);
        return new ResponseEntity<Member>(member, HttpStatus.OK);
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public String saveInfo(@ModelAttribute Member member){
        memberService.updateProfile(member);
        return "redirect:mypage/"+member.getUserid();
    }

    //上传文件的表单
    //<form method="post" action="/user/uploadFile" enctype="multipart/form-data">
    //<input type="file" name="file"/>
    //<input type="submit"/>
    //</form>
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public String uploadFile(@RequestParam("file") MultipartFile file,
                             HttpServletRequest request)throws IOException{
        if(!file.isEmpty()) { }
        return "";
    }

    @RequestMapping(value = "/toMyPage" ,method = RequestMethod.GET)
    public String toMyPage(HttpSession session, Model model){
        int userId = (Integer) session.getAttribute(CURRENT_USER_ID);
        Member member = memberService.getProfile(userId);
        model.addAttribute(member);
        return "mypage";
    }
}
