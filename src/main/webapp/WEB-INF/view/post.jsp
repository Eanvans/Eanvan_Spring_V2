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
    <link href="${pageContext.request.contextPath}/css/wangEditor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/post.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/util.css" rel="stylesheet">
    <!--有顺序，必须要先加载jquery再去加载播放组件，是否其他组件也一样如此？-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/wangEditor.js" type="text/javascript"></script>
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
                <span class="glyphicon glyphicon-th"></span>&nbsp;${post.title}
            </div>
            <div class="post-user clearfix">
                <div class="user-image"><a href="#"><img src="${post.user.headUrl}"></a></div>
                <div class="user-info">
                    <div class="user-name">${post.user.username}</div>
                    <div class="post-time">编辑于 ${post.publishTime}</div>
                </div>
                <div class="other-count">
                    <span class="reply-count"><a href="#">回复 ${post.replyCount}</a></span>&nbsp;
                    <span class="scan-count"><a href="#">浏览 ${post.scanCount}</a></span>
                </div>
            </div>
            <div class="post-desc">
                ${post.content}
            </div>
        </div>

        <!-- 帖子回复内容板块 -->
        <div class="post-reply">
            <!-- 回复区标题 -->
            <div class="post-reply-title">
                <h2 class="reply-count"><span class="glyphicon glyphicon-th"></span>&nbsp;${post.replyCount}条回帖</h2>
                <a class="" data-toggle="collapse" href="#collapse2" role="button"
                   aria-expanded="false" aria-controls="collapse2">回复</a>&nbsp;
            </div>
            <!-- 回复区内容 -->
            <div class="post-reply-content">
                <!-- 回复条目 -->
                <c:forEach items="${replyList}" var="reply" varStatus="status">
                    <div class="post-reply-item clearfix">
                        <div class="item-info">
                            <div class="item-image">
                                <a href="<%--toProfile.do?uid=${reply.user.uid}--%>">
                                    <img src="${reply.user.headUrl}">
                                </a>
                            </div>
                            <div class="item-user-name"><a href="#">${reply.user.username}</a></div>
                            <div class="item-date">发表于 ${reply.replyTime}
                                <a class="item-more-reply" data-toggle="collapse" href="#collapse1" role="button"
                                   aria-expanded="false" aria-controls="collapse1">评论</a>
                            </div>
                            <div class="item-content">${reply.content}</div>

                            <!-- 楼中楼，即嵌套的回复内容 -->
                            <div class="item-more">
                                <c:forEach items="${reply.commentList}" var="comment">
                                    <div class="item-wrap">
                                        <div class="item-more-1">
                                            <a href="<%--toProfile.do?uid=${comment.user.uid}--%>"
                                               class="item-more-user">${comment.user.username}</a>
                                            <span>：</span>
                                            <span class="item-more-content">${comment.content}</span>
                                        </div>
                                        <div class="item-more-date">${comment.commentTime}</div>
                                            <%--对于评论的评论，可能会造成混乱，但是之后要添加@用户的功能--%>
                                            <%--<div class="item-more-other">
                                                  <a href="#s${status.count}" class="item-more-reply">回复</a>&nbsp;
                                              </div>--%>
                                    </div>
                                </c:forEach>
                                <!-- 楼中楼的回复框 -->
                                <div class="collapse" id="collapse1">
                                    <div class="reply-input">
                                        <form action="/comment" method="post">
                                            <input type="hidden" name="reply.post.pid" value="${post.pid}"/>
                                            <input type="hidden" name="reply.rid" value="${reply.rid}"/>
                                            <div class="input-group">
                                                <textarea class="form-control" aria-label="With textarea"
                                                name="content"></textarea>
                                            </div>
                                            <button type="submit">回复</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- 楼中楼结束 -->
                        </div>
                    </div>
                </c:forEach>
                <!-- 回复条目结束 -->
            </div>
        </div>

        <!-- 回复区，付文本编辑器板块 -->
        <div class="collapse" id="collapse2">
            <div id="reply-area" class="post-reply-textarea">
                <div style="width: 650px;margin: 10px 20px">
                    <form action="/reply" method="post">
                        <input type="hidden" name="post.pid" value="${post.pid}"/>
                        <textarea name="content" id="textarea" style="height: 200px;max-height: 1000px;"></textarea>
                        <button type="submit" class="reply-button">回帖</button>
                    </form>
                </div>
            </div>
        </div>

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

<script type="text/javascript">
    $(function () {
        let editor = new wangEditor('textarea');
        editor.config.menus = [
            'source', '|', 'bold', 'underline', 'italic', 'strikethrough', 'eraser', 'fontsize', '|', 'link', 'table',
            'emotion', '|', 'img', 'insertcode', '|', 'undo',];
        //配置处理图片上传的路径，最好用相对路径
        editor.config.uploadImgUrl = 'upload.do';
        //配置图片上传到后台的参数名称
        editor.config.uploadImgFileName = 'myFileName';
        editor.create();
    });
</script>

</body>
</html>
