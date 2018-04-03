package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.MemberDao;
import edu.nju.proticket.model.Member;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDaoImpl implements MemberDao {

    @Autowired
    private BaseDao baseDao;

//    public boolean hasRegistered(String email){
//        Session session = baseDao.getSession();
//        String hql = "from members where email =: email";
//        Query query = session.createQuery(hql);
//        query.setParameter("email",email);
//        if(query.list().size()==1) return true;
//        return false;
//    }

    public boolean register(Member member) {
        baseDao.save(member);
        return true;
    }

    public boolean login(String email, String password) {
        Session session = baseDao.getSession();
        String hql = "from Member where email = :email and password = :password and status > 0";
        Query query = session.createQuery(hql);
        query.setParameter("email",email);
        query.setParameter("password",password);
        if(query.list().size()==1) return true;
        return false;
    }

    public Member getProfile(int memberId) {
        Member member = (Member)baseDao.load(Member.class,memberId);
        return member;
    }

    public Member findByEmail(String email) {
        Session session = baseDao.getSession();
        String hql = "from Member where email = :email and status > 0";
        Query query = session.createQuery(hql);
        query.setParameter("email",email);
        if(query.list().size()==1)
            return (Member)query.list().get(0);
        return null;
    }

    public Member findUnvalidatedUserByEmail(String email){
        Session session = baseDao.getSession();
        String hql = "from Member where email = :email and status = 0";
        Query query = session.createQuery(hql);
        query.setParameter("email",email);
        if(query.list().size()==1)
            return (Member)query.list().get(0);
        return null;
    }

    public boolean updateProfile(Member member) {
        baseDao.update(member);
        return true;
    }

    public boolean consumptionsUp(int memberId, double money) {
        return false;
    }

    public boolean levelUp(int memberId) {
        return false;
    }
}
