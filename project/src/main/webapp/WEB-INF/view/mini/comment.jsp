<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("실행");
	String comment = request.getParameter("comment");
	System.out.println(comment);
	out.println("<div><label>항 어렵띠</label>");
	out.println("<label>수정</label>");
	out.println("<label>삭제</label><br>");
	out.println("<span>" + comment + "</span><br></div>");
%>