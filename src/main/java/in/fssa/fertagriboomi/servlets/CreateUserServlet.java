package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    User user = new User();
	    
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		long phoneNumber = Long.parseLong(request.getParameter("phone"));
	
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhoneNumber(phoneNumber);
		
		UserService userService = new UserService();
		try {
			userService.createUser(user);
			System.out.println("User register successfully");
			response.sendRedirect(request.getContextPath() + "/login");
		} catch (ServiceException | ValidationException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
		
	}

}
