package edu.nju.proticket.model;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "events", schema = "tickets_business")
public class Event {
    private int eventid;
    private int venueid;
    private String title;
    private Timestamp time;
    private String city;
    private String venueName;
    private String type;
    private String description;
    private int condition;
    private int price1;
    private int price2;
    private int price3;
    private int price4;
    private int price5;
    private String imgUrl;

    @Id
    @Column(name = "eventid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "time")
    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Basic
    @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Basic
    @Column(name = "venuename")
    public String getVenueName() {
        return venueName;
    }

    public void setVenueName(String venueName) {
        this.venueName = venueName;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    @Column(name = "price1")
    public int getPrice1() {
        return price1;
    }

    public void setPrice1(int price1) {
        this.price1 = price1;
    }

    @Basic
    @Column(name = "price2")
    public int getPrice2() {
        return price2;
    }

    public void setPrice2(int price2) {
        this.price2 = price2;
    }

    @Basic
    @Column(name = "price3")
    public int getPrice3() {
        return price3;
    }

    public void setPrice3(int price3) {
        this.price3 = price3;
    }

    @Basic
    @Column(name = "price4")
    public int getPrice4() {
        return price4;
    }

    public void setPrice4(int price4) {
        this.price4 = price4;
    }

    @Basic
    @Column(name = "price5")
    public int getPrice5() {
        return price5;
    }

    public void setPrice5(int price5) {
        this.price5 = price5;
    }

    @Basic
    @Column(name = "imgurl")
    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Event event = (Event) o;

        if (eventid != event.eventid) return false;
        if (venueid != event.venueid) return false;
        if (condition != event.condition) return false;
        if (price1 != event.price1) return false;
        if (price2 != event.price2) return false;
        if (price3 != event.price3) return false;
        if (price4 != event.price4) return false;
        if (price5 != event.price5) return false;
        if (title != null ? !title.equals(event.title) : event.title != null) return false;
        if (type != null ? !type.equals(event.type) : event.type != null) return false;
        if (time != null ? !time.equals(event.time) : event.time != null) return false;
        if (city != null ? !city.equals(event.city) : event.city != null) return false;
        if (venueName != null ? !venueName.equals(event.venueName) : event.venueName != null) return false;
        if (description != null ? !description.equals(event.description) : event.description != null) return false;
        if (imgUrl != null ? !imgUrl.equals(event.imgUrl) : event.imgUrl != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = eventid;
        result = 31 * result + venueid;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        result = 31 * result + (city != null ? city.hashCode() : 0);
        result = 31 * result + (venueName != null ? venueName.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + condition;
        result = 31 * result + price1;
        result = 31 * result + price2;
        result = 31 * result + price3;
        result = 31 * result + price4;
        result = 31 * result + price5;
        result = 31 * result + (imgUrl != null ? imgUrl.hashCode() : 0);
        return result;
    }
}
