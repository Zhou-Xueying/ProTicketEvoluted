package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.ManagerDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDaoImol implements ManagerDao {

    @Autowired
    BaseDao baseDao;

    public boolean login(int managerId, String password) {
        Session session = baseDao.getSession();
        String hql = "from Manager where managerid = :managerId and password = :password";
        Query query = session.createQuery(hql);
        query.setParameter("managerId",managerId);
        query.setParameter("password",password);
        if(query.list().size()==1) return true;
        return false;
    }

}
