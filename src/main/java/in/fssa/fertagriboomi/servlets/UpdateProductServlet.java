package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class UpdateProductServlet
 */

@WebServlet("/product/update")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));

		String weight = request.getParameter("product_weight");
		String description = request.getParameter("description");
		String application = request.getParameter("application");
		String benefits = request.getParameter("benefits");
		String imageUrl = request.getParameter("image_url");

		ProductService productService = new ProductService();

		Product product = new Product();
		product.setProductWeight(weight);
		product.setDescription(description);
		product.setApplication(application);
		product.setBenefits(benefits);
		product.setImageURL(imageUrl);
		PrintWriter out = response.getWriter();

		
		try {
			productService.updateProduct(productId, product);
			out.println("Product updated successfully");
			response.sendRedirect(request.getContextPath() + "/products");
			
		} catch (ServiceException e) {
			e.printStackTrace();
			out.println(e.getMessage());
			throw new ServletException(e);
		} catch (ValidationException e) {
			e.printStackTrace();
			out.println(e.getMessage());
			throw new ServletException(e);
		}

	}

}
