package in.fssa.fertagriboomi.servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class CreateOrderAddressServlet
 */
@WebServlet("/product/details/order_summary/create_address")
public class CreateOrderAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String addressTitle = request.getParameter("address_title");
	String streetName = request.getParameter("street_name");
	String location = request.getParameter("location");
	String city = request.getParameter("city");
	String personName = request.getParameter("person_name");
	int pincode = Integer.parseInt(request.getParameter("pincode")) ;
	String state = request.getParameter("state");
	long mobileNumber = Long.parseLong(request.getParameter("mobile_number"));
	String loggedUserUniqueEmail = (String) request.getSession().getAttribute("LOGGEDUSER");
	
	DeliveryAddresses address = new DeliveryAddresses();
	address.setAddressTitle(addressTitle);
	address.setStreetName(streetName);
	address.setLocation(location);
	address.setCity(city);
	address.setPersonName(personName);
	address.setPincode(pincode);
	address.setState(state);
	address.setMobileNumber(mobileNumber);
	address.setUserEmail(loggedUserUniqueEmail);
	
	DeliveryAddressService deliveryAddress = new DeliveryAddressService();
	PrintWriter out = response.getWriter();
	
	try {
		deliveryAddress.createDeliveryAddress(address);
		out.println("Order created successfully");
		response.sendRedirect(request.getContextPath() + "/product/details/order_summary/new_address");
	} catch (ValidationException | ServiceException e) {
		out.println(e.getMessage());
		request.setAttribute("ERRORDETAILS", e.getMessage());
		RequestDispatcher rd = request.getRequestDispatcher("new_address");
		rd.forward(request, response);
	}
	
	
	}

}
