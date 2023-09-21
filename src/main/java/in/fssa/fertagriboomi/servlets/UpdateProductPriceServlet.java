package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.Price;
import in.fssa.fertagriboomi.service.PriceService;

/**
 * Servlet implementation class UpdateProductPriceServlet
 */
@WebServlet("/product/price")
public class UpdateProductPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));
		int productPrice = Integer.parseInt(request.getParameter("price"));
		int productDiscount = Integer.parseInt(request.getParameter("discount"));
		PriceService priceService = new PriceService();
		Price price = new Price();
		PrintWriter out = response.getWriter();
		price.setPrice(productPrice);
		price.setDiscount(productDiscount);
		int priceValue = price.getPrice();
		int discountValue = price.getDiscount();
		try {
			priceService.updatePrice(productId, priceValue, discountValue);
			out.println("Product Price updated successfully");
			response.sendRedirect(request.getContextPath() + "/get_all_products_admin");
		} catch (ServiceException | ValidationException e) {

			request.setAttribute("PRICEERRORDETAILS", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("edit?product_id=" + productId);
			rd.forward(request, response);

		}

	}

}
