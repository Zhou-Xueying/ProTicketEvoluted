package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.TicketDao;
import edu.nju.proticket.model.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.proticket.service.TicketService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TicketServiceImpl implements TicketService {

    @Autowired
    TicketDao ticketDao;

    public Ticket getATicket(int ticketId) {
        return ticketDao.getATicket(ticketId);
    }

    public List<Ticket> getTicketsOfMember(int memberId) {
        return ticketDao.getTicketsOfMember(memberId);
    }

    public List<Ticket> getTicketsOfEvent(int eventId) {
        return ticketDao.getTicketsOfEvent(eventId);
    }

    public List<Ticket> getTicketsOfVenue(int venueId) {
        return ticketDao.getTicketsOfVenue(venueId);
    }

    public boolean updateTicket(Ticket ticket) {
        return ticketDao.updateTicket(ticket);
    }

    public boolean createTicket(Ticket ticket) {
        return ticketDao.createTicket(ticket);
    }
}
