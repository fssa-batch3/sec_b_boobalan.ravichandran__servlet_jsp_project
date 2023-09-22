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
import in.fssa.fertagriboomi.model.Orders;
import in.fssa.fertagriboomi.service.OrdersService;

/**
 * Servlet implementation class MyOrdersServlet
 */
@WebServlet("/my_orders")
public class MyOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
		
		try {
			List<Orders> orders = new OrdersService().getAllOrdersByUserId(loggedUserUniqueEmail);
			request.setAttribute("MY_ORDERS", orders);
			//System.out.println(orders);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/my_orders.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			//throw new ServletException(e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/my_orders.jsp");
			dispatcher.forward(request, response);
		
		}
		
	}

	

}
