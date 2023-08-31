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
import in.fssa.fertagriboomi.model.Price;
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.service.ProductService;

@WebServlet("/product/create")
public class CreateProductServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Product product = new Product();
		String name = request.getParameter("name");
		String weight = request.getParameter("product_weight");
		String benefits = request.getParameter("benefits");
		String description = request.getParameter("description");
		String application = request.getParameter("application");
		String manufacture = request.getParameter("manufacture");
		int category = Integer.parseInt(request.getParameter("product_category"));
		;
		String image_url = request.getParameter("image_url");
		int price = Integer.parseInt(request.getParameter("price"));

		product.setName(name);
		product.setProductWeight(weight);
		product.setBenefits(benefits);
		product.setApplication(application);
		product.setDescription(description);
		product.setManufacture(manufacture);
		product.setImageURL(image_url);
		product.setCategoryId(category);

		Price priceList = new Price();
		priceList.setPrice(price);
		product.setPrice(priceList);

		ProductService productService = new ProductService();
		PrintWriter out = response.getWriter();

		try {

			productService.createProduct(product);
			out.println("Product created successfully");
			response.sendRedirect(request.getContextPath() + "/products");

		} catch (ServiceException | ValidationException e) {

			e.printStackTrace();
			out.println(e.getMessage());

		}
	}
}
