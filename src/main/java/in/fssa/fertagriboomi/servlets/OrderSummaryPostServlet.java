
package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.service.PriceService;

/**
 * Servlet implementation class OrderSummaryPostServlet
 */
@WebServlet("/product/details/order_summary_post")
public class OrderSummaryPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get product ID and quantity from request parameters
        int productId = Integer.parseInt(request.getParameter("id"));
        int productQty = Integer.parseInt(request.getParameter("quantity"));

        // Initialize price ID with a default value (-1)
        int priceId = 0;

        try {
            // Retrieve the price ID associated with the product
            priceId = new PriceService().getPriceId(productId);
        } catch (ServiceException | ValidationException e) {
            // Handle exceptions (e.g., log or provide an error response)
            e.printStackTrace();
            // You may want to provide an error response to the client here.
        }

	    request.getSession().removeAttribute("ORDERS_DETAILS");
       // request.getSession().invalidate();
        
        if (productId >= 0 && priceId >= 0 && productQty >= 1) {
        	// Retrieve the existing list of order details from the session
        	List<Map<String, Object>> ordersList = (List<Map<String, Object>>) request.getSession().getAttribute("ORDERS_DETAILS");

        	// If the list doesn't exist, create a new one
        	if (ordersList == null) {
        	    ordersList = new ArrayList<>();
        	}

        	// Create a map or object to hold the details for a single order
        	Map<String, Object> orderDetails = new HashMap<>();
        	orderDetails.put("PRODUCT_ID", productId);
        	orderDetails.put("PRICE_ID", priceId);
        	orderDetails.put("PRODUCT_QTY", productQty);

        	// Add the order details to the list
        	ordersList.add(orderDetails);

        	// Set the list as a session attribute
        	request.getSession().setAttribute("ORDERS_DETAILS", ordersList);
        	
        	  response.sendRedirect(request.getContextPath() + "/product/details/order_summary/new_address");

        }
       
    }
}
