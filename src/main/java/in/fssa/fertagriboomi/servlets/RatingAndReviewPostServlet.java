package in.fssa.fertagriboomi.servlets;



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.RatingsAndReviews;
import in.fssa.fertagriboomi.service.ReviewsAndRatingsService;

/**
 * Servlet implementation class RatingAndReviewPostServlet
 */
@WebServlet("/my_order/order_details/review_ratings_create")
public class RatingAndReviewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ratings = Integer.parseInt(request.getParameter("rating"));
		String customerName = request.getParameter("customer_name");
		String feedBack = request.getParameter("feedback_pro");
		int orderItemId = Integer.parseInt(request.getParameter("order_item"));
		int productId = Integer.parseInt(request.getParameter("product_id"));
		int orderId = Integer.parseInt(request.getParameter("order_id"));
		
		ReviewsAndRatingsService reviewService = new ReviewsAndRatingsService();

		RatingsAndReviews reviews = new RatingsAndReviews();
		reviews.setOrderItemId(orderItemId);
		reviews.setProductId(productId);
		reviews.setRatings(ratings);
		reviews.setReviews(feedBack);
		reviews.setUserName(customerName);
		
			try {
				reviewService.createRatingsAndReviews(reviews);
				response.sendRedirect(request.getContextPath() + "/order/order_details?order_id="+orderId);
			} catch (ServiceException | ValidationException e) {
				e.printStackTrace();
				throw new ServletException(e.getMessage());
			}
	
	}

}
