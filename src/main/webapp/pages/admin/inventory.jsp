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
</head>
<body>
<h2>查看库存:</h2>
	<center>
        <span>商品名称:</span>
        <select id="productNameId">
            <option value="0">-请选择商品-</option>
        </select>
        <h1></h1>
    </center>
<script type="text/javascript">
    $(function () {
        //ajax请求获取所有商品名称用于下拉列表
        $.ajax({
            url:"<%=basePath %>/SupermarketController/getProductList",
            type:"POST",
            dataType:"JSON",
            success:function (rs) {
                var context = "";
                if (rs) {
                    for (var i in rs) {
                        context += "<option value=" + rs[i].id + ">" + rs[i].productName + "</option>"
                    }
                    $(context).appendTo($("#productNameId"));
                }
            }
        });
        $("#productNameId").change(function () {
            var productNameId = $("#productNameId").val();
            if (productNameId==0){
                alert("请选择商品！");
            }else {
                $.ajax({
                    url:"<%=basePath %>/SupermarketController/getProductById",
                    type:"POST",
                    data:{"id":productNameId},
                    dataType:"JSON",
                    success:function (rs) {
                        $("h1").html(rs.productName+"的库存是:"+rs.quantity)
                    }
                })
            }
        })

    });
</script>
</body>
</html>