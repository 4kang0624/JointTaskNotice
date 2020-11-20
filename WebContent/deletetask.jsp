<%@page import="kr.kro.task.deltask.DelTaskDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String classid = (String) session.getAttribute("classid");
	String wrnumStr = (String) request.getParameter("wrnum");
	int wrnum = Integer.parseInt(wrnumStr);
	
	DelTaskDAO dao = DelTaskDAO.getInstance();
	if(dao.deleteCheck(wrnum, classid)){ %>
		<script>
			alert("권한이 없습니다.");
			location.href="main.jsp";
		</script>
<%	} else { 
		dao.deleteTask(wrnum); %>
		<script>
			alert("삭제되었습니다.");
			location.href="main.jsp";
		</script>
<%	} %>