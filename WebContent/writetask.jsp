<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if(id == null) { response.sendRedirect("loginwrite.jsp"); } 
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
		margin-left: 20px;
		margin-right: 20px;
		}
	h3, label {
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<br>
	<h3>과제 등록하기</h3>
	<hr>
	<form action="writetaskController.jsp" method="post">
		<div class="form-group">
			<label for="title">날짜</label>
			<table>
				<tr>
					<td>
						<select name='year' class="custom-select d-block" >
							<% for(int i=2020; i<=2025; i++) { %>
								<option value='<%=i %>'><%=i %>년</option>
							<% } %>
						</select>
					</td>
					<td>
						<select name='month' class="custom-select d-block" >
							<% for(int i=1; i<=12; i++) { %>
								<option value='<%=i %>'><%=i %>월</option>
							<% } %>
						</select>
					</td>
					<td>
						<select name='day' class="custom-select d-block" >
							<% 
							for(int i=1; i<=31; i++) { %>
								<option value='<%=i %>'><%=i %>일</option>
							<% } %>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div class="form-group">
			<label for="title">과제</label>
			<input id="title" name="bTitle" type="text" class="form-control" placeholder="과제" required>
        </div>
		<div class="form-group">
			<label for="content">세부 내용</label>
			<textarea id="content" name="bContent" class="form-control" placeholder="세부 내용을 입력하세요" rows="5" required></textarea>
        </div>
        <table>
        	<tr>
        		<td><input class="btn btn-primary inputbtn" type="submit" value="등록" /></td>
        		<td><button type='button' class="btn btn-secondary my-2" onclick="location.href='main.jsp'">과제 목록</button></td>
        	</tr>
        </table>
	</form>
</body>
</html>