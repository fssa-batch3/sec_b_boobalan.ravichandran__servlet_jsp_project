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
import in.fssa.fertagriboomi.model.User;
import in.fssa.fertagriboomi.service.DeliveryAddressService;
import in.fssa.fertagriboomi.service.UserService;

/**
 * Servlet implementation class ProfileDetailsServlet
 */
@WebServlet("/profile_details")
public class ProfileDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	  String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
		try {
			User userDetails = new UserService().findByEmail(loggedUserUniqueEmail);
			List<DeliveryAddresses> address = new DeliveryAddressService().findAllAddressesByUserEmail(loggedUserUniqueEmail);
			
			request.setAttribute("ADDRESS_LIST", address);
			request.setAttribute("USERDETAILS", userDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile_details.jsp");
			dispatcher.forward(request, response);

		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}

}
