<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<% 
String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root"; 
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" DELETE FROM big_board ");
qry.append(" WHERE  bo_num = ? ");
String sql = qry.toString();//sql을 문자열로

Connection con = null;
PreparedStatement stmt = null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	//해킹방지
	stmt = con.prepareStatement(sql);
	//?에 해당하는 값 삽입 
	stmt.setInt(1,Integer.parseInt(request.getParameter("bo_num")));

	stmt.executeUpdate();//insert문 실행,delete문 실행
}catch(Exception e){
	
}finally{
	try{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	} catch(Exception e) {
		
	} 
}
%>
<%
response.sendRedirect("list.jsp");
%>