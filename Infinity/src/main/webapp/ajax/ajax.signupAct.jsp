<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>

<%
//회원가입후 로그인페이지로 이동;
String mb_id = request.getParameter("mb_id");
String mb_pw = request.getParameter("mb_pw");
String mb_name = request.getParameter("mb_name");
String mb_email = request.getParameter("mb_email");
String mb_zipcode = request.getParameter("mb_zipcode");
String mb_addr = request.getParameter("mb_addr");
String mb_detailaddr = request.getParameter("mb_detailaddr");
String mb_phone = request.getParameter("mb_phone");
String mb_birth = request.getParameter("mb_birth");
String mb_gender = request.getParameter("mb_gender");

//jdbc 프로그래밍
String url="jdbc:mysql://localhost:3306/bigdata?serverTimezone=UTC";
String user="root";
String password="bigdata";

//+= 쓸시에는 메모리 차지를 많이 하므로 StringBuffer 클래스 사용
StringBuffer qry = new StringBuffer();
qry.append(" INSERT INTO big_member (mb_id,mb_pw,mb_name,mb_email, ");
qry.append(" mb_zipcode,mb_addr,mb_detailaddr,mb_phone,mb_birth,mb_gender,mb_joindate) ");
qry.append(" VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now()) ");

String sql=qry.toString();

int idx = 1;
//지역변수 -> 전역변수
Connection con = null;
PreparedStatement stmt = null;
String ajaxMessage = "Fail";
try{
	//JDBC 드라이버 로드 및 연결
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, user, password);
	stmt = con.prepareStatement(sql);
	
	//쿼리의 해당 물음표에 맞는 값 넣기
	//stmt.setString(1,mb_~~);
	stmt.setString(idx++, mb_id);
	stmt.setString(idx++, mb_pw);
	stmt.setString(idx++, mb_name);
	stmt.setString(idx++, mb_email);
	stmt.setString(idx++, mb_zipcode);
	stmt.setString(idx++, mb_addr);
	stmt.setString(idx++, mb_detailaddr);
	stmt.setString(idx++, mb_phone);
	stmt.setString(idx++, mb_birth);
	stmt.setString(idx++, mb_gender);
	//sql문 실행
	int res = stmt.executeUpdate();
	if(res != 0){
		ajaxMessage = "Success";
	}
}catch (Exception e){
	e.getLocalizedMessage();//에러메시지 출력
}finally{
	//연결 끊기
	try{
		if(stmt != null) 
			stmt.close();
		if(con != null) 
			con.close();
	}catch (Exception e){
		e.getLocalizedMessage();
	}
}
out.print(ajaxMessage);
%>