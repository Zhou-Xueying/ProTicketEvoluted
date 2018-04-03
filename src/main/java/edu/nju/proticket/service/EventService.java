package edu.nju.proticket.service;

import edu.nju.proticket.model.Event;
import org.springframework.stereotype.Service;

import java.util.List;

public interface EventService {

    /**
     *
     * @param event
     * @return
     */
    public boolean createEvent(Event event);

    /**
     *
     * @param eventId
     * @return
     */
    public Event getEvent(int eventId);

    /**
     *
     * @param venueId
     * @return
     */
    public List<Event> getEventsOfVenue(int venueId);

    /**
     * only manager can use this method: pass
     * @param event
     * @return
     */
    public boolean pass(Event event);

    /**
     * only manager can use this method: refuse
     * @param event
     * @return
     */
    public boolean unpass(Event event);

    /**
     *
     * @return
     */
    public List<Event> getAllEvents();

    /**
     *
     * @param Type
     * @return
     */
    public List<Event> getEventsByType(String type);

}
