package pis.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pis.pojo.PatientHX;

public class PatientHXDAO extends CommonDAO {

	public boolean delete(String medRecNo, String dateOfService, String doctorSeen, String procedureID) {
		boolean isSuccess = false;
		try {
			connect();
			PreparedStatement stmt = prepare("DELETE FROM patienthx WHERE MedRecNo = ? " + "AND DateOfService = ? AND DoctorSeen = ? " + "AND ProcedureID = ?");
			// Prevent SQL Injection and Bind Parameter with Parameter Markers
			stmt.setInt(1, Integer.parseInt(medRecNo));
			stmt.setString(2, dateOfService);
			stmt.setString(3, doctorSeen);
			stmt.setInt(4, Integer.parseInt(procedureID));
			isSuccess = stmt.executeUpdate() > 0; // Execute the Select Query
		}

		catch (Exception e) {
			e.printStackTrace();// Log it
		}

		finally {
			close();
		}
		return isSuccess;
	}

	public PatientHX retreive(String medRecNo, String dateOfService, String doctorSeen, String procedureID) {
		PatientHX patientHX = null;

		try {
			connect();
			pstmt = conn.prepareStatement("SELECT * FROM patienthx WHERE MedRecNo = ? " + "AND DateOfService = ? AND DoctorSeen = ? " + "AND ProcedureID = ?");
			pstmt.setString(1, medRecNo);
			pstmt.setString(2, dateOfService);
			pstmt.setString(3, doctorSeen);
			pstmt.setString(4, procedureID);
			result = pstmt.executeQuery();

			if (result.next()) {
				patientHX = new PatientHX(result.getString("MedRecNo"), result.getString("ProcedureID"), result.getString("DateOfService"), result.getString("DoctorSeen"), result.getString("CostOfVist"));
			}
		}

		catch (Exception e) {
			e.printStackTrace(); // Log it
		}

		finally {
			close(); // DRY
		}

		return patientHX;
	}

	public List<PatientHX> retreiveAll() {
		List<PatientHX> list = new ArrayList<PatientHX>();

		try {
			connect(); // Connect to the database
			// Execute the Select Query
			ResultSet result = getResultFromQuery("SELECT " + "PT.MedRecNo, PT.Name, PS.ProcedureID,PS.ProcedureName, " + "PS.Description, PX.DateOfService, PX.DoctorSeen, PX.CostOfVist " + "FROM patients " + "AS PT INNER JOIN patienthx AS PX ON PT.MedRecNo = PX.MedRecNo " + "INNER JOIN procedures AS PS ON PX.ProcedureID " + "= PS.ProcedureID ORDER BY PT.Name, PS.ProcedureName");
			while (result.next()) {
				// Get the data from the row
				list.add(new PatientHX(result.getString("MedRecNo"), result.getString("Name"), result.getString("ProcedureID"), result.getString("ProcedureName"), result.getString("Description"), result.getString("DateOfService"), result.getString("DoctorSeen"), result.getString("CostOfVist")));
			}
		}

		catch (Exception e) {
			e.printStackTrace();// Log it
		}

		finally {
			close();
		}

		return list;
	}

	public boolean add(PatientHX patientHX) {
		boolean isSuccess = false;

		try {
			connect(); // Connect to the database
			PreparedStatement stmt = prepare("INSERT INTO patientHX(MedRecNo," + " DateOfService, DoctorSeen, " + "ProcedureID, CostOfVist) VALUES(?, ?, ?, ?, ?)");
			// Prevent SQL InjectionBind Parameter with Parameter Markers
			stmt.setString(1, patientHX.getMedRecNo());
			stmt.setString(2, patientHX.getDateOfService());
			stmt.setString(3, patientHX.getDoctorSeen());
			stmt.setString(4, patientHX.getProcedureID());
			stmt.setString(5, patientHX.getCostOfVisit());

			isSuccess = stmt.executeUpdate() > 0; // Execute the Select Query
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return isSuccess;
	}

	public boolean edit(PatientHX patientHX) {
		boolean isSuccess = false;

		try {
			connect(); // Connect to the database
			PreparedStatement stmt = prepare("UPDATE patienthx SET CostOfVist = ? " + "WHERE MedRecNo = ? AND DateOfService = ? " + "AND DoctorSeen = ? AND ProcedureID = ?");
			// Prevent SQL Injection and Bind Parameter with Parameter Markers
			stmt.setString(1, patientHX.getCostOfVisit());
			stmt.setString(2, patientHX.getMedRecNo());
			stmt.setString(3, patientHX.getDateOfService());
			stmt.setString(4, patientHX.getDoctorSeen());
			stmt.setString(5, patientHX.getProcedureID());

			isSuccess = stmt.executeUpdate() > 0; // Execute the Select Query
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return isSuccess;
	}
}
