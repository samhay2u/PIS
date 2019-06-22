package pis.util;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import pis.model.PatientDAO;

public class Factory {

	private final static String SECURITY_KEY_FACTORY = "PBKDF2WithHmacSHA512";
	private final static int SALT_SIZE = 16, ITERATION_COUNT = 65536, KEY_LENGTH = 128;

	private final static String SESSION_PATIENT_DAO = "sessionPatientDao";

	public static PatientDAO getPatientDAO(HttpServletRequest request) {
		HttpSession session = request.getSession(); // Get the session object
		PatientDAO patientDAO = (PatientDAO) session.getAttribute(SESSION_PATIENT_DAO); // Get patient dao object if exists

		if (patientDAO == null) { // If patient dao does not exist
			patientDAO = new PatientDAO(); // Create the object
			session.setAttribute(SESSION_PATIENT_DAO, patientDAO); // Save it in the session
		}
		return patientDAO; // Return patient dao object
	}

	private static String getStringOfBytes(byte[] bytes) {
		String bytesString = "";

		for (Byte b : bytes) {
			bytesString += b.intValue() + " ";
		}

		return bytesString.trim();
	}

	public static String generateHash(byte[] salt, String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
		if (salt == null) {
			salt = new byte[SALT_SIZE];
			SecureRandom random = new SecureRandom();
			random.nextBytes(salt);
		}

		KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, ITERATION_COUNT, KEY_LENGTH);
		SecretKeyFactory factory = SecretKeyFactory.getInstance(SECURITY_KEY_FACTORY);
		byte[] hash = factory.generateSecret(spec).getEncoded();

		// System.out.println(getStringOfBytes(salt));
		// System.out.println(getStringOfBytes(hash));

		return getStringOfBytes(salt) + " " + getStringOfBytes(hash);
	}

	public static boolean inValid(String password, String hashedPassword) throws NoSuchAlgorithmException, InvalidKeySpecException {
		byte[] salt = new byte[SALT_SIZE];
		String[] stringOfBytes = hashedPassword.split(" ");

		for (int i = 0; i < SALT_SIZE; i++) {
			salt[i] = Integer.valueOf(stringOfBytes[i]).byteValue();
		}

		String hash = generateHash(salt, password);
		// System.out.println(getStringOfBytes(salt));
		// System.out.println(getStringOfBytes(hash.getBytes()));

		return hashedPassword.equals(hash);
	}
}
