package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.OrderItems;
import in.fssa.fertagriboomi.model.Orders;
import in.fssa.fertagriboomi.service.OrdersService;

/**
 * Servlet implementation class OrderDeliverServlet
 */
@WebServlet("/product/details/order_summary/order_created")
public class OrderDeliverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	// Retrieve the list of order details from the session
        	List<Map<String, Object>> ordersList = (List<Map<String, Object>>) request.getSession().getAttribute("ORDERS_DETAILS");

        	if (ordersList != null && !ordersList.isEmpty()) {
        		   int addressId = Integer.parseInt(request.getParameter("address_id"));
       	        String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
       	        
       	        Orders order = new Orders();
       	        order.setAddressId(addressId);
       	        order.setUserEmail(loggedUserUniqueEmail);
       	        
       	        int orderId =0 ;
				try {
					orderId = new OrdersService().createOrder(order);
					
				} catch (ServiceException | ValidationException e) {
					e.printStackTrace();
					  throw new ServletException(e);
				}
        	    for (Map<String, Object> orderDetails : ordersList) {
        	       
        	        int productId = (int) orderDetails.get("PRODUCT_ID");
        	        int priceId = (int) orderDetails.get("PRICE_ID");
        	        int orderQty = (int) orderDetails.get("PRODUCT_QTY");


        	        OrderItems userOrders = new OrderItems();
        	        userOrders.setPriceId(priceId);
        	      //  userOrders.setAddressId(addressId);
        	        userOrders.setProductId(productId);
        	        userOrders.setQuantity(orderQty);
        	        //userOrders.setUserEmail(loggedUserUniqueEmail);
        	        OrdersService orderService = new OrdersService();

        	        try {
        	            orderService.createOrderItems(orderId, userOrders);
        	        } catch (ServiceException | ValidationException e) {
        	            e.printStackTrace();
        	            throw new ServletException(e);
        	        }
        	    }

        	    // After processing all orders, we have to clear the list 
        	    ordersList.clear();

        	    response.sendRedirect(request.getContextPath() + "/product/details/order_summary/new_address/ordered_successfully");
        	    
        	    String logedUser = "<%=loggedUserUniqueEmail %>";
        	    String jsCode = 
        	        "const logedUser = '" + logedUser + "';" +
        	        "let addToCartItem = JSON.parse(localStorage.getItem('addToCartItem')) || [];" +
        	        "addToCartItem = addToCartItem.filter(item => item.userUniqueId !== logedUser);" +
        	        "localStorage.setItem('addToCartItem', JSON.stringify(addToCartItem));";
        	    response.getWriter().write("<script>" + jsCode + "</script>");
        	} 

           
        } catch (NumberFormatException e) {
            e.printStackTrace(); 
            throw new ServletException(e);
        }
    }
}
