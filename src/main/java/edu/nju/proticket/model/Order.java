package edu.nju.proticket.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "orders", schema = "tickets_business")
public class Order {

    private String orderid;
    private int memberid;
    private int eventid;
    private String title;
    private int venueid;
    private Timestamp datetime;
    private int seatchoice;//0:not choose; 1:choose
    private int ticketnumber;
    private int price;
    private double totalPrice;
    private int condition;//0:not paid; 1:paid; -1:canceled; 2:used
    private Integer seat1Id;
    private Integer seat2Id;
    private Integer seat3Id;
    private Integer seat4Id;
    private Integer seat5Id;
    private Integer seat6Id;

    @Id
    @Column(name = "orderid")
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    @Basic
    @Column(name = "memberid")
    public int getMemberid() {
        return memberid;
    }

    public void setMemberid(int memberid) {
        this.memberid = memberid;
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
    @Column(name="title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    @Column(name = "seatchoice")
    public int getSeatchoice() {
        return seatchoice;
    }

    public void setSeatchoice(int seatchoice) {
        this.seatchoice = seatchoice;
    }

    @Basic
    @Column(name = "ticketnumber")
    public int getTicketnumber() {
        return ticketnumber;
    }

    public void setTicketnumber(int ticketnumber) {
        this.ticketnumber = ticketnumber;
    }

    @Basic
    @Column(name = "price")
    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    @Basic
    @Column(name = "datetime")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    @Basic
    @Column(name = "totalprice")
    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
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
    @Column(name = "seat1id")
    public Integer getSeat1Id() {
        return seat1Id;
    }

    public void setSeat1Id(Integer seat1Id) {
        this.seat1Id = seat1Id;
    }

    @Basic
    @Column(name = "seat2id")
    public Integer getSeat2Id() {
        return seat2Id;
    }

    public void setSeat2Id(Integer seat2Id) {
        this.seat2Id = seat2Id;
    }

    @Basic
    @Column(name = "seat3id")
    public Integer getSeat3Id() {
        return seat3Id;
    }

    public void setSeat3Id(Integer seat3Id) {
        this.seat3Id = seat3Id;
    }

    @Basic
    @Column(name = "seat4id")
    public Integer getSeat4Id() {
        return seat4Id;
    }

    public void setSeat4Id(Integer seat4Id) {
        this.seat4Id = seat4Id;
    }

    @Basic
    @Column(name = "seat5id")
    public Integer getSeat5Id() {
        return seat5Id;
    }

    public void setSeat5Id(Integer seat5Id) {
        this.seat5Id = seat5Id;
    }

    @Basic
    @Column(name = "seat6id")
    public Integer getSeat6Id() {
        return seat6Id;
    }

    public void setSeat6Id(Integer seat6Id) {
        this.seat6Id = seat6Id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Order order = (Order) o;

        if (memberid != order.memberid) return false;
        if (eventid != order.eventid) return false;
        if (venueid != order.venueid) return false;
        if (seatchoice != order.seatchoice) return false;
        if (ticketnumber != order.ticketnumber) return false;
        if (price != order.price) return false;
        if (condition != order.condition) return false;
        if (Double.compare(order.totalPrice, totalPrice) != 0) return false;
        if (orderid != null ? !orderid.equals(order.orderid) : order.orderid != null) return false;
        if (datetime != null ? !datetime.equals(order.datetime) : order.datetime != null) return false;
        if (seat1Id != null ? !seat1Id.equals(order.seat1Id) : order.seat1Id != null) return false;
        if (seat2Id != null ? !seat2Id.equals(order.seat2Id) : order.seat2Id != null) return false;
        if (seat3Id != null ? !seat3Id.equals(order.seat3Id) : order.seat3Id != null) return false;
        if (seat4Id != null ? !seat4Id.equals(order.seat4Id) : order.seat4Id != null) return false;
        if (seat5Id != null ? !seat5Id.equals(order.seat5Id) : order.seat5Id != null) return false;
        if (seat6Id != null ? !seat6Id.equals(order.seat6Id) : order.seat6Id != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = orderid != null ? orderid.hashCode() : 0;
        result = 31 * result + memberid;
        result = 31 * result + eventid;
        result = 31 * result + venueid;
        result = 31 * result + seatchoice;
        result = 31 * result + ticketnumber;
        result = 31 * result + price;
        result = 31 * result + (datetime != null ?datetime.hashCode() : 0);
        temp = Double.doubleToLongBits(totalPrice);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + condition;
        result = 31 * result + (seat1Id != null ? seat1Id.hashCode() : 0);
        result = 31 * result + (seat2Id != null ? seat2Id.hashCode() : 0);
        result = 31 * result + (seat3Id != null ? seat3Id.hashCode() : 0);
        result = 31 * result + (seat4Id != null ? seat4Id.hashCode() : 0);
        result = 31 * result + (seat5Id != null ? seat5Id.hashCode() : 0);
        result = 31 * result + (seat6Id != null ? seat6Id.hashCode() : 0);
        return result;
    }
}
