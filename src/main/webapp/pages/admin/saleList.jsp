<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css"/>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function () {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function (type, page, current) {
                    return '<%=basePath %>/SupermarketController/getSaleList?pageNum=' + page+"&tj="+${tj};
                },
                itemTexts: function (type, page, current) {
                    switch (type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
    <style type="text/css">
        <%--表格数据水平垂直居中--%>
        table{text-align:center;vertical-align:middle}
        <%--隔行变色--%>
        tbody > tr:nth-child(odd) {
            background-color: chartreuse;
        }
    </style>
</head>
<body>
<h2>销售信息查询:</h2>
<center>
    <span>排序方式:</span>
    <select name="paiXu" id="paiXu">
        <option value="0" <c:if test="${tj==0}"> selected="selected"</c:if>>销售日期</option>
        <option value="1" <c:if test="${tj==1}"> selected="selected"</c:if>>单笔总价</option>
    </select>
    <input type="button" value="提交">
    <table border="1px" cellspacing="0px" width="600px">
        <thead>
        <tr>
            <th>ID</th>
            <th>商品</th>
            <th>单价</th>
            <th>数量</th>
            <th>总价</th>
            <th>销售日期</th>
            <th>销售员</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${pageInfo.list.size()!=0}" >
            <c:forEach items="${pageInfo.list}" var="sale">
                <tr>
                    <td>${sale.id}</td>
                    <td>${sale.productName}</td>
                    <td>${sale.price}</td>
                    <td>${sale.quantity}</td>
                    <td>${sale.totalPrice}</td>
                    <td>${sale.saleDate}</td>
                    <td>${sale.realName}</td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${pageInfo.list.size()==0}" >
             <tr><td colspan="7">暂时没有销售记录！</td></tr>
        </c:if>
        </tbody>
    </table>
    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>
<script type="text/javascript">
    $(function () {
        $(":button").click(function () {
            var tj = $("select[name=paiXu]").val();
            window.location.href = "<%=basePath %>/SupermarketController/getSaleList?tj=" + tj;
        });
    });
</script>
</body>

</html>