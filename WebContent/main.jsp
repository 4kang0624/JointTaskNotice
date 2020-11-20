<%@page import="kr.kro.task.gettask.GetTaskVO"%>
<%@page import="java.util.Collections"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.kro.task.gettask.GetTaskDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.kro.task.getclass.GetClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String classid = (String) request.getParameter("classid");
	GetClassDAO getClassDAO = GetClassDAO.getInstance();
	List<String> classList = getClassDAO.getClass(1);
	GetTaskDAO getTaskDAO = GetTaskDAO.getInstance();
	List<Date> taskList = getTaskDAO.getDate(classid);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	body {
		background-color: #F6F6F6;
		margin-left: 10px;
		margin-right: 10px;
		font-family: 'Nanum Gothic', sans-serif;
	}
	input, select, h2, h4, h5 {
		font-family: 'Nanum Gothic', sans-serif;
	}
	select {
		width: 150px;
	}
	h2 {
		font-weight: bold;
	}
	h5 {
		font-weight: 600;
		margin-left: 10px;
	}
	
</style>
<title>과제 알리미</title>
</head>
<body>
	<form>
		<table>
			<tr>
				<td> <select name='classid' class="custom-select d-block" >
						<option value="none" selected="selected">반 선택</option> 
					<% for (String str : classList) { %>
						<option value='<%=str %>'><%=str.charAt(0) %>학년 <%=str.charAt(2) %>반</option>
					<% } %>
					</select></td>
				<td><input class="btn btn-primary my-2" type="submit" value='반 선택'></td>
				<td><button type='button' class="btn btn-secondary my-2" onclick="location.href='writetask.jsp'">등록</button></td>
				<% if(session.getAttribute("id") != null) { %>
					<td><button type='button' class="btn btn-danger my-2" onclick="location.href='logout.jsp'">Logout</button></td>
				<% } else { %>
					<td><button type='button' class="btn btn-success my-2" onclick="location.href='login.jsp'">Login</button></td>
				<% } %>
			</tr>
		</table>
	</form>
	<% if(classid == null || classid.length() == 4) { %> <h2> 반을 선택해주세요!</h2> <% } %>
	<% if(classid != null && classid.length() == 5) { %> <h2><%=classid.charAt(0) %>학년 <%=classid.charAt(2) %>반의 과제</h2> <% } %>
	<% char dayofWeek = 'e'; %>
	<% for(Date day : taskList) { %>
	<%
		switch(day.getDay()) {
			case 0: dayofWeek = '日'; break;
			case 1: dayofWeek = '月'; break;
			case 2: dayofWeek = '火'; break;
			case 3: dayofWeek = '水'; break;
			case 4: dayofWeek = '木'; break;
			case 5: dayofWeek = '金'; break;
			case 6: dayofWeek = '土'; break;
		}
	%>
		<hr>
		<h5><%=day.getYear()+1900 %>년 <%=day.getMonth()+1 %>월 <%=day.getDate() %>일 (<%=dayofWeek %>)</h5>
		<hr>
		<% List<GetTaskVO> taskofDate = getTaskDAO.getTaskofDate(classid, day); %>
		<% for(GetTaskVO task : taskofDate) { %>
			<a href="taskdetail.jsp?wrnum=<%=task.getWrnum() %>"><%=task.getTitle() %><br></a>
		<% } %>
	<% } %>
	<br>
	<footer class="blockquote-footer">
  	<p>© 2020. 4kang0624.</p>
    <p>
    <a href="">Top</a>
    </p>
</footer>
</body>
</html>