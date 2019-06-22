package pis.pojo;

import java.io.Serializable;

public class Procedure implements Serializable {

	private static final long serialVersionUID = 1L;
	String procedureId, procedureName, description, cost, billingCode;

	public Procedure(String procedureId, String procedureName, String description, String cost, String billingCode) {
		super();
		this.procedureId = procedureId;
		this.procedureName = procedureName;
		this.description = description;
		this.cost = cost;
		this.billingCode = billingCode;
	}

	public String getProcedureId() {
		return procedureId;
	}

	public void setProcedureId(String procedureId) {
		this.procedureId = procedureId;
	}

	public String getProcedureName() {
		return procedureName;
	}

	public void setProcedureName(String procedureName) {
		this.procedureName = procedureName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getBillingCode() {
		return billingCode;
	}

	public void setBillingCode(String billingCode) {
		this.billingCode = billingCode;
	}

	@Override
	public String toString() {
		return "Procedure [procedureId=" + procedureId + ", procedureName=" + procedureName + ", description=" + description + ", cost=" + cost + ", billingCode=" + billingCode + "]";
	}

}