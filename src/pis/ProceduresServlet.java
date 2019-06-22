package pis;

/////////////////////////////////////////////////////////////////////////////////
//general JDBC format
//1.get a connection to database
//ex...Connection myConn = DriverManager.getConnection(url, user, password)
//2. create a statement
//ex...Statement myStmt = myConn. createStatement();
//3. execute a SQL querry
//ex...string sql = "insert into employee  "
//+ "(last_name, first_name, email)"
//+ "values(' Brown', 'David', 'david.brown@foo.com')")
//...BUT....what is missing here in these 3 simple steps?
//
//answer...       a webserver that push data to and from a web page
//so thats why we need to wrap all that above in java servlet classes first
////////////////////////////////////////////////////////////////////////////////
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pis.model.ProcedureDAO;
import pis.pojo.Procedure;

/**
 * Servlet implementation class ProceduresServlet
 */
@WebServlet(description = "This servlet will maintain procedure data", urlPatterns = { "/procedures" })

public class ProceduresServlet extends CommonServlet {
	private static final long serialVersionUID = 1L;
	private static final String ERROR_TITLE = "Procedure Data";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);
		request.setAttribute(TITLE, "Procedure Data (<a href=\"/PIS/start\">Index</a>)");

		if (obj != null) {
			String opr = request.getParameter("opr"); // Get the operation type from the request parameter

			if ("add".equals(opr) || "edit".equals(opr)) {
				maintain(opr, request, response); // calls the add/edit form
			}

			else if ("delete".equals(opr)) {
				delete(request, response); // process as delete
			}

			else {
				view(request, response); // calls view
			}
		}

		else {
			error(request, response, ERROR_TITLE);
		}
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("ProcedureID");
		String message = "ProcedureID " + id + " deleted successfully";
		String opr = request.getParameter("opr");
		ProcedureDAO procedureDAO = new ProcedureDAO();

		if ("delete".equals(opr)) {

			if (!procedureDAO.delete(id)) {
				message = "ProcedureID " + id + " delete failed";
			}
		}
		request.setAttribute(MESSAGE, message); // Setting the message in the request attribute
		view(request, response); // Show the updated information
	}

	public void maintain(String opr, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isEdit = "edit".equals(opr);

		if (isEdit) {
			ProcedureDAO procedureDAO = new ProcedureDAO();
			request.setAttribute(PROCEDURE, procedureDAO.retreive(request.getParameter("ProcedureID")));
		}
		request.getRequestDispatcher("/WEB-INF/views/procedures/maintain.jsp").forward(request, response);
	}

	// Painting the entire data table
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProcedureDAO procedureDAO = new ProcedureDAO();
		request.setAttribute(PROCEDURES, procedureDAO.retreiveAll());
		request.getRequestDispatcher("/WEB-INF/views/procedures/view.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);

		if (obj != null) {
			String procedureId = request.getParameter("ProcedureID");
			String message = "Data added successfully";
			String opr = request.getParameter("opr");
			Procedure procedure = new Procedure(procedureId, request.getParameter("ProcedureName"), request.getParameter("Description"), request.getParameter("Cost"), request.getParameter("BillingCode"));
			ProcedureDAO procedureDAO = new ProcedureDAO();

			if ("addSubmit".equals(opr)) {
				if (!procedureDAO.add(procedure)) {
					message = "No Data has been added";
				}
			}

			else if ("editSubmit".equals(opr)) {
				message = "ProcedureID " + procedureId + " edited successfully";

				if (!procedureDAO.edit(procedure)) {
					message = "ProcedureID " + procedureId + " edit failed";
				}
			}
			request.setAttribute(MESSAGE, message); // Setting the message in the request attribute
			doGet(request, response);// Show the updated information
		}

		else {
			error(request, response, ERROR_TITLE);
		}
	}
}
