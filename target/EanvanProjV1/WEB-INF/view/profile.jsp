<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"
         import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--移动端 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title>个人中心</title>
    <link href="${pageContext.request.contextPath}/res/icon/icon128.ico" rel="icon">
    <!-- Bootstrap 连接，本地调试可以使用本地模板，但是放在网站上使用CDN链接对于用户来说更加高效
        因为会从浏览器缓存中直接加载-->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath}/fonts/iconic/css/material-design-iconic-font.min.css "
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/util.css" rel="stylesheet" type="text/css">

    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript"></script>
</head>
<body>
<%@include file="shareViews/header.jsp" %>

<!--使用模态框进行文件的上传-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">修改头像</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="/upload" enctype="multipart/form-data">
                    <input name="myFileName" type="file" class="custom-file-input" id="inputGroupFile">
                    <div class="text-center">
                        <button type="button" class="btn btn-outline-light">
                            <label for="inputGroupFile">
                                <img class="rounded-circle" id="MYimg" src=""/>
                                <div id="inputLabel">
                                    <i class="fa fa-photo fa-5x" aria-hidden="true"></i>
                                    <div>选择文件</div>
                                </div>
                            </label>
                        </button>
                    </div>
                    <div class="text-info text-center p-t-5 p-b-5">*上传文件不能超过3M哦~</div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">上传</button>
                        <a class="btn btn-primary" href="#" role="button">重置</a>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>


<div class="container-fluid" style="padding-top: 50px">
    <div class="row">
        <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-info sidebar collapse col-xl-2">
            <div class="sidebar-sticky pt-3">
                <div class="list-group">
                    <button type="button" class="list-group-item list-group-item-action active">
                        个人中心
                    </button>
                    <button type="button" class="list-group-item list-group-item-action">
                        我的消息
                        <span class="badge badge-primary badge-pill">10</span>
                    </button>
                    <button type="button" class="list-group-item list-group-item-action">我关注的</button>
                    <button type="button" class="list-group-item list-group-item-action">我发表的文章</button>
                </div>
            </div>
        </nav>


        <main role="main" class="col-md-9 col-lg-10 px-md-4">
            <c:choose>
                <c:when test="${profile.equals('userCenter')}">
                    <div class="m-l-20 p-t-32">
                        <div class="container">
                            <div class="row">
                                <div class=" col-lg-3">
                                    <div class="text-center p-t-32">
                                        <img class="rounded-circle personalIcon" id="" src="${user.headUrl}"/>
                                        <div>当前头像</div>
                                        <a href="#" class="" data-toggle="modal" data-target="#exampleModal">修改头像</a>
                                    </div>
                                </div>
                                <div class="col-lg">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <div class="list-row-left">昵称:</div>
                                            <div class="list-row-right">${user.nickname}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="list-row-left">用户名:</div>
                                            <div class="list-row-right">${user.username}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="list-row-left">性别:</div>
                                            <div class="list-row-right">${user.gender}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="list-row-left">生日:</div>
                                            <div class="list-row-right">${user.birthday}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="list-row-left">箴言:</div>
                                            <div class="list-row-right">${user.introduction}</div>
                                        </li>
                                        <li class="list-group-item">
                                            <div class="list-row-left">学校:</div>
                                            <div class="list-row-right">${user.school}</div>
                                        </li>
                                            <%--<li class="list-group-item">
                                                <div class="list-row-left">个人标签:</div>
                                                <div class="list-row-right"></div>
                                            </li>--%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:when test="${profile.equals('userMessage')}">

                </c:when>
                <c:when test="${profile.equals('followList')}">

                </c:when>
                <c:when test="${profile.equals('userPosts')}">

                </c:when>
            </c:choose>

        </main>
    </div>
</div>

<%@include file="shareViews/footer.jsp" %>
</body>
</html>
