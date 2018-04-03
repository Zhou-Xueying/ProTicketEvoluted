package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.VenueDao;
import edu.nju.proticket.model.Venue;
import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.proticket.service.VenueService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VenueServiceImpl implements VenueService {

    @Autowired
    protected VenueDao venueDao;

    public boolean hasRegistered(String venueName) {
        return venueDao.hasRegistered(venueName);
    }

    public boolean register(Venue venue) {
        return venueDao.register(venue);
    }

    public boolean login(int venueId, String password) {
        return venueDao.login(venueId, password);
    }

    public Venue getVenueInfo(int venueId) {
        return venueDao.getVenueInfo(venueId);
    }

    public boolean updateVenueInfo(Venue venue) {
        return venueDao.updateVenueInfo(venue);
    }

    public List<Venue> getApplications() {
        return venueDao.getApplications();
    }

    public Venue getCondition0(int venueId) {
        return venueDao.getCondition0(venueId);
    }

    public Venue getConditionMinus1(int venueId) {
        return venueDao.getConditionMinus1(venueId);
    }
}
