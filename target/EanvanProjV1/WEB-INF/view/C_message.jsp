<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wangEditor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/message.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
<%@ include file="shareViews/C_header.jsp" %>


<!-- 中间主体板块 -->
<div class="main w clearfix" style="margin-bottom: 360px">
    <div class="message-header"><span></span>&nbsp;消息列表</div>
    <c:forEach items="${map}" var="item">
        <div class="m-wrap">
            <div class="m-date">${item.key}</div>
            <ul class="m-list">
                <c:forEach items="${item.value}" var="m">
                    <li><a href="/profile/toProfile?uid=${m.otherId}"><span>${m.otherUsername}</span></a>${m.operation}<a href="/toPost?pid=${m.postId}"><span>${m.displayedContent}</span></a></li>
                </c:forEach>
            </ul>
        </div>
    </c:forEach>
</div><!-- 主体结束 -->


<%@ include file="shareViews/C_footer.jsp" %>
</body>
</html>



