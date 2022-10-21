<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<% 
String url = "jdbc:mysql://localhost:3306/bigdata?serverTimezone=Asia/Seoul";
String user = "root"; 
String password = "bigdata";

StringBuffer qry = new StringBuffer();
qry.append(" INSERT INTO big_board (bo_num,bo_category,bo_title,  ");
qry.append(" bo_content, bo_mb_id, bo_mb_name, bo_hit, bo_inputdate, bo_ip) ");
qry.append(" VALUES (null, ?, ?, ?, ?, ? ,0, now(), ?) ");

String sql = qry.toString();//sql을 문자열로

Connection con = null;
PreparedStatement stmt = null;
String ajaxMessage = "Fail";
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	
	//해킹방지
	stmt = con.prepareStatement(sql);
	//?에 해당하는 값 삽입 
	stmt.setString(1,request.getParameter("bo_category"));
	stmt.setString(2,request.getParameter("bo_title"));
	stmt.setString(3,request.getParameter("bo_content"));
	stmt.setString(4,(String)session.getAttribute("sess_id"));
	stmt.setString(5,(String)session.getAttribute("sess_name"));
	stmt.setString(6,request.getRemoteAddr());//클라이언트 ip주소
	int res= stmt.executeUpdate();//insert문 실행
	if(res > 0){
		ajaxMessage = "Success";
	}
}catch(Exception e){
	
}finally{
	try{
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	} catch(Exception e) {
		
	} 
}
out.print(ajaxMessage);
%>
