package pis.pojo;

import java.io.Serializable;

public class PatientHX implements Serializable {
	/**
	 * Serialization Id
	 */
	private static final long serialVersionUID = 1L;

	String medRecNo, name, procedureID, procedureName, procedureDesc, dateOfService, doctorSeen, costOfVisit;

	public PatientHX(String medRecNo, String procedureID, String dateOfService, String doctorSeen, String costOfVisit) {
		super();
		this.medRecNo = medRecNo;
		this.procedureID = procedureID;
		this.dateOfService = dateOfService;
		this.doctorSeen = doctorSeen;
		this.costOfVisit = costOfVisit;
	}

	public PatientHX(String medRecNo, String name, String procedureID, String procedureName, String procedureDesc, String dateOfService, String doctorSeen, String costOfVisit) {
		super();
		this.medRecNo = medRecNo;
		this.name = name;
		this.procedureID = procedureID;
		this.procedureName = procedureName;
		this.procedureDesc = procedureDesc;
		this.dateOfService = dateOfService;
		this.doctorSeen = doctorSeen;
		this.costOfVisit = costOfVisit;
	}

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

	public String getProcedureID() {
		return procedureID;
	}

	public void setProcedureID(String procedureID) {
		this.procedureID = procedureID;
	}

	public String getProcedureName() {
		return procedureName;
	}

	public void setProcedureName(String procedureName) {
		this.procedureName = procedureName;
	}

	public String getProcedureDesc() {
		return procedureDesc;
	}

	public void setProcedureDesc(String procedureDesc) {
		this.procedureDesc = procedureDesc;
	}

	public String getDateOfService() {
		return dateOfService;
	}

	public void setDateOfService(String dateOfService) {
		this.dateOfService = dateOfService;
	}

	public String getDoctorSeen() {
		return doctorSeen;
	}

	public void setDoctorSeen(String doctorSeen) {
		this.doctorSeen = doctorSeen;
	}

	public String getCostOfVisit() {
		return costOfVisit;
	}

	public void setCostOfVisit(String costOfVisit) {
		this.costOfVisit = costOfVisit;
	}

	@Override
	public String toString() {
		return "PatientHX [medRecNo=" + medRecNo + ", name=" + name + ", procedureID=" + procedureID + ", procedureName=" + procedureName + ", procedureDesc=" + procedureDesc + ", dateOfService=" + dateOfService + ", doctorSeen=" + doctorSeen + ", costOfVisit=" + costOfVisit + "]";
	}
}