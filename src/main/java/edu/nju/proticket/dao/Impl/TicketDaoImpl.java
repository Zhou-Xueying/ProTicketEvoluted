package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.TicketDao;
import edu.nju.proticket.model.Ticket;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TicketDaoImpl implements TicketDao {

    @Autowired
    private BaseDao baseDao;

    public Ticket getATicket(int ticketId) {
        Ticket ticket = (Ticket)baseDao.load(Ticket.class, ticketId);
        return ticket;
    }

    public List<Ticket> getTicketsOfMember(int memberId) {
        Session session = baseDao.getSession();
        String hql = "from Ticket where memberid = :memberId";
        Query query = session.createQuery(hql);
        query.setParameter("memberId",memberId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Ticket> tickets = new ArrayList<Ticket>();
        for (Object order:list){
            tickets.add((Ticket) order);
        }
        return tickets;
    }

    public List<Ticket> getTicketsOfEvent(int eventId) {
        Session session = baseDao.getSession();
        String hql = "from Ticket where eventid = :eventId";
        Query query = session.createQuery(hql);
        query.setParameter("eventId", eventId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Ticket> tickets = new ArrayList<Ticket>();
        for (Object order:list){
            tickets.add((Ticket) order);
        }
        return tickets;
    }

    public List<Ticket> getTicketsOfVenue(int venueId) {
        Session session = baseDao.getSession();
        String hql = "from Ticket where venueid = :venueId";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Ticket> tickets = new ArrayList<Ticket>();
        for (Object order:list){
            tickets.add((Ticket) order);
        }
        return tickets;
    }

    public boolean updateTicket(Ticket ticket) {
        baseDao.update(ticket);
        return true;
    }

    public boolean createTicket(Ticket ticket) {
        baseDao.save(ticket);
        return true;
    }


}
