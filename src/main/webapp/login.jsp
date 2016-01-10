<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<base href="<%=basePath%>">
</head>

<body>
<c:out value="${msg }"></c:out>
	login.jsp请登录
	<form action="<%=basePath%>login" method="post">
		<label>用户名<input name="username" type="text"></label> <label>密码<input
			name="password" type="password"></label> <label>登录<input
			value="登录" type="submit"></label>
	</form>

</body>
</html>