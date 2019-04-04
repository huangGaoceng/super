<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>new jsp</title>
</head>
<body>
<h1>欢迎：<span>${sessionScope.userName}</span>,<a href="<%=basePath %>/SupermarketController/exit" onclick="confirm('确认退出吗？')" target="_parent">退出登陆</a></h1>
</body>
</html>
