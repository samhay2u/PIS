package pis;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pis.util.Singleton;

@WebServlet(description = "This servlet will show the list of available modules", urlPatterns = { "/start" })
public class CommonServlet extends HttpServlet implements CommonServletInterface {
	private static final long serialVersionUID = 1L;

	public static final String SESSION_USER_TOKEN = "sessionUserToken";
	public static final String TITLE = "title";
	public static final String MESSAGE = "message";
	public static final String OPR = "opr";

	public final static String PATIENTS = "PATIENTS";
	public final static String PATIENT = "PATIENT";

	public final static String PROCEDURES = "PROCEDURES";
	public final static String PROCEDURE = "PROCEDURE";

	public final static String PATIENTHXS = "PATIENTHXS";
	public final static String PATIENTHX = "PATIENTHX";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute(SESSION_USER_TOKEN);
		request.setAttribute(TITLE, Singleton.getInstance().getTitle());
		request.getRequestDispatcher(obj != null ? "/WEB-INF/views/home.jsp" : "/WEB-INF/views/error.jsp").forward(request, response);
	}

	protected void error(HttpServletRequest request, HttpServletResponse response, String title) throws ServletException, IOException {
		request.setAttribute(TITLE, title);
		request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	@Override
	public void maintain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
