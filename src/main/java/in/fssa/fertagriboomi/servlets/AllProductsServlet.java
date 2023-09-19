package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.model.Product;
import in.fssa.fertagriboomi.model.ResponseEntity;
import in.fssa.fertagriboomi.service.ProductService;

/**
 * Servlet implementation class AllProductsServlet
 */
@WebServlet("/Product/all")
public class AllProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> productList;
		try {
			productList = new ProductService().getAllProducts();
			request.setAttribute("PRODUCTLIST", productList);
			
			Gson gson = new Gson();
			ResponseEntity res = new ResponseEntity();
			res.setStatusCode(200);
			res.setData(productList);
			res.setMessage("product details fetched successfully");
			
			String responseJson = gson.toJson(res);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(responseJson);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
//			dispatcher.forward(request, response);
		} catch (ServiceException e) {

			e.printStackTrace();
			throw new ServletException(e);
		}

	}

	

}
