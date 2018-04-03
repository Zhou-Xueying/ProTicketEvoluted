package edu.nju.proticket.service;

import edu.nju.proticket.model.Order;
import org.springframework.stereotype.Service;

import java.util.List;

public interface OrderService {

    /**
     *
     * @param order
     * @return
     */
    public boolean makeOrder(Order order);

    /**
     *
     * @param order
     * @return
     */
    public boolean updateOrder(Order order);

    /**
     *
     * @param orderId
     * @return
     */
    public Order getOrderInfo(String orderId);

    /**
     *
     * @param memberId
     * @return
     */
    public List<Order> getOrderOfMember(int memberId);

    /**
     *
     * @param venueId
     * @return
     */
    public List<Order> getOrderOfVenue(int venueId);

}
