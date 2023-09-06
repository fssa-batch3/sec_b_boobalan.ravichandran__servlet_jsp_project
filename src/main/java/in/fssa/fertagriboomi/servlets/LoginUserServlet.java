package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.service.UserService;

/**
 * Servlet implementation class LoginUserServlet
 */

@WebServlet("/login")
public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("enter login details");

		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			UserService userService = new UserService();
			if (userService.findEmailAndPasswordExists(email, password)) {

				request.getSession().setAttribute("LOGGEDUSER", email);
				System.out.print(request.getSession().getAttribute("LOGGEDUSER"));

				response.sendRedirect(request.getContextPath() + "/index");
			}
		} catch (ServiceException e) {
//			e.printStackTrace();
//			throw new ServletException(e);
			String getError = e.getMessage();
			String errorArray[] = getError.split(":");
			response.sendRedirect("login?error=" + errorArray[1]);
		}

	}

}
