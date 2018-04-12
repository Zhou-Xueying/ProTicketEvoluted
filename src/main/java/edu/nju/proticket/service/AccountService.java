package edu.nju.proticket.service;

public interface AccountService {

    /**
     * pay
     * @param accountId
     * @param password
     * @param price
     * @return
     */
    public boolean pay(int accountId, String password, double price);

    /**
     *
     * @param accountId
     * @param password
     * @param price
     * @return
     */
    public boolean refund(int accountId, String password, double price);

}
