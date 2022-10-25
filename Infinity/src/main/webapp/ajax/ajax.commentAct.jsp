<%@page import="org.json.simple.JSONObject"%>
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
qry.append(" INSERT INTO big_comment (com_num,com_refNum,com_content, ");
qry.append(" com_mb_id,com_mb_name,com_inputDate) ");
qry.append(" VALUES (null, ?, ?, ?, ?, now()) ");

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
	stmt.setString(1,request.getParameter("com_refNum"));
	stmt.setString(2,request.getParameter("com_content"));
	stmt.setString(3,(String)session.getAttribute("sess_id"));
	stmt.setString(4,(String)session.getAttribute("sess_name"));
	
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


/* out.print("<div>");
out.print("<div>"+session.getAttribute("sess_name")+"</div>");
out.print("<div>"+request.getParameter("com_content")+"</div>");
out.print("</div>");
out.print("<hr>"); */
//out.print(ajaxMessage);
//원래는 json데이터로 보내야함.
//{"res" : "Success","sql" :""}<-json데이터 출력방법
JSONObject obj = new JSONObject();//객체 생성//{}만들기
obj.put("res", ajaxMessage);//{"res" : "Success"}
obj.put("sql", sql);//"sql" :"INSERT 문"}
out.print(obj);
%>
