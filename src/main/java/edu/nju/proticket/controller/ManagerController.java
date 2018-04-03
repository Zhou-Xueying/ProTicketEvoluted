package edu.nju.proticket.controller;

import edu.nju.proticket.model.Venue;
import edu.nju.proticket.service.ManagerService;
import edu.nju.proticket.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ManagerController {

    @Autowired
    ManagerService managerService;
    @Autowired
    VenueService venueService;

    @RequestMapping(value = "/managerLogin", method = RequestMethod.POST)
    public String login(HttpServletRequest request){
        Integer id = Integer.parseInt(request.getParameter("managerId"));
        String password = request.getParameter("managerPass");
        if(managerService.login(id, password)){
            return "managerPage";
        }else {
            return "login/login_failure";
        }
    }

    @RequestMapping(value = "/getApplication", method = RequestMethod.GET)
    public @ResponseBody List<Venue> getApplication(){
        List<Venue> list = venueService.getApplications();
        return list;
    }
}
