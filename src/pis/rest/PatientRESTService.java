package pis.rest;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import pis.model.DashboardDAO;
import pis.model.PatientDAO;
import pis.model.UserDAO;
import pis.pojo.Patient;
import pis.pojo.TopFive;
import pis.pojo.User;
import pis.util.Factory;

@Path("/")
@Produces(MediaType.APPLICATION_JSON)
public class PatientRESTService extends PatientDAO {

	private void validateUser(String userName, String password) throws Exception {
		User user = null;

		try {
			UserDAO userDAO = new UserDAO();
			user = userDAO.retrieve(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (user == null) {
			throw new Exception("You are not authorized to cosume this data");
		} else {
			if (!Factory.inValid(password, user.getHashedPassword())) {
				throw new Exception("You are not authorized to cosume this data");
			}
		}
	}

	@GET
	@Path("/patients")
	public List<Patient> retreiveAll(@QueryParam("userName") String userName, @QueryParam("password") String password) throws Exception {
		validateUser(userName, password);

		return super.retreiveAll();
	}

	@GET
	@Path("/patient/{medRecNo}")
	public Patient retreive(@PathParam("medRecNo") String medRecNo, @QueryParam("userName") String userName, @QueryParam("password") String password) throws Exception {
		validateUser(userName, password);

		return super.retreive(medRecNo);
	}

	@GET
	@Path("/top5")
	public List<TopFive> top5(@QueryParam("userName") String userName, @QueryParam("password") String password) throws Exception {
		validateUser(userName, password);

		return new DashboardDAO().topFiveList();
	}

}
