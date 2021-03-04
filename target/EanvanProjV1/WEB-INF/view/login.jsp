<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">

    <title>EanVanNetLogin</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <%--JSP写法--%>
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >
    <link href="<%=request.getContextPath()%>/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/fonts/iconic/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/login.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/base.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/css/util.css" rel="stylesheet" type="text/css">

    <%--EL表达式写法--%>
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/login.js" type="text/javascript"></script>

</head>
<body>
<%@ include file="shareViews/header.jsp" %>
<div class="limiter">
    <div class="container-login100" style="background-image: url('#');">
        <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
            <c:choose>
                <%--当不存在login的model值时，为注册页面--%>
                <c:when test="${not empty login}">
                    <form action="/login" class="login100-form validate-form" method="post" id="loginForm">
                        <span class="login100-form-title p-b-30">登录</span>
                        <div class="alert-warning text-center"><c:if test="${not empty error}">${error}</c:if></div>
                        <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                            <c:choose>
                                <c:when test="${empty username}">
                                    <input class="input100" type="text" name="username" placeholder="请输入用户名" autocomplete="off">
                                </c:when>
                                <c:otherwise>
                                    <input class="input100" type="text" name="username" placeholder="请输入用户名" autocomplete="off" value="${username}">
                                </c:otherwise>
                            </c:choose>
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="请输入密码">
                            <input class="input100" type="password" name="password" placeholder="请输入密码">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <div class="text-right p-t-8 p-b-31">
                            <a href="javascript:">忘记密码？</a>
                        </div>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">登 录</button>
                            </div>
                        </div>
                        <div class="txt1 text-center p-t-54 p-b-20">
                            <span>第三方登录</span>
                        </div>
                        <div class="flex-c-m">
                            <a href="#" class="login100-social-item bg1">
                                <i class="fa fa-wechat"></i>
                            </a>
                            <a href="#" class="login100-social-item bg2">
                                <i class="fa fa-qq"></i>
                            </a>
                            <a href="#" class="login100-social-item bg3">
                                <i class="fa fa-weibo"></i>
                            </a>
                        </div>
                    </form>
                    <div class="flex-col-c p-t-25">
                        <a href="/toRegister" class="txt2" id="register">立即注册</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action="/register" class="login100-form validate-form" method="post" id="registerForm">
                        <span class="login100-form-title p-b-30">注册</span>
                        <div class="alert-warning text-center" id="register_info"><c:if test="${not empty R_error}">${R_error}</c:if></div>
                        <div class="wrap-input100 validate-input m-b-23" data-validate="请输入用户名">
                            <c:choose>
                                <c:when test="${empty R_username}">
                                    <input class="input100" type="text" name="username" placeholder="请输入用户名" autocomplete="off" id="username">
                                </c:when>
                                <c:otherwise>
                                    <input class="input100" type="text" name="username" placeholder="请输入用户名" autocomplete="off" value="${R_username}" id="username">
                                </c:otherwise>
                            </c:choose>
                            <span class="focus-input100" data-symbol="&#xf206;"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="请输入密码">
                            <input class="input100" type="password" name="password" placeholder="请输入密码" id="password">
                            <span class="focus-input100" data-symbol="&#xf190;"></span>
                        </div>
                        <div class="container-login100-form-btn p-t-15">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">注 册</button>
                            </div>
                        </div>
                    </form>
                    <div class="flex-col-c p-t-25">
                        <a href="/toLogin" class="txt2" id="backToLogin">返回登录</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<%@include file="shareViews/footer.jsp" %>
</body>
</html>
