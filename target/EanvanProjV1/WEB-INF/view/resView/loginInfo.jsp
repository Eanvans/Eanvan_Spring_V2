<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">

    <style type="text/css">
        .main div {
            margin: 200px auto;
            width: 600px;
            font-size: 20px;
        }
    </style>
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/base.js"></script>
</head>
<body>
<%@ include file="../shareViews/header.jsp" %>
<!-- 中间主体板块 -->
<div class="main w clearfix">
    <div>
        ${info}
        <br> <br>
        <a href="/toLogin"><span class="showbox"></span> 秒后将自动跳转到登录页面，若没有跳转请点击这里！</a>
    </div>
</div><!-- 主体结束 -->
<%@ include file="../shareViews/footer.jsp" %>
<script type="text/javascript">
    let timeout = 5;
    let fn_redirect5 = function() {
        let showBox = $(".showbox");
        showBox.html(timeout);
        timeout--;
        if (timeout == 0) {
            window.location.href = "/toLogin";
        } else {
            setTimeout("fn_redirect5()", 1000);
        }
    }
    fn_redirect5();
</script>
</body>
</html>