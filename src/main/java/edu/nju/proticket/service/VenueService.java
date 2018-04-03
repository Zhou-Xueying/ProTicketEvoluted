package edu.nju.proticket.service;

import edu.nju.proticket.model.Venue;
import org.springframework.stereotype.Service;

import java.util.List;

public interface VenueService {

    /**
     *
     * @param venueName
     * @return true:has registered
     */
    public boolean hasRegistered(String venueName);

    /**
     *
     * @param venue
     * @return true:is being checked
     */
    public boolean register(Venue venue);

    /**
     *
     * @param venueId
     * @param password
     * @return
     */
    public boolean login(int venueId, String password);

    /**
     *
     * @param venueId
     * @return
     */
    public Venue getVenueInfo(int venueId);

    /**
     *
     * @param venue
     * @return
     */
    public boolean updateVenueInfo(Venue venue);

    /**
     *
     * @return
     */
    public List<Venue> getApplications();

    /**
     *
     * @return
     */
    public Venue getCondition0(int venueId);

    /**
     *
     * @return
     */
    public Venue getConditionMinus1(int venueId);

    /**
     *
     * @return
     */
    public List<Venue> getVenues();
}
