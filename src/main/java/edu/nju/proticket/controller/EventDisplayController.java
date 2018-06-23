package edu.nju.proticket.controller;

import edu.nju.proticket.model.Event;
import edu.nju.proticket.model.Venue;
import edu.nju.proticket.service.EventService;
import edu.nju.proticket.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import static edu.nju.proticket.controller.VenueController.CURRENT_VENUE_ID;
import static edu.nju.proticket.controller.VenueController.CURRENT_VENUE_NAME;

@Controller
public class EventDisplayController {

    @Autowired
    private EventService eventService;
    @Autowired
    private VenueService venueService;

    @RequestMapping(value = "/toDisplay", method = RequestMethod.GET)
    public String toDisplay(@RequestParam("type") String type){
        return "display";
    }

    @RequestMapping(value = "/getEventList", method = RequestMethod.GET)
    public @ResponseBody List<Event> getEventList(@RequestParam("type") String theRequest){
        int type = Integer.valueOf(theRequest);
        List<Event> list = new ArrayList<Event>();
        switch (type){
            case 0:
                list = eventService.getAllEvents();
                break;
            case 1:
                list = eventService.getEventsByType("演唱会");
                break;
            case 2:
                list = eventService.getEventsByType("话剧歌剧");
                break;
            case 3:
                list = eventService.getEventsByType("体育赛事");
                break;
            case 4:
                list = eventService.getEventsByType("音乐会");
                break;
            case 5:
                list = eventService.getEventsByType("舞蹈芭蕾");
                break;
            case 6:
                list = eventService.getEventsByType("展览休闲");
                break;
            case 7:
                list = eventService.getEventsByType("曲艺杂谈");
                break;
        }
        return list;
    }

    @RequestMapping(value="/toShowEventInfo", method = RequestMethod.GET)
    public String toShowEventInfo(@RequestParam("eventId") String eventId){
        return "eventInfo";
    }

    @RequestMapping(value="/getEventDetail", method = RequestMethod.GET)
    public @ResponseBody Event getEventDetail(@RequestParam("eventId") String eventId){
        Event event = eventService.getEvent(Integer.valueOf(eventId));
        return event;
    }

    @RequestMapping(value = "/getVenueEvents", method = RequestMethod.GET)
    public @ResponseBody List<Event> getVenueEvents(@RequestParam("venueId") String venueId){
        List<Event> list = eventService.getEventsOfVenue(Integer.parseInt(venueId));
        return list;
    }

    @RequestMapping(value = "/toCreateEvent", method = RequestMethod.GET)
    public String toCreate(){
        return "createEvent";
    }

    @RequestMapping(value = "/createEvent", method = RequestMethod.POST)
    public String createEvent(HttpServletRequest request, HttpSession session){
        Event event = new Event();
        event.setCity(request.getParameter("city"));
        event.setTitle(request.getParameter("title"));
        event.setDescription(request.getParameter("description"));
        event.setPrice1(Integer.parseInt(request.getParameter("price1")));
        event.setPrice2(Integer.parseInt(request.getParameter("price2")));
        event.setPrice3(Integer.parseInt(request.getParameter("price3")));
        event.setPrice4(Integer.parseInt(request.getParameter("price4")));
        event.setPrice5(Integer.parseInt(request.getParameter("price5")));
        event.setType(request.getParameter("type"));
        String time =request.getParameter("time");
        System.out.println(time);
        time = time + ":00";
        Timestamp timestamp = Timestamp.valueOf(time);
        event.setTime(timestamp);
        event.setVenueid((Integer) session.getAttribute(CURRENT_VENUE_ID));
        event.setVenueName((String)session.getAttribute(CURRENT_VENUE_NAME));
        event.setCondition(0);
        event.setImgUrl("static/images/nopic.jpg");
        eventService.createEvent(event);
        Venue venue = venueService.getVenueInfo((Integer) session.getAttribute(CURRENT_VENUE_ID));
        venue.setEventcount(venue.getEventcount()+1);
        venueService.updateVenueInfo(venue);
        return "venue/create_success";
    }
}
