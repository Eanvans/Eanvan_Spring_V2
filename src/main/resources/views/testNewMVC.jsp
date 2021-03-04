<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>Eanvan</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/util.css">
    <style>
        div{
            text-align: center;
        }
    </style>
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<%@include file="shareViews/header.jsp"%>
<div class="p-t-150">
    <h1>这是一个测试页！</h1>
    <a href="/eanvan">返回主页</a>
</div>
<%@include file="shareViews/footer.jsp"%>
</body>
</html>