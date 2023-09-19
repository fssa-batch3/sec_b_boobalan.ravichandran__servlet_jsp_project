package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.service.OrdersService;

/**
 * Servlet implementation class CancellOrderServlet
 */
@WebServlet("/order_details/cancel_order")
public class CancellOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int orderId = Integer.parseInt(request.getParameter("order_id"));
		  
		  try {
			new OrdersService().cancellOrderByOrderId(orderId);
			RequestDispatcher rd = request.getRequestDispatcher("/order/order_details?order_id="+ orderId);
			rd.forward(request, response);
		  } catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	
	}


}
