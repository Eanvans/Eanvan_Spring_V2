<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header clearfix">
    <div class="w">
        <h1 class="logo"><a href="/toMain">Eanvan</a></h1>
        <ul class="left-nav">
            <li class="current-nav"><a href="/toMain">首页</a></li>
            <li><a href="/listTopic">话题</a></li>
            <%--<li><a href="/listImage">文章</a></li>--%>
            <li><a href="/toMessage">消息</a></li>
        </ul>

        <ul class="right-nav">
            <c:choose>
                <c:when test="${sessionScope.uid != null}">
                    <li class="login2 relative">
                        <a href="/profile/toMyProfile" id="profile"><img src="${sessionScope.headUrl}"></a>
                        <ul id="down-menu">
                            <li><a href="/profile/toMyProfile">个人主页</a></li>
                            <%--登出的选项还有待整理--%>
                            <li><a href="/logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="login">
                        <a href="/toLogin">登录</a>
                        <a href="/toLogin">/</a>
                        <%--
                        暂时不明白这里是什么用法
                        <a href="toLogin.do#register">注册</a>
                        --%>
                        <a href="/toRegister">注册</a>
                    </li>
                </c:otherwise>
            </c:choose>
            <li>
                <a href="#"><span class="glyphicon glyphicon-search"></span></a>
            </li>
            <li><input type="text"></li>
        </ul>
    </div>
</div>
