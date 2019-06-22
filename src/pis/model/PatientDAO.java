package pis.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pis.pojo.Patient;

public class PatientDAO extends CommonDAO {

	@Override
	public boolean delete(String medRecNo) {
		boolean isSuccess = false;
		try {
			connect();
			PreparedStatement stmt = prepare("DELETE FROM patients WHERE MedRecNo = ?");
			stmt.setInt(1, Integer.parseInt(medRecNo));
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

	public Patient retreive(String medRecNo) {
		Patient patient = null;
		try {
			connect();
			ResultSet result = getRecord("patients", "medRecNo", medRecNo);

			if (result.next()) {
				patient = new Patient(result.getString("MedRecNo"), result.getString("Name"), result.getString("DOB"), result.getString("Address"), result.getString("Insurance"));
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return patient;
	}

	public List<Patient> retreiveAll() {
		List<Patient> list = new ArrayList<Patient>();

		try {
			connect(); // Connect to the database
			ResultSet result = getTableData("patients", "Name");// Execute the Select Query

			while (result.next()) {
				list.add(new Patient(result.getString("MedRecNo"), result.getString("Name"), result.getString("DOB"), result.getString("Address"), result.getString("Insurance")));
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

	public boolean add(Patient patient) {
		boolean isSuccess = false;

		try {
			connect();
			PreparedStatement stmt = prepare("INSERT INTO patients" + "(MedRecNo, Name, DOB, Address, Insurance) " + "VALUES(?, ?, ?, ?, ?)");
			// Prevent SQL Injection and Bind Parameter with Parameter Markers
			stmt.setInt(1, Integer.parseInt(patient.getMedRecNo()));
			stmt.setString(2, patient.getName());
			stmt.setString(3, patient.getDob());
			stmt.setString(4, patient.getAddress());
			stmt.setString(5, patient.getInsurance());

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

	public boolean edit(Patient patient) {
		boolean isSuccess = false;

		try {
			connect();
			PreparedStatement stmt = prepare("UPDATE patients " + "SET Name = ?, DOB = ?, Address = ?, Insurance = ? " + "WHERE MedRecNo = ?");

			// Prevent SQL Injection andBind Parameter with Parameter Markers
			stmt.setString(1, patient.getName());
			stmt.setString(2, patient.getDob());
			stmt.setString(3, patient.getAddress());
			stmt.setString(4, patient.getInsurance());
			stmt.setInt(5, Integer.parseInt(patient.getMedRecNo()));

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
}