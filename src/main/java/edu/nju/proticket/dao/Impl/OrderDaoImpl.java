package edu.nju.proticket.dao.Impl;

import edu.nju.proticket.dao.BaseDao;
import edu.nju.proticket.dao.OrderDao;
import edu.nju.proticket.model.Order;
import org.aspectj.weaver.ast.Or;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private BaseDao baseDao;

    public boolean makeOrder(Order order) {
        baseDao.save(order);
        return true;
    }

    public boolean updateOrder(Order order) {
        baseDao.update(order);
        return true;
    }

    public Order getOrderInfo(String orderId) {
        Session session = baseDao.getSession();
        String hql = "from Order where orderid = :orderId";
        Query query = session.createQuery(hql);
        query.setParameter("orderId", orderId);
        List list = query.list();
        if (list.size()==1) return (Order)list.get(0);
        return null;
    }

    public List<Order> getOrderOfMember(int memberId) {
        Session session = baseDao.getSession();
        String hql = "from Order where memberid = :memberId";
        Query query = session.createQuery(hql);
        query.setParameter("memberId",memberId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Order> orders = new ArrayList<Order>();
        for (Object order:list){
            orders.add((Order)order);
        }
        return orders;
    }

    public List<Order> getOrderOfVenue(int venueId) {
        Session session = baseDao.getSession();
        String hql = "from Order where venueid = :venueId";
        Query query = session.createQuery(hql);
        query.setParameter("venueId",venueId);
        List list = query.list();
        if (list.size()==0) return null;
        List<Order> orders = new ArrayList<Order>();
        for (Object order:list){
            orders.add((Order)order);
        }
        return orders;
    }
}
