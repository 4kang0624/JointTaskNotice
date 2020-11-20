<%@page import="kr.kro.task.getclass.GetClassDAO"%>
<%@page import="kr.kro.task.login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%
    	request.setCharacterEncoding("utf-8");
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	LoginDAO dao = LoginDAO.getInstance();
    	
    	boolean suc = dao.userCheck(id, pw);
    	
    	if(suc == false){ %>
    		<script>
	    		alert("아이디 또는 비밀번호가 틀렸습니다. 다시 시도해주세요.");
	    		location.href="login.jsp";
    		</script>
    	<% } else {
    		session.setAttribute("id", id);
    		GetClassDAO getclass = GetClassDAO.getInstance();
    		String classid = getclass.getMyClass(id);
    		session.setAttribute("classid", classid);
    		response.sendRedirect("main.jsp");
    	 }
    %>