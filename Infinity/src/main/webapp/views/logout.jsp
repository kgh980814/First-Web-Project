<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//세션삭제후 login.jsp로 이동
session.invalidate();//세션제거

response.sendRedirect("login.jsp");
%>