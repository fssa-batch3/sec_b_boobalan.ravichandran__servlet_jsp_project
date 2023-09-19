package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidate the user's session
		    request.getSession().removeAttribute("LOGGEDUSER");
	        request.getSession().invalidate();

	        // Redirect the user to the login page or any other appropriate page
	        response.sendRedirect(request.getContextPath() + "/index");
    }

}
