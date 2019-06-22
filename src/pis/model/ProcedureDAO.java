package pis.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pis.pojo.Procedure;

public class ProcedureDAO extends CommonDAO {

	// where ever there is a commonDAO in
	@Override
	public boolean delete(String procedureId) {
		boolean isSuccess = false;

		try {
			connect();// Connect to the database
			PreparedStatement stmt = prepare("DELETE FROM procedures WHERE ProcedureID = ?");
			stmt.setInt(1, Integer.parseInt(procedureId));
			isSuccess = stmt.executeUpdate() > 0;// Execute the Select Query
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return isSuccess;
	}

	public Procedure retreive(String procedureID) {
		Procedure procedure = null;

		try {
			connect();
			ResultSet result = getRecord("procedures", "ProcedureID", procedureID);

			if (result.next()) {
				procedure = new Procedure(result.getString("ProcedureID"), result.getString("ProcedureName"), result.getString("Description"), result.getString("Cost"), result.getString("BillingCode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();// DRY
		}

		return procedure;
	}

	public List<Procedure> retreiveAll() {
		List<Procedure> list = new ArrayList<Procedure>();

		try {
			connect();
			ResultSet result = getTableData("procedures", "ProcedureName"); // Execute the Select Query

			while (result.next()) {
				list.add(new Procedure(result.getString("ProcedureId"), result.getString("ProcedureName"), result.getString("Description"), result.getString("Cost"), result.getString("BillingCode")));
			}

		}

		catch (Exception e) {
			e.printStackTrace();

		}

		finally {
			close();
		}

		return list;
	}

	public boolean add(Procedure procedure) {
		boolean isSuccess = false;

		try {
			connect();
			PreparedStatement stmt = prepare("INSERT INTO procedures" + "(ProcedureId, ProcedureName, Description, Cost, BillingCode) " + "VALUES(?, ?, ?, ?, ?)");

			// Prevent SQL Injection and Bind Parameter with Parameter Markers
			stmt.setString(1, procedure.getProcedureId());
			stmt.setString(2, procedure.getProcedureName());
			stmt.setString(3, procedure.getDescription());
			stmt.setString(4, procedure.getCost());
			stmt.setString(5, procedure.getBillingCode());

			isSuccess = stmt.executeUpdate() > 0;
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return isSuccess;
	}

	public boolean edit(Procedure procedure) {
		boolean isSuccess = false;

		try {
			connect();
			PreparedStatement stmt = prepare("UPDATE procedures SET " + "ProcedureName = ?, " + "Description = ?, " + "Cost = ?, " + "BillingCode = ? " + "WHERE ProcedureId = ?");
			// Prevent SQL Injection // Bind Parameter with Parameter Markers
			stmt.setString(5, procedure.getProcedureId());
			stmt.setString(1, procedure.getProcedureName());
			stmt.setString(2, procedure.getDescription());
			stmt.setString(3, procedure.getCost());
			stmt.setString(4, procedure.getBillingCode());

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
