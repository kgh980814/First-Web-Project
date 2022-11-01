package mapper;

import java.sql.*;

import common.DBUtil;
import model.ContactVO;

public class ContactMapper {

	public void create(ContactVO contact) {
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO big_contact (co_fname, co_email, co_message) ");
		sql.append(" VALUES (?, ?, ?) ");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DBUtil.getConnection();
			stmt = conn.prepareStatement(sql.toString());
			stmt.setString(1, contact.getCo_fname());
			stmt.setString(2, contact.getCo_email());
			stmt.setString(3, contact.getCo_message());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.setClose(null, stmt, conn);
		}
	}
}
