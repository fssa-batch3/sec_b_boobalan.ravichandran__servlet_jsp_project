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
import in.fssa.fertagriboomi.model.Stocks;
import in.fssa.fertagriboomi.service.StockService;

/**
 * Servlet implementation class AddNewStockServlet
 */
@WebServlet("/product/stock")
public class AddNewStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId = Integer.parseInt(request.getParameter("id"));
		int stockCount = Integer.parseInt(request.getParameter("stock_count"));
		
	StockService stockService = new StockService();
		
		Stocks stock = new Stocks();
		stock.setProductId(productId);
		stock.setStockCount(stockCount);
		PrintWriter out = response.getWriter();
		try {
			stockService.updateStock(stock);
			out.println("New Stock added successfully");
			response.sendRedirect(request.getContextPath() + "/get_all_products_admin");
		} catch (ServiceException | ValidationException e) {
			//e.printStackTrace();
			request.setAttribute("ADDSTOCKCOUNT", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("edit?product_id=" + productId);
			rd.forward(request, response);

		}
	}

}
