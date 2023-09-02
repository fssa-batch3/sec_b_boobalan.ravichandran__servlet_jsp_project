package in.fssa.fertagriboomi.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.fertagriboomi.exception.ServiceException;
import in.fssa.fertagriboomi.model.User;
import in.fssa.fertagriboomi.service.UserService;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/profile/edit")
public class EditUserServlet extends HttpServlet {
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
			request.setAttribute("USERDETAIL", userDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile_update.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}

}
