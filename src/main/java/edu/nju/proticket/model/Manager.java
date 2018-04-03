package edu.nju.proticket.model;

import javax.persistence.*;

@Entity
@Table(name = "managers", schema = "tickets_business")
public class Manager {
    private int managerid;
    private String managername;
    private String password;

    @Id
    @Column(name = "managerid")
    public int getManagerid() {
        return managerid;
    }

    public void setManagerid(int managerid) {
        this.managerid = managerid;
    }

    @Basic
    @Column(name = "managername")
    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Manager manager = (Manager) o;

        if (managerid != manager.managerid) return false;
        if (managername != null ? !managername.equals(manager.managername) : manager.managername != null)
            return false;
        if (password != null ? !password.equals(manager.password) : manager.password != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = managerid;
        result = 31 * result + (managername != null ? managername.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
