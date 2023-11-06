package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import in.fssa.fertagriboomi.service.PriceService;
import in.fssa.fertagriboomi.util.JSONUtil;

/**
 * Servlet implementation class AddToCartToAddressServlet
 */
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/product/details/add_to_cart_post")
public class AddToCartToAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        try {
            // Retrieve the JSON data from the request
            HttpSession session = request.getSession();
            List<Map<String, Object>> productsInOrder = JSONUtil.getJSONArray(request, "productsInOrder");
            session.setAttribute("productsInOrder", productsInOrder);
        
            List<Map<String, Object>> ordersList = new ArrayList<>(); // Initialize outside the loop

            if (productsInOrder != null) {
                // Loop through the list and process order details
                for (Map<String, Object> productData : productsInOrder) {
                    String productIdStr = (String) productData.get("productId");
                    Integer productId = Integer.parseInt(productIdStr);
                    Integer quantity = (Integer) productData.get("quantity");
                    int priceId = new PriceService().getPriceId(productId);

                    // Check if the data is valid
                    if (productId >= 0 && priceId >= 0 && quantity >= 1) {
                        // Create a map to hold the details for a single order
                        Map<String, Object> orderDetails = new HashMap<>();
                        orderDetails.put("PRODUCT_ID", productId);
                        orderDetails.put("PRICE_ID", priceId);
                        orderDetails.put("PRODUCT_QTY", quantity);

                        // Add the order details to the list
                        ordersList.add(orderDetails);
                    }
                }

                // Set the ordersList in the session after processing all products
                request.getSession().setAttribute("ORDERS_DETAILS", ordersList);

                // Redirect to the order summary page
                response.sendRedirect(request.getContextPath() + "/product/details/order_summary/new_address");
            }

            // Respond with a success message
            PrintWriter out = response.getWriter();
            out.println("Order placed successfully.");

        } catch (Exception e) {
            // Handle exceptions and respond with an error message
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(e.getMessage());
        }
    }
}


