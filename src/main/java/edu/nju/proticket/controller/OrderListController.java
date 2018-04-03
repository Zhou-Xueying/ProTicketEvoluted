package edu.nju.proticket.controller;

import edu.nju.proticket.model.Order;
import edu.nju.proticket.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static edu.nju.proticket.controller.CurrentUserController.CURRENT_USER_ID;

@Controller
public class OrderListController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/toMyOrderList", method = RequestMethod.GET)
    public String toMyOrderList(){
        return "orderlist";
    }

    @RequestMapping(value = "/getOrderList", method = RequestMethod.GET)
    public @ResponseBody List<Order> getOrderList(HttpSession session){
        int memberId = (Integer) session.getAttribute(CURRENT_USER_ID);
        List<Order> list = orderService.getOrderOfMember(memberId);
        return list;
    }
}
