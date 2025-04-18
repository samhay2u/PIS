package pis;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonServletInterface {
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	public void maintain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

}
