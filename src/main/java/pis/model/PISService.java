package pis.model;

import java.util.List;

import pis.pojo.Patient;

public class PISService {
	
	PatientDAO patientDAO;
	
	public PISService() {
		patientDAO = new PatientDAO();
	}

	public boolean deletePatient(String medRecNo) {
		return patientDAO.delete(medRecNo);
	}

	public Patient retreivePatient(String medRecNo) {
		return patientDAO.retreive(medRecNo);
	}

	public List<Patient> retreiveAllPatients() {
		return patientDAO.retreiveAll();
	}

	public boolean addPatient(Patient patient) {
		return patientDAO.add(patient);
	}

	public boolean editPatient(Patient patient) {
		return patientDAO.edit(patient);
	}

}
