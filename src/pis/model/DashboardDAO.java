package pis.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pis.pojo.TopFive;

public class DashboardDAO extends CommonDAO {

	public List<TopFive> topFiveList() {
		List<TopFive> list = new ArrayList<TopFive>();

		try {
			connect(); // Connect to the database

			// Execute the Select Query
			ResultSet result = getResultFromQuery("SELECT P.MedRecNo, P.Name, P.DOB, P.Address, P.Insurance, SUM(H.CostOfVist) AS TOTAL_COST FROM patienthx AS H INNER JOIN patients AS P ON H.MedRecNo = P.MedRecNo GROUP BY P.MedRecNo ORDER BY TOTAL_COST DESC, P.Name LIMIT 5");

			// Do I have a next row
			while (result.next()) {
				// Get the data from the row
				TopFive tf = new TopFive(result.getString("MedRecNo"), result.getString("Name"), result.getString("DOB"), result.getString("Address"), result.getString("Insurance"), result.getDouble("TOTAL_COST"));

				list.add(tf);
			}
		} catch (Exception e) {
			e.printStackTrace();// Log it
		} finally {
			close();
		}

		return list;
	}

}
