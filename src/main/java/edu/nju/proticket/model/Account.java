package edu.nju.proticket.model;

import javax.persistence.*;

@Entity
@Table(name = "accounts", schema = "tickets_business")
public class Account {
    private int accountid;
    private String password;
    private double balance;

    @Id
    @Column(name = "accountid")
    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
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
    @Column(name = "balance")
    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        if (accountid != account.accountid) return false;
        if (Double.compare(account.balance, balance) != 0) return false;
        if (password != null ? !password.equals(account.password) : account.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = accountid;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        temp = Double.doubleToLongBits(balance);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
