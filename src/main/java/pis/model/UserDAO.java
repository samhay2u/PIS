package pis.model;

import java.sql.PreparedStatement;

import pis.pojo.User;

public class UserDAO extends CommonDAO {

	public User retrieve(String userName) throws Exception {
		User user = null;

		try {
			connect();
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ?");
			pstmt.setString(1, userName);
			result = pstmt.executeQuery();

			if (result.next()) {
				// Get the data from the row
				user = new User(result.getString("user_id"), result.getString("user_password"), result.getString("role"), result.getInt("active") == 1, result.getString("first_name"), result.getString("middle_name"), result.getString("last_name"), result.getString("user_email"));
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return user;
	}

	public boolean register(User user) {
		boolean isSuccess = false;

		try {
			// Connect to the database
			connect();
			PreparedStatement stmt = prepare("INSERT INTO users(user_id, user_password, first_name, middle_name, last_name, user_email) VALUES(?, ?, ?, ?, ?, ?)");

			// Prevent SQL Injection and Bind Parameter with Parameter Markers
			stmt.setString(1, user.getUserId());
			stmt.setString(2, user.getHashedPassword());
			stmt.setString(3, user.getFirstName());
			stmt.setString(4, user.getMiddleName());
			stmt.setString(5, user.getLastName());
			stmt.setString(6, user.getUserEmail());

			// Execute the Select Query
			int result = stmt.executeUpdate();

			isSuccess = result > 0;
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		finally {
			close();
		}

		return isSuccess;
	}
}
