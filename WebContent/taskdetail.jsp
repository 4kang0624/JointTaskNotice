<%@page import="kr.kro.task.gettask.GetTaskVO"%>
<%@page import="java.sql.Date"%>
<%@page import="kr.kro.task.gettask.GetTaskDAO"%>
<%@page import="java.util.List"%>
<%@page import="kr.kro.task.getclass.GetClassDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String wrnumStr = (String) request.getParameter("wrnum");
	int wrnum = Integer.parseInt(wrnumStr);
	GetClassDAO getClassDAO = GetClassDAO.getInstance();
	List<String> classList = getClassDAO.getClass(1);
	
	// 과제 세부정보 가져오기
	GetTaskDAO getTaskDAO = GetTaskDAO.getInstance();
	GetTaskVO task = getTaskDAO.getTaskDetail(wrnum);
	Date day = task.getDay();
	String classid = task.getClassid();
	String title = task.getTitle();
	String content = task.getContent();
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
	input, select, h2, h3, h4, h5 {
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
<title>Insert title here</title>
</head>
<body>
	<form action="main.jsp" method="get">
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
				<% String sesClassid = (String) session.getAttribute("classid");
				if(sesClassid != null && sesClassid.equals(classid)) { %>
					<td><button type='button' class="btn btn-danger my-2" onclick="location.href='deletetask.jsp?wrnum=<%=wrnum %>'">Delete</button></td>
				<% } %>
			</tr>
		</table>
	</form>
	<% if(classid != null) {%>
	<h2><%=classid.charAt(0) %>학년 <%=classid.charAt(2) %>반의 과제</h2> <% } %>
	<br>
	<h3><%=title %></h3>
	<hr>
	<%=content %>
</body>
</html>