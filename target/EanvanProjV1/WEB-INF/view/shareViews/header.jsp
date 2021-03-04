<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--导航条-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <a class="navbar-brand" href="/eanvan">Eanvan</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item <c:if test="${not empty page && page.equals('main')}"> active </c:if>">
                <a class="nav-link" href="/eanvan">主页</a>
            </li>
            <li class="nav-item <c:if test="${not empty page && page.equals('about')}"> active </c:if>">
                <a class="nav-link" href="/about">关于</a>
            </li>
            <li class="nav-item <c:if test="${not empty page && page.equals('blog')}"> active </c:if>">
                <a class="nav-link" href="/toEanvanBlog">博客</a>
            </li>
            <li class="nav-item <c:if test="${not empty page && page.equals('comm')}"> active </c:if>">
                <a class="nav-link" href="/toMain">社区</a>
            </li>
        </ul>
        <c:if test="${empty sessionScope.uid}">
            <a class="btn btn-outline-success my-2 my-sm-0" href="/toLogin" role="button">登录</a>
        </c:if>
        <c:if test="${not empty sessionScope.uid}">
            <div class="dropdown">
                <button class="btn btn-outline-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    ${sessionScope.username}
                </button>
                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <a class="dropdown-item" href="/profile/userCenter">个人中心</a>
                    <a class="dropdown-item" href="#">我的消息</a>
                    <a class="dropdown-item" href="/logout">登出</a>
                </div>
            </div>
        </c:if>
    </div>
</nav>
<!--导航条结尾-->
