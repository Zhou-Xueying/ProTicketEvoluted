package edu.nju.proticket.service.Impl;

import edu.nju.proticket.dao.OrderDao;
import edu.nju.proticket.model.Order;
import edu.nju.proticket.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;

    public boolean makeOrder(Order order) {
        return orderDao.makeOrder(order);
    }

    public boolean updateOrder(Order order) {
        return orderDao.updateOrder(order);
    }

    public Order getOrderInfo(String orderId) {
        return orderDao.getOrderInfo(orderId);
    }

    public List<Order> getOrderOfMember(int memberId) {
        return orderDao.getOrderOfMember(memberId);
    }

    public List<Order> getOrderOfVenue(int venueId) {
        return orderDao.getOrderOfVenue(venueId);
    }
}
