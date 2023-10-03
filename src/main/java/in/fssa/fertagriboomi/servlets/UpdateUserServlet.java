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

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.DeliveryAddresses;
import in.fssa.fertagriboomi.model.User;
import in.fssa.fertagriboomi.service.DeliveryAddressService;
import in.fssa.fertagriboomi.service.UserService;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/profile/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
		List<DeliveryAddresses> address = null;
		User userDetails = null;
		try {
			
			   address = new DeliveryAddressService().findAllAddressesByUserEmail(loggedUserUniqueEmail);

			
			 userDetails = new UserService().findByEmail(loggedUserUniqueEmail);
			int userId = userDetails.getId();
			String name = request.getParameter("name");
			long phoneNumber = Long.parseLong(request.getParameter("phone"));

			UserService userService = new UserService();
			User newUser = new User();
			PrintWriter out = response.getWriter();
			newUser.setName(name);
			newUser.setPhoneNumber(phoneNumber);
		
			userService.updateUser(userId, newUser);

			out.println("User updated successfully");
			response.sendRedirect(request.getContextPath() + "/profile_details");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			request.setAttribute("ADDRESS_LIST", address);
			request.setAttribute("USERDETAILS", userDetails);
			request.setAttribute("ERROR_DETAILS", e.getMessage());
			System.out.print( "error"+ e.getMessage());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile_details.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}
