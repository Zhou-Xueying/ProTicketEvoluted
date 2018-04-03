package edu.nju.proticket.dao;

import edu.nju.proticket.model.Event;

import java.util.List;

public interface EventDao {

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
     * only manager can use this method
     * @param event
     * @return
     */
    public boolean check(Event event);

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
