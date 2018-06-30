package edu.nju.proticket.controller;

import edu.nju.proticket.model.Order;
import edu.nju.proticket.service.EventService;
import edu.nju.proticket.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_ID;
import static edu.nju.proticket.controller.VenueController.CURRENT_VENUE_ID;

@Controller
public class OrderListController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private EventService eventService;
    @RequestMapping(value = "/toMyOrderList", method = RequestMethod.GET)
    public String toMyOrderList(HttpSession session){
        int memberId = (Integer) session.getAttribute(CURRENT_USER_ID);
        List<Order> list = orderService.getOrderOfMember(memberId);
        int page=1;
        int totalUsers=0;
        if(list!=null){
        totalUsers =list.size();}
        int usersPerPage=5;
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (page - 1) * usersPerPage;
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers){ endIndex = totalUsers;}


        session.setAttribute("totalUsers",totalUsers);
        session.setAttribute("totalPages",totalPages);
        session.setAttribute("usersPerPage",usersPerPage);
        session.setAttribute("page",page);
        return "orderlist";
    }
    @RequestMapping(value = "/toThePage", method = RequestMethod.GET)
    public String toThePage(@RequestParam("page") int page,HttpSession session){
        session.setAttribute("page",page);
        return "orderlist";
    }

    @RequestMapping(value = "/getOrderList", method = RequestMethod.GET)
    public @ResponseBody List<Order> getOrderList(HttpSession session){
        int memberId = (Integer) session.getAttribute(CURRENT_USER_ID);
        List<Order> list = orderService.getOrderOfMember(memberId);
        for(int i=0;i<list.size();i++){
            int id=list.get(i).getEventid();
            System.out.println(id);
            String img=eventService.getEvent(id).getImgUrl();
            list.get(i).setImgUrl(img);
        }
        for(int i=0;i<list.size();i++){
            for(int t=0;t<list.size()-i-1;t++){
                if(list.get(t).getTimestamp().before(list.get(t+1).getTimestamp())){
                    Order temp=list.get(t);
                    list.set(t,list.get(t+1));
                    list.set(t+1,temp);
                    }
            }
        }
        return list;
    }

    @RequestMapping(value = "/toCheckTicket", method = RequestMethod.GET)
    public String toCheck(){
        return "checkTicket";
    }

    @RequestMapping(value = "/checkTicket", method = RequestMethod.POST)
    public String check(@RequestParam("orderId") String orderId, HttpSession session, Model model){
        if(orderService.getOrderInfo(orderId)!=null){
            Order order = orderService.getOrderInfo(orderId);
            if(order.getCondition()==1 && order.getVenueid()==(Integer) session.getAttribute(CURRENT_VENUE_ID)){
                order.setCondition(2);
                orderService.updateOrder(order);
                model.addAttribute("order", order);
                return "check/check_success";
            }
        }
        return "check/check_failure";
    }
}
