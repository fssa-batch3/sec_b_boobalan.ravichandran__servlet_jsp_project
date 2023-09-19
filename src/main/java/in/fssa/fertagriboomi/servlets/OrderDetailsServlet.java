package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.DeliveryAddresses;
import in.fssa.fertagriboomi.model.OrderItems;
import in.fssa.fertagriboomi.model.Orders;
import in.fssa.fertagriboomi.service.DeliveryAddressService;
import in.fssa.fertagriboomi.service.OrdersService;

/**
 * Servlet implementation class OrderDetailsServlet
 */
@WebServlet("/order/order_details")
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   int orderId = Integer.parseInt(request.getParameter("order_id"));
			
		   try {
			int addressId = new OrdersService().getAddressIdByOrderId(orderId);
			Orders order = new OrdersService().findOrderIdByOrderId(orderId);
			DeliveryAddresses address = new DeliveryAddressService().findAddressById(addressId);
			
			List<OrderItems> orderItemsList = new OrdersService().findAllOrderItemsByOrderId(orderId);
			//System.out.println(orderItemsList);
			request.setAttribute("ORDERS", order);
			request.setAttribute("ORDER_ITEMS_LIST", orderItemsList);
			request.setAttribute("ADDRESS_DETAILS", address);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/order_details.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e.getMessage());
		}
		
		}


}
