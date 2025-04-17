package pis.pojo;

// One row of data from the top five query which will be loaded from DashboardDAO
public class TopFive extends Patient {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// DRY rule
	// P.MedRecNo, P.Name, P.DOB, P.Address, P.Insurance, SUM(H.CostOfVist) AS
	// TOTAL_COST
	// In herited from Patient --> String medRecNo, name, dob, address, insurance;

	private double totalCost;

	public TopFive() {
		super();
	}

	public TopFive(String medRecNo, String name, String dob, String address, String insurance, double totalCost) {
		super(medRecNo, name, dob, address, insurance);

		this.totalCost = totalCost;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
}
