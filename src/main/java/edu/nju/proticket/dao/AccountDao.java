package edu.nju.proticket.dao;

import edu.nju.proticket.model.Account;

public interface AccountDao {

    /**
     * access to account
     * @param accountId
     * @param password
     * @return
     */
    public boolean validAccount(int accountId, String password);

    /**
     *
     * @param accountId
     * @return
     */
    public Account getAccountInfo(int accountId);

    /**
     * increase or decreate the rest money in the account
     * @param account
     * @return
     */
    public boolean updateAccount(Account account);
}
