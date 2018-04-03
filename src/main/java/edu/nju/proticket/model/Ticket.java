package edu.nju.proticket.model;

import javax.persistence.*;

@Entity
@Table(name = "tickets", schema = "tickets_business")
public class Ticket {
    private int ticketid;
    private int eventid;
    private int venueid;
    private int seatid;
    private double price;
    private int condition;
    private int memberid;

    @Id
    @Column(name = "ticketid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getTicketid() {
        return ticketid;
    }

    public void setTicketid(int ticketid) {
        this.ticketid = ticketid;
    }

    @Basic
    @Column(name = "eventid")
    public int getEventid() {
        return eventid;
    }

    public void setEventid(int eventid) {
        this.eventid = eventid;
    }

    @Basic
    @Column(name = "venueid")
    public int getVenueid() {
        return venueid;
    }

    public void setVenueid(int venueid) {
        this.venueid = venueid;
    }

    @Basic
    @Column(name = "seatid")
    public int getSeatid() {
        return seatid;
    }

    public void setSeatid(int seatid) {
        this.seatid = seatid;
    }

    @Basic
    @Column(name = "price")
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "condition")
    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    @Basic
    @Column(name = "memberid")
    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ticket ticket = (Ticket) o;

        if (ticketid != ticket.ticketid) return false;
        if (eventid != ticket.eventid) return false;
        if (venueid != ticket.venueid) return false;
        if (seatid != ticket.seatid) return false;
        if (Double.compare(ticket.price, price) != 0) return false;
        if (condition != ticket.condition) return false;
        if (memberid != ticket.memberid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = ticketid;
        result = 31 * result + eventid;
        result = 31 * result + venueid;
        result = 31 * result + seatid;
        temp = Double.doubleToLongBits(price);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + condition;
        result = 31 * result + memberid;
        return result;
    }
}
