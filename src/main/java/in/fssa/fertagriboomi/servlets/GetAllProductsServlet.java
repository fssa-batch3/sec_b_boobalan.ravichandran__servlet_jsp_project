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

import com.google.gson.Gson;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.Price;
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.service.PriceService;
import in.fssa.fertagriboomi.service.ProductService;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/index")
public class GetAllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Product> productList;
		try {
			productList = new ProductService().getAllProducts();
			request.setAttribute("PRODUCTLIST", productList);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {

			e.printStackTrace();
			throw new ServletException(e);
		}

	}

}
