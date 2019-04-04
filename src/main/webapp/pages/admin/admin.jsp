<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/static/js/jquery-1.8.3.min.js"></script>
	<title>首页</title>
</head>
	<frameset rows="20%,*">
        <frame name="top" src="<%=basePath %>/pages/admin/welcome.jsp">
        <frameset cols="20%,*">
            <frame name="left" src="<%=basePath %>/pages/admin/left.jsp">
            <frame name="right" src="<%=basePath %>/pages/admin/center.jsp">
        </frameset>
    </frameset>

</html>