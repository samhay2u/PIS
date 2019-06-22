package pis.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public abstract class CommonDAO implements DeleteInterface {

	protected Connection conn = null;
	private Statement stmt = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet result = null;

	public void connect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver"); // Register JDBC Driver
		conn = DriverManager.getConnection("jdbc:mysql://localhost/PIS", "PIS", "tset");
	}

	public ResultSet getTableData(String tableName, String orderBy) throws Exception {
		return getResultFromQuery("SELECT * FROM " + tableName + " ORDER BY " + orderBy);
	}

	public ResultSet getResultFromQuery(String query) throws Exception {
		stmt = conn.createStatement(); // Create a database statement
		result = stmt.executeQuery(query); // Execute the Select Query
		return result;
	}

	public PreparedStatement prepare(String sql) throws Exception {
		pstmt = conn.prepareStatement(sql);// Prepare a database statement
		return pstmt;
	}

	public ResultSet getRecord(String tableName, String columnName, String columnValue) throws Exception {
		pstmt = conn.prepareStatement("SELECT * FROM " + tableName + " WHERE " + columnName + " = ?");
		pstmt.setInt(1, Integer.parseInt(columnValue));
		result = pstmt.executeQuery();
		return result;
	}

	public void close() {
		if (result != null) { // Close Result Set
			try {
				result.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (pstmt != null) { // Close Prepared Statement
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) { // Close Connection
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean delete(String id) {
		return false;
	}
}
