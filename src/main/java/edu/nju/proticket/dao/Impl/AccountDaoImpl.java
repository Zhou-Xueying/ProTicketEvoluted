package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.AccountDao;
import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.model.Account;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDaoImpl implements AccountDao {

    @Autowired
    private BaseDao baseDao;

    public boolean validAccount(int accountId, String password) {
        Session session = baseDao.getSession();
        String hql = "from Account where accountid = :accountId and password = :password";
        Query query = session.createQuery(hql);
        query.setParameter("accountId",accountId);
        query.setParameter("password",password);
        if(query.list().size()==1) return true;
        return false;
    }

    public Account getAccountInfo(int accountId) {
        Account account = (Account) baseDao.load(Account.class, accountId);
        return account;
    }

    public boolean updateAccount(Account account) {
        baseDao.update(account);
        return true;
    }

}
