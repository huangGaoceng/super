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
<h2><a href="<%=basePath %>/pages/admin/addSale.jsp" target="right">销售</a></h2>
<h2><a href="<%=basePath %>/SupermarketController/getSaleList" target="right">销售信息查询</a></h2>
<h2><a href="<%=basePath %>/pages/admin/inventory.jsp" target="right">查看库存</a></h2>
</body>
</html>