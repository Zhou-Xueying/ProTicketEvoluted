package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.EventDao;
import edu.nju.proticket.model.Event;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class EventDaoImpl implements EventDao {

    @Autowired
    private BaseDao baseDao;

    public boolean createEvent(Event event) {
        baseDao.save(event);
        return true;
    }

    public Event getEvent(int eventId) {
        Event event = (Event)baseDao.load(Event.class, eventId);
        return event;
    }

    public List<Event> getEventsOfVenue(int venueId) {
        Session session = baseDao.getSession();
        String hql = "from Event where venueid = :venueId";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Event> events = new ArrayList<Event>();
        for (Object event:list){
            events.add((Event)event);
        }
        return events;
    }

    public boolean check(Event event) {
        baseDao.update(event);
        return true;
    }

    public List<Event> getAllEvents(){
        return baseDao.getAllList(Event.class);
    }

    public List<Event> getEventsByType(String type) {
        Session session = baseDao.getSession();
        String hql = "from Event where type = :type";
        Query query = session.createQuery(hql);
        query.setParameter("type",type);
        List list = query.list();
        if (list.size()==0) return null;
        List<Event> events = new ArrayList<Event>();
        for (Object event:list){
            events.add((Event)event);
        }
        return events;
    }
}
