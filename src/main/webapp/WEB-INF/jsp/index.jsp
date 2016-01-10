<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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

	欢迎来到首页index.jsp 当前登录用户：<c:out value="${subject.principal}"></c:out>
	<a href="role">/role </a>
	<a href="authenticated">/authenticated </a>
	<shiro:hasPermission name="user:add">
		<a href="/useradd">useradd</a>
	</shiro:hasPermission>
	<shiro:hasPermission name="user:view">
		<a href="user:view">userview</a>
	</shiro:hasPermission>
</body>
</html>