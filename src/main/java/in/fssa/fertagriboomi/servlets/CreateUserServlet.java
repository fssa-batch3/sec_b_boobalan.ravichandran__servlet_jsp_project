package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.exception.ValidationException;
import in.fssa.fertagriboomi.model.User;
import in.fssa.fertagriboomi.service.UserService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/user/create")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    User user = new User();

	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String phoneParam = request.getParameter("phone");

	    try {
	        long phoneNumber = Long.parseLong(phoneParam);

	        user.setName(name);
	        user.setEmail(email);
	        user.setPassword(password);
	        user.setPhoneNumber(phoneNumber);

	        UserService userService = new UserService();
	        userService.createUser(user);
	        System.out.println("User registered successfully");
	        response.sendRedirect(request.getContextPath() + "/login");
	    } catch (NumberFormatException | ServiceException | ValidationException e) {
	        String getError = e.getMessage();
	      
	        request.setAttribute("USER_DETAILS", user);
	        //System.out.println("USER_DETAILS attribute: " + user);
	        request.setAttribute("ERROR", getError);
	     
	        RequestDispatcher rd = request.getRequestDispatcher("/create_user.jsp");
	        rd.forward(request, response);
	    }
	}

	

}
