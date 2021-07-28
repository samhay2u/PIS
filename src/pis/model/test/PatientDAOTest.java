package pis.model.test;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import pis.model.PISService;
import pis.pojo.Patient;

class PatientDAOTest {
	
	PISService pisService;

	@BeforeEach
	void setUp() throws Exception {
		pisService = new PISService();
	}

	@AfterEach
	void tearDown() throws Exception {
		pisService.deletePatient("-1");
		pisService = null;
	}

	@Test
	void testDelete() {		
		assertFalse(pisService.deletePatient("103"));
		assertFalse(pisService.deletePatient("-103"));
	}

	@Test
	void testRetreive() {
		Patient patient = pisService.retreivePatient("103");
		System.out.println(patient);
		assertTrue(patient != null);
		
		patient = pisService.retreivePatient("-103");
		System.out.println(patient);
		assertTrue(patient == null);
	}

	@Test
	void testRetreiveAll() {
		List<Patient> patientList = pisService.retreiveAllPatients();
		System.out.println(patientList);
		assertTrue(patientList != null && patientList.size() > 0);
	}

	@Test
	void testAdd() {		
		Patient patient = new Patient("-1", "John Smith", "1980-01-01", "123 test st", "Anthem");
		assertTrue(pisService.addPatient(patient));
	}

	@Test
	void testEdit() {
		Patient patient = pisService.retreivePatient("103");
		System.out.println(patient);
		patient.setInsurance("Sam's New Insurance Deal");
		assertTrue(pisService.editPatient(patient));
		
		patient = new Patient("-2", "John Smith", "1980-01-01", "123 test st", "Anthem");
		patient.setInsurance("Sam's New Insurance Deal");
		assertFalse(pisService.editPatient(patient));
	}

}
