package edu.nju.proticket.model;

import javax.persistence.*;

@Entity
@Table(name = "venues", schema = "tickets_business")
public class Venue {
    private int venueid;
    private String venuename;
    private String password;
    private int size;
    private String address;
    private String phone;
    private int condition;
    private int eventcount;
    private int ordercount;
    private int ticketcount;
    private double income;

    @Id
    @Column(name = "venueid")
    public int getVenueid() {
        return venueid;
    }

    public void setVenueid(int venueid) {
        this.venueid = venueid;
    }

    @Basic
    @Column(name = "venuename")
    public String getVenuename() {
        return venuename;
    }

    public void setVenuename(String venuename) {
        this.venuename = venuename;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "size")
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "status")
    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    @Basic
    @Column(name = "eventcount")
    public int getEventcount() {
        return eventcount;
    }

    public void setEventcount(int eventcount) {
        this.eventcount = eventcount;
    }

    @Basic
    @Column(name = "ordercount")
    public int getOrdercount() {
        return ordercount;
    }

    public void setOrdercount(int ordercount) {
        this.ordercount = ordercount;
    }

    @Basic
    @Column(name = "ticketcount")
    public int getTicketcount() {
        return ticketcount;
    }

    public void setTicketcount(int ticketcount) {
        this.ticketcount = ticketcount;
    }

    @Basic
    @Column(name = "income")
    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Venue venue = (Venue) o;

        if (venueid != venue.venueid) return false;
        if (size != venue.size) return false;
        if (condition != venue.condition) return false;
        if (venuename != null ? !venuename.equals(venue.venuename) : venue.venuename != null) return false;
        if (password != null ? !password.equals(venue.password) : venue.password != null) return false;
        if (address != null ? !address.equals(venue.address) : venue.address != null) return false;
        if (phone != null ? !phone.equals(venue.phone) : venue.phone != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = venueid;
        result = 31 * result + (venuename != null ? venuename.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + size;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + condition;
        return result;
    }
}
