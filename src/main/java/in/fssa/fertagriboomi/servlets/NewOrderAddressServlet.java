package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.DeliveryAddresses;
import in.fssa.fertagriboomi.service.DeliveryAddressService;

/**
 * Servlet implementation class NewOrderAddressServlet
 */
@WebServlet("/product/details/order_summary/new_address")
public class NewOrderAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
		DeliveryAddressService deliveryAddress = new DeliveryAddressService();
		try {
			List<DeliveryAddresses> userAddresses = deliveryAddress.findAllAddressesByUserEmail(loggedUserUniqueEmail);
			request.setAttribute("LOGGED_USER_ADDRESSES", userAddresses);
			RequestDispatcher rd = request.getRequestDispatcher("/order_address.jsp");
			rd.forward(request, response);

		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
