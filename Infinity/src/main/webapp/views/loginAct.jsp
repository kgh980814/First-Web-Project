<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user = "root"; 
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" SELECT * FROM big_member WHERE mb_id = ? AND mb_pw = ? ");
String sql = qry.toString();

Connection con = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	stmt = con.prepareStatement(sql);

	stmt.setString(1, request.getParameter("mb_id"));
	stmt.setString(2, request.getParameter("mb_pw"));
	rs = stmt.executeQuery();
	
	if(rs.next()){
		//세션 변수 생성
		String sess_id = rs.getString("mb_id");
		String sess_name = rs.getString("mb_name");
		session.setAttribute("sess_id", sess_id);
		session.setAttribute("sess_name", sess_name);
		
		response.sendRedirect("dashboard.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}
} catch(Exception e) {
	
} finally {
	try{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	} catch(Exception e) {
		
	} 
}

%>