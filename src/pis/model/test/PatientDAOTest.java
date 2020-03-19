package pis.model.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import pis.model.PatientDAO;
import pis.pojo.Patient;

class PatientDAOTest {
	
	PatientDAO patientDAO;

	@BeforeEach
	void setUp() throws Exception {
		patientDAO = new PatientDAO();
	}

	@AfterEach
	void tearDown() throws Exception {
		patientDAO.delete("-1");
		patientDAO = null;
	}

	@Test
	void testDelete() {		
		assertFalse(patientDAO.delete("103"));
		assertFalse(patientDAO.delete("-103"));
	}

	@Test
	void testRetreive() {
		Patient patient = patientDAO.retreive("103");
		System.out.println(patient);
		assertTrue(patient != null);
		
		patient = patientDAO.retreive("-103");
		System.out.println(patient);
		assertTrue(patient == null);
	}

	@Test
	void testRetreiveAll() {
		List<Patient> patientList = patientDAO.retreiveAll();
		System.out.println(patientList);
		assertTrue(patientList != null && patientList.size() > 0);
	}

	@Test
	void testAdd() {		
		Patient patient = new Patient("-1", "John Smith", "1980-01-01", "123 test st", "Anthem");
		assertTrue(patientDAO.add(patient));
	}

	@Test
	void testEdit() {
		Patient patient = patientDAO.retreive("103");
		System.out.println(patient);
		patient.setInsurance("Sam's New Insurance Deal");
		assertTrue(patientDAO.edit(patient));
		
		patient = new Patient("-2", "John Smith", "1980-01-01", "123 test st", "Anthem");
		patient.setInsurance("Sam's New Insurance Deal");
		assertFalse(patientDAO.edit(patient));
	}

}
