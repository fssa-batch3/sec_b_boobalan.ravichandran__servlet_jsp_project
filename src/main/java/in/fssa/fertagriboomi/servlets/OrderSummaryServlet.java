package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.service.ProductService;

/**
 * Servlet implementation class OrderSummaryServlet
 */
@WebServlet("/product/details/order_summary")
public class OrderSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("product_id"));
		try {
			Product product = new ProductService().findProductById(id);
			request.setAttribute("PRODUCT_DETAILS", product);
			RequestDispatcher rd = request.getRequestDispatcher("/order_summary.jsp");
			rd.forward(request, response);

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();

		}

		
	}


}
