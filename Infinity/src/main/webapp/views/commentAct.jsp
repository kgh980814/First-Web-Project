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
qry.append(" INSERT INTO big_comment (com_num,com_refNum,com_content, ");
qry.append(" com_mb_id,com_mb_name,com_inputDate) ");
qry.append(" VALUES (null, ?, ?, ?, ?, now()) ");


String sql = qry.toString();//sql을 문자열로

Connection con = null;
PreparedStatement stmt = null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	//해킹방지
	stmt = con.prepareStatement(sql);
	//?에 해당하는 값 삽입 
	stmt.setString(1,request.getParameter("com_refNum"));
	stmt.setString(2,request.getParameter("com_content"));
	stmt.setString(3,(String)session.getAttribute("sess_id"));
	stmt.setString(4,(String)session.getAttribute("sess_name"));

	stmt.executeUpdate();//insert문 실행
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
response.sendRedirect("view.jsp?bo_num="+request.getParameter("com_refNum"));
%>