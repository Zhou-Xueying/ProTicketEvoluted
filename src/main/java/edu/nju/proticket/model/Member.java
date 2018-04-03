package edu.nju.proticket.model;

import org.hibernate.annotations.Generated;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "members", schema = "tickets_business")
public class Member {
    private int userid;
    private String email;
    private String password;
    private String username;
    private double consumptions;
    private int level;
    private int status;
    private String validatecode;

    @Id
    @Column(name = "userid")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "consumptions")
    public double getConsumptions() {
        return consumptions;
    }

    public void setConsumptions(double consumptions) {
        this.consumptions = new BigDecimal(consumptions).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    }

    @Basic
    @Column(name = "level")
    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @Basic
    @Column(name = "status")
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "validatecode")
    public String getValidatecode() {
        return validatecode;
    }

    public void setValidatecode(String validatecode) {
        this.validatecode = validatecode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Member member = (Member) o;

        if (userid != member.userid) return false;
        if (Double.compare(member.consumptions, consumptions) != 0) return false;
        if (level != member.level) return false;
        if (status != member.status) return false;
        if (email != null ? !email.equals(member.email) : member.email != null) return false;
        if (password != null ? !password.equals(member.password) : member.password != null) return false;
        if (username != null ? !username.equals(member.username) : member.username != null) return false;
        if (validatecode != null ? !validatecode.equals(member.validatecode) : member.validatecode != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = userid;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (username != null ? username.hashCode() : 0);
        temp = Double.doubleToLongBits(consumptions);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + level;
        result = 31 * result + status;
        result = 31 * result + (validatecode != null ? validatecode.hashCode() : 0);
        return result;
    }
}
