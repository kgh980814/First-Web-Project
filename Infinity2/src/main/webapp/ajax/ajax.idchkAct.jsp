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

qry.append(" SELECT count(*) FROM big_member WHERE  mb_id = ? ");
String sql = qry.toString();

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

String ajaxMessage = "Fail";
try {

	Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버 로드

	conn = DriverManager.getConnection(url, user, password);

	stmt = conn.prepareStatement(sql); //preparedstatement sql문은 여기드감

	stmt.setString(1, request.getParameter("mb_id"));

	rs = stmt.executeQuery();

	if (rs.next()) {

		//세션 변수 생성 아이디, 이름

		int idChkNum = rs.getInt("count(*)");
		if(idChkNum == 0){
			ajaxMessage = "Success";
		}else{
			ajaxMessage = "Fail";
		}
	}
} catch (Exception e) {
} finally {
	try {
	if (rs != null)
	rs.close();
	if (stmt != null)
	stmt.close();
		if (conn != null)
	conn.close();

	} catch (Exception e) {
	}
}
out.print(ajaxMessage);
%>

