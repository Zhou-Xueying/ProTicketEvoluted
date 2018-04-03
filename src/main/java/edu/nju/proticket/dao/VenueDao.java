package edu.nju.proticket.dao;

import edu.nju.proticket.model.Venue;

import java.util.List;

public interface VenueDao {

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
     * @param venueId
     * @return
     */
    public Venue getCondition0(int venueId);

    /**
     *
     * @param venueId
     * @return
     */
    public Venue getConditionMinus1(int venueId);
}
