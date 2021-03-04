<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*"%>
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
    <title>关于我们</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/util.css">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<%@include file="shareViews/header.jsp"%>
<div role="main" class="EHomeBlock">
    <div class="jumbotron EanvanBlogBg">
        <div class="container">
            <h1 class="display-3" style="text-align: center">Eanvan</h1>
            <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center">
                <div class="col-md-12 p-lg-12 mx-auto my-12">
                    <p class="lead font-weight-normal" style="color: white">
                        &nbsp;&nbsp;全球化的步伐无法阻挡，未来的我们将会拥抱世界。在这里，我们为年轻的你们架设通向世界的小小桥梁。神秘古老的亚洲，年轻富有活力的美洲，古典优雅的欧洲，还有狂野放浪的澳洲。
                        只有不同文明的碰撞才能使你我的未来更加丰富多彩。在Eanvan你可以和来自五湖四海的小伙伴们交流海外学习生活的心得，我们也有来自不同国家的学长学姐们给海外独自生活的你提供
                        帮助。同时我们也会分享来自不同专业的学习资料和部分教材。你也可能联系到当地的学长学姐们为孤立无援的你伸出援手。Eanvan是你通向世界的桥梁，也是你在彼岸小小的港湾。
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<div role="main" class="EHomeBlock">
    <div class="badge-info">
        <div class="container">
            <h1 class="display-5" style="text-align: center">联系方式</h1>
        </div>
    </div>
</div>
<%@include file="shareViews/footer.jsp"%>
</body>
</html>