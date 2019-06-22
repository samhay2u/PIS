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

import pis.model.PatientDAO;
import pis.pojo.Patient;
import pis.util.Factory;

/**
 * Servlet implementation class PatientsServlet
 */
// SET UP THE SERVLET PAGE URL ADDRESS
@WebServlet(description = "This servlet will maintain patients data", urlPatterns = { "/patients" })

public class PatientsServlet extends CommonServlet {
	private static final long serialVersionUID = 1L;
	private static final String ERROR_TITLE = "Patient Data";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);
		request.setAttribute(TITLE, "Patient Data (<a href=\"/PIS/start\">Index</a>)");

		if (obj != null) {
			String opr = request.getParameter(OPR); // sets up a string object and Get the operation type

			if ("add".equals(opr) || "edit".equals(opr)) {
				maintain(opr, request, response); // calls the add/edit form
			}

			else if ("delete".equals(opr)) {
				delete(request, response);
			}

			else {
				view(request, response);
			}
		}

		else {
			error(request, response, ERROR_TITLE);
		}
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("MedRecNo");
		String message = "Medical Record Number " + id + " deleted successfully";
		String opr = request.getParameter("opr");
		PatientDAO patientDAO = Factory.getPatientDAO(request);

		if ("delete".equals(opr)) {
			if (!patientDAO.delete(id)) {
				message = "Medical Record Number " + id + " delete failed";
			}
		}
		request.setAttribute(MESSAGE, message); // Setting the message in the request attribute
		view(request, response); // Show the updated information
	}

	public void maintain(String opr, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isEdit = "edit".equals(opr);

		if (isEdit) {
			PatientDAO patientDAO = Factory.getPatientDAO(request);
			request.setAttribute(PATIENT, patientDAO.retreive(request.getParameter("MedRecNo")));
		}
		request.getRequestDispatcher("/WEB-INF/views/patients/maintain.jsp").forward(request, response);
	}

	// Painting the entire data table
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PatientDAO patientDAO = Factory.getPatientDAO(request);
		request.setAttribute(PATIENTS, patientDAO.retreiveAll());
		request.getRequestDispatcher("/WEB-INF/views/patients/view.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);

		if (obj != null) {
			String medRecNo = request.getParameter("MedRecNo");
			String message = "Data added successfully";
			String opr = request.getParameter("opr");
			Patient patient = new Patient(medRecNo, request.getParameter("Name"), request.getParameter("DOB"), request.getParameter("Address"), request.getParameter("Insurance"));
			PatientDAO patientDAO = Factory.getPatientDAO(request);

			if ("addSubmit".equals(opr)) {

				if (!patientDAO.add(patient)) {
					message = "No Data has been added";
				}
			}

			else if ("editSubmit".equals(opr)) {
				message = "Medical Record Number " + medRecNo + " edited successfully";
				if (!patientDAO.edit(patient)) {
					message = "Medical Record Number " + medRecNo + " edit failed";
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
