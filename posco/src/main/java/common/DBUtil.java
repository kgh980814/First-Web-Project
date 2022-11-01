package common;

import java.sql.*;

import javax.naming.*;
import javax.sql.DataSource;

public class DBUtil {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/bigdata");
			conn = ds.getConnection();
			//etc.
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * DB연결
	 */
	@Deprecated
	public static Connection getConnection2() {

		String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
		String user = "root"; 
		String password = "bigdata";
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;		
	}
	
	/**
	 * DB연결 해제
	 */
	public static void setClose(ResultSet rs, Statement stmt, Connection conn) {
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
}
