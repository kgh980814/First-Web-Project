<%@page import="java.sql.*"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%

String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root"; 
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" UPDATE big_member SET mb_out = 'N' WHERE mb_id = ? ");
String sql = qry.toString();

Connection con = null;
PreparedStatement stmt = null;

int res=0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	stmt = con.prepareStatement(sql);

	stmt.setString(1, request.getParameter("mb_id"));
	
	res = stmt.executeUpdate();
	
	
} catch(Exception e) {
	
} finally {
	try{
		
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	} catch(Exception e) {
		
	} 
}


if(res == 0){
	out.print("Fail");
}else{
	out.print("Success");
}
%>