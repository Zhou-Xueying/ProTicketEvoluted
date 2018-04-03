package edu.nju.proticket.controller;

import edu.nju.proticket.model.Venue;
import edu.nju.proticket.service.VenueService;
import edu.nju.proticket.utils.CreateId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Controller
public class VenueController {

    public final static String CURRENT_VENUE_ID = "CURRENT_VENUE_ID";
    public final static String CURRENT_VENUE_NAME = "CURRENT_VENUE_NAME";

    @Autowired
    private VenueService venueService;

    @RequestMapping(value = "/venueLogin", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpSession session) {
        Integer id = Integer.parseInt(request.getParameter("venueId"));
        String password = request.getParameter("venuePass");
        if (venueService.login(id, password)) {
            session.setAttribute(CURRENT_VENUE_ID, id);
            session.setAttribute(CURRENT_VENUE_NAME, venueService.getVenueInfo(id).getVenuename());
            return "redirect:/toVenuePage.form?venueId=" + request.getParameter("venueId");
        } else {
            return "login/login_failure";
        }
    }

    @RequestMapping(value = "/venueLogout")
    public String logout(HttpSession session){
        session.removeAttribute(CURRENT_VENUE_NAME);
        session.removeAttribute(CURRENT_VENUE_ID);
        return "redirect:/welcome.form";
    }

    @RequestMapping(value = "/toVenuePage", method = RequestMethod.GET)
    public String toVenuePage(@RequestParam("venueId") String venueId, Model model) {
        Venue venue = venueService.getVenueInfo(Integer.parseInt(venueId));
        System.out.println(venue.getVenuename());
        model.addAttribute("venue", venue);
        return "venuePage";
    }

    @RequestMapping(value = "/toVenueRegister", method = RequestMethod.GET)
    public String toRegister() {
        return "venueRegister";
    }

    @RequestMapping(value = "/venueRegister", method = RequestMethod.POST)
    public String register(HttpServletRequest request) {
        Venue venue = new Venue();
        venue.setVenueid(CreateId.createVenueId());
        venue.setVenuename(request.getParameter("name"));
        venue.setAddress(request.getParameter("address"));
        venue.setSize(Integer.parseInt(request.getParameter("size")));
        venue.setPhone(request.getParameter("phone"));
        venue.setPassword(request.getParameter("password"));
        venue.setCondition(0);
        venue.setEventcount(0);
        venue.setOrdercount(0);
        venue.setTicketcount(0);
        venue.setIncome(0);
        venueService.register(venue);
        request.setAttribute("venueId", venue.getVenueid());
        return "venue/register_success";
    }

    @RequestMapping(value = "/passVenueApplication")
    public String validate(@RequestParam("venueId") String venueId) throws ParseException {
        int id = Integer.parseInt(venueId);
        Venue venue = venueService.getCondition0(id);
        venue.setCondition(1);
        venueService.updateVenueInfo(venue);
        return "managerPage";
    }

    @RequestMapping(value = "/refuseVenueApplication")
    public String unvalidate(@RequestParam("venueId") String venueId) throws ParseException {
        Integer id = Integer.parseInt(venueId);
        Venue venue = venueService.getCondition0(id);
        venue.setCondition(-1);
        venueService.updateVenueInfo(venue);
        return "managerPage";
    }

    @RequestMapping(value = "/toUpdateVenueInfo", method = RequestMethod.GET)
    public String updateVenueInfo(@RequestParam("venueId") String venueId, Model model) {
        Venue venue = venueService.getVenueInfo(Integer.parseInt(venueId));
        model.addAttribute("venue", venue);
        return "venueUpdate";
    }

    @RequestMapping(value = "/updateVenue",method = RequestMethod.POST)
    public String updateVenue(HttpServletRequest request){
        Venue venue = venueService.getVenueInfo(Integer.parseInt(request.getParameter("venueId")));
        venue.setVenuename(request.getParameter("name"));
        System.out.println(venue.getVenuename());
        venue.setPhone(request.getParameter("phone"));
        venue.setSize(Integer.parseInt(request.getParameter("size")));
        venue.setAddress(request.getParameter("address"));
        venue.setCondition(0);
        venueService.updateVenueInfo(venue);
        return "venue/update_success";
    }

    @RequestMapping(value = "/toVenueStatistics", method = RequestMethod.GET)
    public String toStatistics(Model model, HttpSession session){
        Venue venue = venueService.getVenueInfo((Integer)session.getAttribute(CURRENT_VENUE_ID));
        model.addAttribute("venue",venue);
        return "venueStatistics";
    }

    @RequestMapping(value = "/getVenues", method = RequestMethod.GET)
    public @ResponseBody List<Venue> getVenues(){
        return venueService.getVenues();
    }
}
