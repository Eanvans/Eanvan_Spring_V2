<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/1/12
  Time: 10:22
  Eanvan的主页，用于Eanvan官方的博客更新与声明
--%>
<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>
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
    <title>Eanvan</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <!-- Bootstrap 连接，本地调试可以使用本地模板，但是放在网站上使用CDN链接对于用户来说更加高效
    因为会从浏览器缓存中直接加载-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<%@include file="shareViews/header.jsp" %>

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
        <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <c:forEach items="${carouselImg}" var="img" varStatus="sta">
            <c:choose>
                <c:when test="${sta.count == 1}">
                    <div class="carousel-item active">
                        <img src="imgs/${img.headUrl}" class="d-block w-100" alt="${img.memo}">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${img.memo}</h5>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="carousel-item">
                        <img src="imgs/${img.headUrl}" class="d-block w-100" alt="${img.memo}">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${img.memo}</h5>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!--介绍区域-->
<div class="container EHomeBlock p-t-20">
    <div class="row">
        <div class=" col-md-12">
            <h1>Eanvan是什么</h1>
            <div><img src="imgs/split_img.png"></div>
            <p class="ETextBody">
               ${what}
            </p>
            <hr>
            <p class="ETextBody">
                ${how}
            </p>
        </div>
    </div>
</div>
</div>
<!---->

<!--初衷介绍区域-->
<div class="container EHomeBlock">
    <div class="row">
        <div class=" col-md-12">
            <h1>Eanvan初衷</h1>
            <div><img src="imgs/split_img.png"></div>
            <p class="ETextBody">
                ${why}
            </p>
        </div>
    </div>
</div>
<!---->

<!--我们得成员-->
<div class="album py-5 bg-light">
    <div class="container EHomeBlock">
        <div class="row">
            <div class=" col-md-12">
                <h1>Eanvan目前的成员</h1>
            </div>
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                         xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                         role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                    </svg>
                    <div class="card-body">
                        <p class="card-text">yifan</p>
                        <div>
                            <p>一定要有遥不可及的梦想，因为只有遥不可及，你的努力接近才有意义！</p>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <%--等做好了个人主页再开发个人情况的查看选项--%>
                               <%-- <button type="button" class="btn btn-sm btn-outline-secondary">查看</button>--%>
                            </div>
                            <small class="text-muted"></small>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                         xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false"
                         role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                    </svg>
                    <div class="card-body">
                        <p class="card-text">ash</p>
                        <div>
                            <p>一条励志遨游世界的咸鱼。远在天涯，心系故乡。</p>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="btn-group">
                                <%--<button type="button" class="btn btn-sm btn-outline-secondary">查看</button>--%>
                            </div>
                            <small class="text-muted"></small>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!---->

<!--最近Blogs区域-->
<div class="container EHomeBlock">
    <div class="row">
        <div class=" col-md-12">
            <h1>最近Blogs</h1>
            <div class="row mb-2">
                <div class="col-md-6">
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-primary">Starting</strong>
                            <h3 class="mb-0">Eanvan的起点</h3>
                            <div class="mb-1 text-muted">2020/11/17</div>
                            <p class="card-text mb-auto"> 11月17日，将会是Eanvan起步的第一天，我们从今天开始正式起航！</p>
                            <a href="/toEanvanBlog" class="stretched-link">了解更多</a>
                        </div>
                        <div class="col-auto d-none d-lg-block">
                            <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg"
                                 preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                                 aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
                                <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                            </svg>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-success">Plan</strong>
                            <h3 class="mb-0">Eanvan开发计划</h3>
                            <div class="mb-1 text-muted">2020/11/17</div>
                            <p class="mb-auto">
                                Eanvan社区可能会是一个长期的搭建项目，我们将投入大量的经历和时间在网站内容的充实和开发上，
                                旨在给予你们更好的使用体验！
                            </p>
                            <a href="/toEanvanBlog" class="stretched-link">了解更多</a>
                        </div>
                        <div class="col-auto d-none d-lg-block">
                            <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg"
                                 preserveAspectRatio="xMidYMid slice" focusable="false" role="img"
                                 aria-label="Placeholder: Thumbnail"><title>Placeholder</title>
                                <text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="shareViews/footer.jsp" %>
</body>
</html>