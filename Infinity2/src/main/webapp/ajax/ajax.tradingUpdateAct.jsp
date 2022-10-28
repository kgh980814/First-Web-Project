<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
//JDBC프로그래밍					   포트번호 DB이름

String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root";
String password = "bigdata";
StringBuffer qry = new StringBuffer();

qry.append(" UPDATE big_tradingdetail SET trad_" +request.getParameter("trad_name")+ " = ? WHERE trad_num = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;


String ajaxMessage = "Fail";
try {

	Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버 로드

	conn = DriverManager.getConnection(url, user, password);

	stmt = conn.prepareStatement(sql); //preparedstatement sql문은 여기드감

	stmt.setString(1, request.getParameter("trad_value"));
	stmt.setString(2, request.getParameter("trad_num"));

	int res = stmt.executeUpdate();

	if (res > 0) {
			ajaxMessage = "Success";
	}
} catch (Exception e) {
} finally {
	try {
	if (stmt != null)
	stmt.close();
		if (conn != null)
	conn.close();

	} catch (Exception e) {
	}
}
out.print(ajaxMessage);
%>

