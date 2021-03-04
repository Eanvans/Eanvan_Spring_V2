<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"
         import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--移动端 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title>博客发布</title>
    <link rel="icon" href="res/icon/icon128.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wangEditor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/publish.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <%--引入WangEditor的使用--%>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/wangeditor@latest/dist/wangEditor.min.js"></script>
    <script src="http://cdn.bootcss.com/highlight.js/8.0/highlight.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/base.js" type="text/javascript"></script>
</head>
<body>
<%@include file="shareViews/header.jsp" %>

<!-- 中间主体板块 -->
<div class="main w clearfix p-t-50">
    <form action="/publishOffPost" method="post">
        <input type="hidden" name="topic.tid" value="1" id="tid">
        <input type="hidden" name="user.uid" value="${sessionScope.uid}">

        <div class="pub-header"><span></span>&nbsp;发布新的博客</div>
        <div class="pub-title">
            <input type="text" name="title" placeholder="博客标题内容">
        </div>
        <div class="pub-topic">
            <span>标签：</span>
            <div class="topic-list">
                <c:forEach items="${topicList}" var="topic">
                    <a class="topics" href="#" title="${topic.tid}">${topic.name}</a>
                </c:forEach>
            </div>
        </div>

        <div class="pub-textarea">
            <div style="width: 920px;">
                <div id="text-container"> </div>
                <textarea name="content" id="text1" style="display:none;"></textarea>
                <%--<textarea name="content" id="textarea" style="height: 300px;max-height: 1000px;"></textarea>--%>
            </div>
            <div class="btn-group p-t-5 right">
                <button type="submit" class="btn btn-success">发布</button>
                <a class="btn btn-success my-2 my-sm-0" href="/toEanvanBlog" role="button">返回</a>
            </div>
        </div>
    </form>

</div><!-- 主体结束 -->

<script type="text/javascript">
    $(function () {
        const E = window.wangEditor
        const editor = new E( '#text-container')// 传入两个元素
        const $text1 = $('#text1')
        editor.config.onchange = function (html) {
            // 第二步，监控变化，同步更新到 textarea
            $text1.val(html)
        }
        editor.highlight = hljs
        editor.create();
        $text1.val(editor.txt.html())

        /*let editor = new wangEditor('textarea');
        editor.config.menus = [
            'source', '|', 'bold', 'underline', 'italic', 'strikethrough', 'eraser', 'fontsize', '|', 'link', 'table',
            'emotion', '|', 'img', 'insertcode', '|', 'undo',];
        //配置处理图片上传的路径，最好用相对路径
        editor.config.uploadImgUrl = 'upload.do';
        //配置图片上传到后台的参数名称
        editor.config.uploadImgFileName = 'myFileName';
        editor.create();*/

        //一次只能选中一个话题
        let topics = $(".topics");
        let tid = $("#tid");
        topics.click(function () {
            for (let i = 0; i < topics.length; i++) {
                $(topics[i]).css("background-color", "#fff");
            }
            $(this).css("background-color", "#1abc9c");
            tid.val(this.title);
        });
    });

</script>
</body>
</html>
