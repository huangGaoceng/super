<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="/static/js/jquery-1.8.3.min.js"></script>
    <title>new jsp</title>
</head>
<body>
<center>
    <h1>添加销售:</h1>
    <form action="javascript:void(0)">
    <table width="500px">
        <tr>
            <td>商品名称:</td>
            <td>
                <select name="productName" id="productName">
                    <option value="0">--请选择商品--</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>销售单价:</td>
            <td><input type="text" name="price" required="required"></td>
        </tr>
        <tr>
            <td>销售数量:</td>
            <td><input type="text" name="quantity" required="required"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="保存"></td>
        </tr>
    </table>
    </form>
</center>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "<%=basePath %>/SupermarketController/getProductList",
            type: "POST",
            dataType: "json",
            success: function (rs) {
                var context = "";
                if (rs) {
                    for (var i in rs) {
                        context += "<option value=" + rs[i].id + ">" + rs[i].productName + "</option>"
                    }
                    $(context).appendTo($("#productName"))
                }
            },
            error: function (rs) {
                alert("系统开小差了，请稍后重试！")
            }
        });
        $(":submit").click(function () {
            var productId = $("#productName").val();
            var price = $("input[name=price]").val();
            var quantity = $("input[name=quantity]").val();
            if (productId==null||productId.trim()=="0") {
                alert("请选择商品！")
            } else {
                if (!price.match("\\d+")||!quantity.match("\\d+")) {
                    alert("单价和数量必须为数字！")
                }else {
                   $.ajax({
                       url: "<%=basePath %>/SupermarketController/addSale",
                       type: "POST",
                       data:{"productId":productId,"price":price,"quantity":quantity,"userId":${sessionScope.userId}},
                       dataType: "json",
                       success: function (rs) {
                           if (rs) alert("添加成功!");
                           else alert("添加失败,请重试!");
                       },
                       error: function () {
                           alert("系统开小差了，请稍后重试！")
                       }
                   });
                }
            }
        });
    });
</script>
</body>
</html>
