package pis.pojo;

import java.io.Serializable;

public class Patient implements Serializable {
	/**
	 * Serialization Id FOR PORTABILITY Java provides a mechanism, called object
	 * serialization where an object can be represented as a sequence of bytes that
	 * includes the object's data as well as information about the object's type and
	 * the types of data stored in the object.
	 */
	private static final long serialVersionUID = 1L;

	String medRecNo, name, dob, address, insurance;

	public Patient() {
		super();
	}

	public Patient(String medRecNo, String name, String dob, String address, String insurance) {
		super();
		this.medRecNo = medRecNo;
		this.name = name;
		this.dob = dob;
		this.address = address;
		this.insurance = insurance;
	}

	// rc--source
	// generate getter and setters
	// select nall EXCEPT serisliazableversionUID
	public String getMedRecNo() {
		return medRecNo;
	}

	public void setMedRecNo(String medRecNo) {
		this.medRecNo = medRecNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getInsurance() {
		return insurance;
	}

	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}

	// rc--source
	// toString
	// lc select all fields but not methods

	@Override
	public String toString() {
		return "Patient [medRecNo=" + medRecNo + ", name=" + name + ", dob=" + dob + ", address=" + address + ", insurance=" + insurance + "]";
	}
}
