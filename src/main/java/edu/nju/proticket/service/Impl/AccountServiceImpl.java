package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.AccountDao;
import edu.nju.proticket.model.Account;
import edu.nju.proticket.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl implements AccountService{

    @Autowired
    AccountDao accountDao;

    public boolean pay(int accountId, String password, double price) {
        if(accountDao.validAccount(accountId,password)){
            Account account = accountDao.getAccountInfo(accountId);
            if(account.getBalance()>=price){
                account.setBalance(account.getBalance()-price);
                accountDao.updateAccount(account);
                return true;
            }
        }
        return false;
    }

    public boolean refund(int accountId, String password, double price) {
        if(accountDao.validAccount(accountId,password)){
            Account account = accountDao.getAccountInfo(accountId);
            account.setBalance(account.getBalance()+price);
            accountDao.updateAccount(account);
            return true;
        }
        return false;
    }
}
