package pis;

/////////////////////////////////////////////////////////////////////////////////
//general JDBC format
//1.get a connection to database
//   ex...Connection myConn = DriverManager.getConnection(url, user, password)
//2. create a statement
//   ex...Statement myStmt = myConn. createStatement();
//3. execute a SQL querry
//   ex...string sql = "insert into employee  "
//              + "(last_name, first_name, email)"
//				+ "values(' Brown', 'David', 'david.brown@foo.com')")
//...BUT....what is missing here in these 3 simple steps?
//               
//    answer...       a webserver that push data to and from a web page
//so thats why we need to wrap all that above in java servlet classes first
////////////////////////////////////////////////////////////////////////////////
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pis.model.PISService;
import pis.model.PatientHXDAO;
import pis.model.ProcedureDAO;
import pis.pojo.PatientHX;
import pis.util.Factory;

/**
 * Servlet implementation class PatientHXServlet
 */
// SET UP THE URL ADDRESS
@WebServlet(description = "This servlet will maintain Patient's Procedure History", urlPatterns = { "/patienthx" })
// public class PatientHXServlet extends HttpServlet

public class PatientHXServlet extends CommonServlet {
	private static final long serialVersionUID = 1L;
	private static final String ERROR_TITLE = "Patient's Procedure History";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);
		request.setAttribute(TITLE, "Patient's Procedure History (<a href=\"/PIS/start\">Index</a>)");

		if (obj != null) {
			String opr = request.getParameter("opr"); // Get the operation type from the request parameter

			if ("add".equals(opr) || "edit".equals(opr)) {
				maintain(opr, request, response); // calls the add/edit form
			}

			else if ("delete".equals(opr)) {
				delete(request, response);
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
		String medRecNo = request.getParameter("MedRecNo"), dateOfService = request.getParameter("DateOfService"), doctorSeen = request.getParameter("DoctorSeen"), procedureID = request.getParameter("ProcedureID");
		String message = "Medical Record Number " + medRecNo + " deleted successfully";
		String opr = request.getParameter("opr");

		if ("delete".equals(opr)) {
			PatientHXDAO patientHXDAO = new PatientHXDAO();

			if (!patientHXDAO.delete(medRecNo, dateOfService, doctorSeen, procedureID)) {
				message = "Medical Record Number " + medRecNo + " delete failed";
			}
		}
		request.setAttribute("message", message); // Setting the message in the request attribute
		view(request, response); // Show the updated information
	}

	public void maintain(String opr, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isEdit = "edit".equals(opr);
		String medRecNo = request.getParameter("MedRecNo"), dateOfService = request.getParameter("DateOfService"), doctorSeen = request.getParameter("DoctorSeen"), procedureID = request.getParameter("ProcedureID");

		PISService pisService = Factory.getPISService(request);
		ProcedureDAO procedureDAO = new ProcedureDAO();

		if (isEdit) {
			PatientHXDAO patientHXDAO = new PatientHXDAO();
			request.setAttribute(PATIENTHX, patientHXDAO.retreive(medRecNo, dateOfService, doctorSeen, procedureID));
			request.setAttribute(PATIENT, pisService.retreivePatient(medRecNo));
			request.setAttribute(PROCEDURE, procedureDAO.retreive(procedureID));
		}

		else {
			request.setAttribute(PATIENTS, pisService.retreiveAllPatients());
			request.setAttribute(PROCEDURES, procedureDAO.retreiveAll());
		}

		request.getRequestDispatcher("/WEB-INF/views/patienthx/maintain.jsp").forward(request, response);
	}

	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PatientHXDAO patientHXDAO = new PatientHXDAO();
		request.setAttribute(PATIENTHXS, patientHXDAO.retreiveAll());
		request.getRequestDispatcher("/WEB-INF/views/patienthx/view.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);
		if (obj != null) {
			String medRecNo = request.getParameter("MedRecNo");
			String message = "Data added successfully";
			String opr = request.getParameter("opr");
			PatientHX patientHX = new PatientHX(medRecNo, request.getParameter("ProcedureID"), request.getParameter("DateOfService"), request.getParameter("DoctorSeen"), request.getParameter("CostOfVist"));
			PatientHXDAO patientHXDAO = new PatientHXDAO();
			if ("addSubmit".equals(opr)) {
				if (!patientHXDAO.add(patientHX)) {
					message = "No Data has been added";
				}
			}

			else if ("editSubmit".equals(opr)) {
				message = "Medical Record Number " + medRecNo + " edited successfully";
				if (!patientHXDAO.edit(patientHX)) {
					message = "Medical Record Number " + medRecNo + " edit failed";
				}
			}
			request.setAttribute("message", message); // Setting the message in the request attribute
			doGet(request, response); // Show the updated information
		}

		else {
			error(request, response, ERROR_TITLE);
		}
	}
}
