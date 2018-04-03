package edu.nju.proticket.dao;

import edu.nju.proticket.model.Order;

import java.util.List;

public interface OrderDao {

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
