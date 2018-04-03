package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.EventDao;
import edu.nju.proticket.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.proticket.service.EventService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    protected EventDao eventDao;

    public boolean createEvent(Event event) {
        return eventDao.createEvent(event);
    }

    public Event getEvent(int eventId) {
        return eventDao.getEvent(eventId);
    }

    public List<Event> getEventsOfVenue(int venueId) {
        return eventDao.getEventsOfVenue(venueId);
    }

    public boolean pass(Event event) {
        event.setCondition(1);
        return eventDao.check(event);
    }

    public boolean unpass(Event event){
        event.setCondition(2);
        return eventDao.check(event);
    }

    public List<Event> getAllEvents() {
        return eventDao.getAllEvents();
    }

    public List<Event> getEventsByType(String type) {
        return eventDao.getEventsByType(type);
    }
}
