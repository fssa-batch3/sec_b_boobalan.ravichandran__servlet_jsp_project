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
import in.fssa.fertagriboomi.model.DeliveryAddresses;
import in.fssa.fertagriboomi.service.DeliveryAddressService;

/**
 * Servlet implementation class EditAddressServlet
 */
@WebServlet("/profile_details/edit_address")
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int addressId = Integer.parseInt(request.getParameter("address_id"));
		try {
			DeliveryAddresses addressDetails = new DeliveryAddressService().findAddressById(addressId);
			request.setAttribute("UPDATE_ADDRESS", addressDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/update_address.jsp");
			dispatcher.forward(request, response);
		} catch (ValidationException | ServiceException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

	}

}
