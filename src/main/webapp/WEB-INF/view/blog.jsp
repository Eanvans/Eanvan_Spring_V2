<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"
         import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--移动端 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title>最近博客</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript"></script>
</head>

<body>
<%@include file="shareViews/header.jsp" %>
<div class="EBlogBlock">
    <main role="main" class="container ">
        <div class="row">
            <div class="col-md-8 blog-main">
                    <c:if test="${not empty user or user != null}">
                        <c:if test="${user.root == 0}">
                            <div class="btn-group" role="group" aria-label="Basic example">
                                <a class="btn btn-outline-success my-2 my-sm-0" href="/toOffPublish" role="button">发布新的blog</a>
                            </div>
                        </c:if>
                    </c:if>

                <ul class="list-group p-t-10">
                    <c:if test="${blogList != null}">
                        <c:forEach items="${blogList}" var="blog" varStatus="stat">
                            <li class="list-group-item">
                                <div class="card-body">
                                    <a href="/toPostDetail?pid=${blog.pid}"><h5 class="card-title">${blog.title}</h5></a>
                                    <p class="">${blog.publishTime}&nbsp;&nbsp;<a href="#">${blog.user.username}</a></p>
                                    <p class="card-text">&nbsp;&nbsp;${blog.content}</p>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>

                <%--分页查询的方式--%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">上一页</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">下一页</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <aside class="col-md-4 blog-sidebar">
                <div class="p-4 mb-3 bg-light rounded">
                    <h4 class="font-italic">加油，奋斗</h4>
                    <p class="mb-0">&nbsp;&nbsp;起点决定不了终点，只要永远还在攀登顶峰的路上就永远不会走下坡路！</p>
                    <p class="mb-0">&nbsp;&nbsp;这里是随手记录的一些博客内容~</p>
                </div>
                <div class="p-4">
                    <h4 class="font-italic">回顾</h4>
                    <ol class="list-unstyled mb-0">
                        <li><a href="#">Nov 2020</a></li>
                    </ol>
                </div>
                <div class="p-4">
                    <h4 class="font-italic"></h4>
                    <ol class="list-unstyled">
                        <!--<li><a href="#">GitHub</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Facebook</a></li>-->
                    </ol>
                </div>
            </aside>

        </div>
    </main>
</div>
<%@include file="shareViews/footer.jsp" %>
</body>
</html>