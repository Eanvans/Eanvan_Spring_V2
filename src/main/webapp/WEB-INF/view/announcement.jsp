<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"
         import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="zh">
    <title>博客内容</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--移动端 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="icon" href="res/icon/icon128.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/post.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/util.css" rel="stylesheet">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript"></script>
</head>
<body>
<%@include file="shareViews/header.jsp" %>

<!-- 中间主体板块 -->
<div class="main w clearfix">
    <!-- 主体左部分 -->
    <div class="main-left">
        <!-- 帖子内容板块 -->
        <div class="post-content">
            <div class="post-title">
                <span class="glyphicon glyphicon-th"></span>&nbsp;${ann.title}
            </div>
            <div class="post-user clearfix">
                <div class="user-image"><a href="#"><img src="${ann.user.headUrl}"></a></div>
                <div class="user-info">
                    <div class="user-name">${ann.user.username}</div>
                    <div class="post-time">编辑于 ${ann.updateTime}</div>
                </div>
            </div>
            <div class="post-desc">
                ${ann.content}
            </div>
        </div>
        <a href="/eanvan" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">返回主页</a>
    </div>

    <!-- 主体右部分 -->
    <div class="main-right">
        <div class="hot-user">
            <div class="clearfix">
                <div class="hot-user-title"><span></span>&nbsp;其他信息</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
