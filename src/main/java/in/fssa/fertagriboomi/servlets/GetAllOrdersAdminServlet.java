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
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.service.OrdersService;
import in.fssa.fertagriboomi.service.ProductService;

/**
 * Servlet implementation class GetAllOrdersAdminServlet
 */
@WebServlet("/all_orders")
public class GetAllOrdersAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 OrdersService orderService = new OrdersService();
		 List<Orders> ordersList = null;
		try {
			
			ordersList = orderService.getAllOrdersId();
	
			request.setAttribute("ORDERS_LIST", ordersList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/all_orders.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException | ValidationException e) {

			e.printStackTrace();
			throw new ServletException(e);
		}

	}

	
}
