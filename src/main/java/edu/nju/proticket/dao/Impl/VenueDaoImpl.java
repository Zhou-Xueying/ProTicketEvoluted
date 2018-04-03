package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.VenueDao;
import edu.nju.proticket.model.Venue;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class VenueDaoImpl implements VenueDao {

    @Autowired
    private BaseDao baseDao;

    public boolean hasRegistered(String venueName) {
        Session session = baseDao.getSession();
        String hql = "from Venue where venuename = :venueName";
        Query query = session.createQuery(hql);
        query.setParameter("venueName",venueName);
        if(query.list().size()==1) return true;
        return false;
    }

    public boolean register(Venue venue) {
        baseDao.save(venue);
        return true;
    }

    public boolean login(int venueId, String password) {
        Session session = baseDao.getSession();
        String hql = "from Venue where venueid = :venueId and password = :password and condition > 0";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        query.setParameter("password",password);
        if(query.list().size()==1) return true;
        return false;
    }

    public Venue getVenueInfo(int venueId) {
        return (Venue)baseDao.load(Venue.class, venueId);
    }

    public boolean updateVenueInfo(Venue venue) {
        baseDao.update(venue);
        return false;
    }

    public List<Venue> getApplications() {
        Session session = baseDao.getSession();
        String hql = "from Venue where condition = 0";
        Query query = session.createQuery(hql);
        List<Venue> list = query.list();
        if(list.size() > 0) return list;
        return null;
    }

    public Venue getCondition0(int venueId) {
        Session session = baseDao.getSession();
        String hql = "from Venue where venueid = :venueId and condition = 0";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        if(query.list().size()==1)
            return (Venue) query.list().get(0);
        return null;
    }

    public Venue getConditionMinus1(int venueId) {
        Session session = baseDao.getSession();
        String hql = "from Venue where venueid = :venueId and condition = -1";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        if(query.list().size()==1)
            return (Venue) query.list().get(0);
        return null;
    }
}
