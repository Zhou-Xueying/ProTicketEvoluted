package edu.nju.proticket.controller;

import edu.nju.proticket.model.Event;
import edu.nju.proticket.model.Member;
import edu.nju.proticket.model.Order;
import edu.nju.proticket.service.EventService;
import edu.nju.proticket.service.MemberService;
import edu.nju.proticket.service.OrderService;
import edu.nju.proticket.utils.CreateId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.criteria.CriteriaBuilder;
import java.math.BigDecimal;
import java.text.DecimalFormat;

@Controller
public class PurchaseController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private EventService eventService;
    @Autowired
    private MemberService memberService;

//    @RequestMapping(value="/makeOrderWithoutSeatChoice")
//    public String makeOrder(@RequestParam("memberid") Integer memberId,
//                            @RequestParam("eventid") String eventId,
//                            @RequestParam("venueid") String venueId,
//                            @RequestParam("ticketnumber") String ticketNum,
//                            @RequestParam("price") String price, Model model){
//        Event event = eventService.getEvent(Integer.parseInt(eventId));
//        Order order = new Order();
//        order.setOrderid(CreateId.createOrderId(memberId));
//        order.setEventid(Integer.parseInt(eventId));
//        order.setMemberid(memberId);
//        order.setVenueid(Integer.parseInt(venueId));
//        order.setPrice(Integer.parseInt(price));
//        order.setTicketnumber(Integer.parseInt(ticketNum));
//        order.setCondition(0);
//        Member member = memberService.getProfile(memberId);
//        double discount = memberService.discount(member.getLevel());
//        double totalPrice = order.getPrice() * order.getTicketnumber() * discount;
//        order.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
//        order.setOrderid(CreateId.createOrderId(memberId));
//        order.setTitle(event.getTitle());
//        order.setDatetime(event.getTime());
//        orderService.makeOrder(order);
//        model.addAttribute("order",order);
//        return "pay";
//    }

    @RequestMapping(value="/makeOrderWithoutSeatChoice")
    public String makeOrder(@RequestParam("memberid") Integer memberId,
                            @RequestParam("eventid") String eventId,
                            @RequestParam("venueid") String venueId,
                            @RequestParam("ticketnumber") String ticketNum,
                            @RequestParam("price") String price, Model model){
        Event event = eventService.getEvent(Integer.parseInt(eventId));
        Order order = new Order();
        order.setOrderid(CreateId.createOrderId(memberId));
        order.setEventid(Integer.parseInt(eventId));
        order.setMemberid(memberId);
        order.setVenueid(Integer.parseInt(venueId));
        order.setPrice(Integer.parseInt(price));
        order.setTicketnumber(Integer.parseInt(ticketNum));
        order.setCondition(1);
        Member member = memberService.getProfile(memberId);
        double discount = memberService.discount(member.getLevel());
        double totalPrice = order.getPrice() * order.getTicketnumber() * discount;
        order.setTotalPrice(new BigDecimal(totalPrice).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
        order.setOrderid(CreateId.createOrderId(memberId));
        order.setTitle(event.getTitle());
        order.setDatetime(event.getTime());
        orderService.makeOrder(order);
        model.addAttribute("order",order);
        return "";
    }

//    @RequestMapping(value = "/changeOrderConditionToPaid")
//    public String changeOrderConditionToPaid(@RequestParam("orderId") String orderId){
//        Order order = orderService.getOrderInfo(orderId);
//        order.setCondition(1);
//        orderService.updateOrder(order);
//        return "orderlist";
//    }
//
//    @RequestMapping(value = "/changeOrderConditionToFailed")
//    public String changeOrderConditionToFailed(@RequestParam("orderId") String orderId){
//        Order order = orderService.getOrderInfo(orderId);
//        order.setCondition(-1);
//        orderService.updateOrder(order);
//        return "orderlist";
//    }
}
