package edu.nju.proticket.controller;

import edu.nju.proticket.model.Member;
import edu.nju.proticket.model.Order;
import edu.nju.proticket.model.Venue;
import edu.nju.proticket.service.AccountService;
import edu.nju.proticket.service.MemberService;
import edu.nju.proticket.service.OrderService;
import edu.nju.proticket.service.VenueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Timestamp;

@Controller
public class PayController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private MemberService memberService;
    @Autowired
    private VenueService venueService;

    @RequestMapping(value = "/pay", method = RequestMethod.POST)
    public String pay(HttpServletRequest request){
        String orderId = request.getParameter("orderId");
        Order order = orderService.getOrderInfo(orderId);
        Long now = System.currentTimeMillis();
        Timestamp timestamp = order.getTimestamp();
        System.out.println(timestamp);
        long time = timestamp.getTime();
        System.out.println(time);
        System.out.println(now);
        long dateDiff= now - time;
        if(dateDiff > 1000*60){
            return "redirect:/timeOver.form?orderId="+orderId;
        }
        int accountId = Integer.valueOf(request.getParameter("accountId"));
        String password = request.getParameter("password");
        double price = Double.valueOf(request.getParameter("price"));
        if(accountService.pay(accountId, password, price)){
            //change order status
            order.setCondition(1);
            orderService.updateOrder(order);
            //member consumptions up && level up
            Member member = memberService.getProfile((Integer) request.getSession().getAttribute("CURRENT_USER_ID"));
            member.setConsumptions(member.getConsumptions()+price);
            member.setLevel(memberService.level(member.getConsumptions()));
            memberService.updateProfile(member);
            Venue venue = venueService.getVenueInfo(order.getVenueid());
            venue.setOrdercount(venue.getOrdercount()+1);
            venue.setTicketcount(venue.getTicketcount()+order.getTicketnumber());
            venue.setIncome(venue.getIncome()+order.getTotalPrice());
            venueService.updateVenueInfo(venue);
            return"pay/pay_success";
        }
        return "pay/pay_failure";
    }

    @RequestMapping(value = "/timeOver", method = RequestMethod.GET)
    public String timeOver(@RequestParam("orderId") String orderId){
        Order order = orderService.getOrderInfo(orderId);
        order.setCondition(-1);
        orderService.updateOrder(order);
        return "pay/time_over";
    }

    @RequestMapping(value = "/toPay", method = RequestMethod.GET)
    public String toPay(@RequestParam("orderId") String orderId, Model model){
        Order order = orderService.getOrderInfo(orderId);
        model.addAttribute("order",order);
        return "pay";
    }

    @RequestMapping(value = "/toGetMoneyBack", method = RequestMethod.GET)
    public String toGetMoneyBack(@RequestParam("orderId") String orderId, Model model, HttpServletRequest request){
        Order order = orderService.getOrderInfo(orderId);
        model.addAttribute("order",order);
        Long now = System.currentTimeMillis();
        Timestamp timestamp = order.getDatetime();
        long time=timestamp.getTime();   //获取指定时间的毫秒数
        long dateDiff=time - now;
        System.out.println(dateDiff);
        long days = dateDiff/(1000*60*60*24);
        System.out.println(days);
        double discount = 0.0;
        if( days>=14 ){
            discount = 1.0;
        }else if( days>=7 ){
            discount = 0.9;
        }else if( days>=3 ){
            discount = 0.8;
        }
        double money = new BigDecimal(order.getTotalPrice() * discount).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        System.out.println(money);
        request.setAttribute("money", money);
        return "refund";
    }

    @RequestMapping(value = "/refund", method = RequestMethod.POST)
    public String refund(HttpServletRequest request){
        Integer accountId = Integer.valueOf(request.getParameter("accountId"));
        String password = request.getParameter("password");
        double price = Double.valueOf(request.getParameter("price"));
        if(accountService.refund(accountId, password, price)){
            //change order status
            String orderId = request.getParameter("orderId");
            Order order = orderService.getOrderInfo(orderId);
            order.setCondition(-1);
            orderService.updateOrder(order);
            //member consumptions up && level up
            Member member = memberService.getProfile((Integer) request.getSession().getAttribute("CURRENT_USER_ID"));
            member.setConsumptions(member.getConsumptions()-price);
            member.setLevel(memberService.level(member.getConsumptions()));
            memberService.updateProfile(member);
            Venue venue = venueService.getVenueInfo(order.getVenueid());
            venue.setOrdercount(venue.getOrdercount()-1);
            venue.setTicketcount(venue.getTicketcount()-order.getTicketnumber());
            venue.setIncome(venue.getIncome()-order.getTotalPrice());
            venueService.updateVenueInfo(venue);
            return"pay/refund_success";
        }
        return "pay/refund_failure";
    }
}
