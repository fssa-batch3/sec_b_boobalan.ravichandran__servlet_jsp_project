package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.model.RatingsAndReviews;
import in.fssa.fertagriboomi.service.ProductService;
import in.fssa.fertagriboomi.service.ReviewsAndRatingsService;

/**
 * Servlet implementation class ListProductDetailServlet
 */
@WebServlet("/product/details")
public class ListProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		int productId = Integer.parseInt(request.getParameter("product_id"));
		//System.out.print(productId);

		ProductService productService = new ProductService();
		Product product = new Product();

		try {
			product = productService.findProductById(productId);
			List<RatingsAndReviews> reviews = new ReviewsAndRatingsService().findAllRatingsByProductId(productId);
			request.setAttribute("productDetails", product);
			request.setAttribute("REVIEWS", reviews);
			RequestDispatcher rd = request.getRequestDispatcher("/product_details.jsp");
			rd.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e);
		} catch (ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}

}
