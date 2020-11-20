<%@page import="kr.kro.task.settask.SetTaskDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String classid = (String) session.getAttribute("classid");
	String title = request.getParameter("bTitle");
	String content = request.getParameter("bContent");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	if (month.length() == 1) month = '0' + month;
	if (day.length() == 1) day = '0' + day;
	String writeDay = request.getParameter("year") + month + day;
	
	SetTaskDAO dao = SetTaskDAO.getInstance();
	
	boolean suc = dao.setTask(writeDay, classid, title, content);
	if(suc == false){ %>
	<script>
		alert("날짜가 올바르지 않거나 사용가능한 글자수를 넘어섰습니다.");
		location.href="writetask.jsp";
	</script>
<% } else { %>
	<script>
		alert("과제가 성공적으로 등록되었습니다!");
		location.href="main.jsp";
	</script>
<% } %>