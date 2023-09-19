package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RatingAndReviewsGetServlet
 */
@WebServlet("/my_order/order_details/review_ratings")
public class RatingAndReviewsGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("product_id"));
		int orderItemId = Integer.parseInt(request.getParameter("order_item_id"));
		int orderId = Integer.parseInt(request.getParameter("order_id"));
		String customerName = request.getParameter("name");
		
		request.setAttribute("CUSTOMER_NAME", customerName);
		request.setAttribute("OR_PRODUCT_ID", productId);
		request.setAttribute("OR_ITEM_ID", orderItemId);
		request.setAttribute("ORDER_ID", orderId);
		RequestDispatcher rd = request.getRequestDispatcher("/reviews.jsp");
		rd.forward(request, response);
		
	}

	

}
