package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.ManagerDao;
import org.springframework.beans.factory.annotation.Autowired;
import edu.nju.proticket.service.ManagerService;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

    @Autowired
    ManagerDao managerDao;

    public boolean login(int managerId, String password) {
        return managerDao.login(managerId,password);
    }
}
