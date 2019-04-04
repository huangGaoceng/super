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
    <title>登陆页面</title>
    <style type="text/css">
        div {
            background-color: #94EE94;
            width: 400px;
            height: 200px;
            padding-top:20px;/*表示离内容离顶部的距离*/
        }
        table{
            text-align:center;/*表格中的数据水平居中*/
            vertical-align:middle/*表格中的数据垂直居中*/
        }
    </style>
</head>
<body>
<center>
    <div>
        <h1>小型进销管理系统</h1>
        <table cellspacing="0" width="300">
            <tr>
                <td>用户名:</td>
                <td><input type="text" name="userName" pattern="\S+" required></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input type="text" name="pwd" pattern="[A-Za-z0-9_-]{6,12}" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="button" value="登录"></td>
            </tr>
        </table>
    </div>
</center>
<script type="text/javascript">
    $(function () {
        $(":button").click(function () {
         var userName = $("input[name=userName]").val();
         var pwd = $("input[name=pwd]").val();
         if (userName==null||userName.trim()==""){
             alert("用户名必填！")
         }else {
             if (pwd==null||pwd.trim()==""){
                 alert("密码必填！")
             }else {
                 $.ajax({
                     url:"<%=basePath %>/SupermarketController/Login",
                     type:"POST",
                     data:{"userName":userName,"pwd":pwd},
                     dataType:"json",
                     success:function (rs) {
                         if (rs){
                             window.location.href="admin.jsp";
                         }else {
                             alert("用户名密码错误，请重试！")
                         }
                     },
                     error:function (rs) {
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
