package edu.nju.proticket.dao;

import edu.nju.proticket.model.Ticket;

import java.util.List;

public interface TicketDao {

    /**
     *
     * @param ticketId
     * @return
     */
    public Ticket getATicket(int ticketId);

    /**
     *
     * @param memberId
     * @return
     */
    public List<Ticket> getTicketsOfMember(int memberId);

    /**
     *
     * @param eventId
     * @return
     */
    public List<Ticket> getTicketsOfEvent(int eventId);

    /**
     *
     * @param venueId
     * @return
     */
    public List<Ticket> getTicketsOfVenue(int venueId);

    /**
     *
     * @param ticket
     * @return
     */
    public boolean updateTicket(Ticket ticket);

    /**
     *
     * @param ticket
     * @return
     */
    public boolean createTicket(Ticket ticket);

}
