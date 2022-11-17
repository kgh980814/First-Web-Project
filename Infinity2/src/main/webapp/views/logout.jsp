<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:remove var="sess_id"/>
<c:remove var="sess_name"/>
<c:redirect url="Login"></c:redirect>
<%-- <%
//세션삭제후 login.jsp로 이동
session.invalidate();//세션제거

response.sendRedirect("Login");
%> --%>