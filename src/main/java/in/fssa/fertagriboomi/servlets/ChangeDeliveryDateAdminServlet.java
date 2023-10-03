package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.service.OrdersService;

/**
 * Servlet implementation class ChangeDeliveryDateAdminServlet
 */
@WebServlet("/change_delivery_date")
public class ChangeDeliveryDateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(request.getParameter("order-id"));
		String deliveryDate = request.getParameter("delivery-date");
		
	
			try {
				new OrdersService().changeDeliveryDate(deliveryDate, orderId);
				  response.sendRedirect(request.getContextPath() + "/all_orders");
			} catch (ServiceException | ParseException e) {
				e.printStackTrace();
				throw new ServletException(e.getMessage());
			}
		
		
	}

}
