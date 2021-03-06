<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wangEditor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/post.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
<%@ include file="shareViews/C_header.jsp" %>

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
                <div class="user-image"><a href="/profile/toProfile?uid=${post.user.uid}"><img
                        src="${post.user.headUrl}"></a></div>
                <div class="user-info">
                    <div class="user-name">${post.user.username}</div>
                    <div class="post-time">编辑于 ${post.publishTime}</div>
                </div>
                <div class="other-count">
                    <span class="reply-count"><a href="#">回复 ${post.replyCount}</a></span>&nbsp;
                    <c:choose>
                        <c:when test="${sessionScope.uid==null}">
                            <span class="up-count"><a>赞 ${post.likeCount}</a></span>&nbsp;
                        </c:when>
                        <c:when test="${liked==true}">
                            <span class="up-count"><a style="color:#2e6da4;">已赞 ${post.likeCount}</a></span>&nbsp;
                        </c:when>
                        <c:when test="${sessionScope.uid!=null}">
                            <span class="up-count"><a href="#" id="like-button">赞 ${post.likeCount}</a></span>&nbsp;
                        </c:when>
                    </c:choose>
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
                <a href="#reply-area">回复</a>
            </div>
            <!-- 回复区内容 -->
            <div class="post-reply-content">
                <!-- 回复条目 -->
                <c:forEach items="${replyList}" var="reply" varStatus="status">
                    <div class="post-reply-item clearfix">
                        <div class="item-info">
                            <div class="item-image">
                                <a href="/profile/toMyProfile?uid=${reply.user.uid}">
                                    <img src="${reply.user.headUrl}">
                                </a>
                            </div>
                            <div class="item-user-name"><a href="#">${reply.user.username}</a></div>
                            <div class="item-date">发表于 ${reply.replyTime}
                                <a href="#s${status.count}" class="item-more-reply">评论</a>&nbsp;
                            </div>
                            <div class="item-content">${reply.content}</div>

                            <!-- 楼中楼，即嵌套的回复内容 -->
                            <div class="item-more">
                                <c:forEach items="${reply.commentList}" var="comment">
                                    <%--一个wrap开始--%>
                                    <div class="item-wrap">
                                        <div class="item-more-1">
                                            <a href="/profile/toMyProfile?uid=${comment.user.uid}"
                                               class="item-more-user">${comment.user.username}</a>
                                            <span>：</span>
                                            <span class="item-more-content">${comment.content}</span>
                                        </div>

                                        <div class="item-more-date">${comment.commentTime}</div>
                                            <%--这里的回复用于用户@的功能，提供消息的回复，暂时不启用--%>
                                            <%--<div class="item-more-other">
                                                <a href="#s${status.count}" class="item-more-reply">回复</a>&nbsp;
                                            </div>--%>
                                    </div>
                                    <!-- 一个wrap结束-->
                                </c:forEach>

                                <!-- 楼中楼的回复框 -->
                                <div class="reply-input">
                                    <form action="/C_comment" method="post">
                                        <input type="hidden" name="reply.post.pid" value="${post.pid}"/>
                                        <input type="hidden" name="reply.rid" value="${reply.rid}"/>
                                        <div class="input-group">
                                            <textarea class="form-control" aria-label="With textarea"
                                                      name="content"></textarea>
                                        </div>
                                        <button type="submit">回复</button>
                                    </form>
                                </div>
                            </div><!-- 楼中楼结束 -->

                        </div>

                            <%-- <div class="item-other">
                                 <a href="#s${status.count}" class="item-reply">评论</a>&nbsp;
                             </div>--%>

                    </div>
                </c:forEach><!-- 回复条目结束 -->
            </div>
        </div>


        <!-- 回复区，付文本编辑器板块 -->
        <div id="reply-area" class="post-reply-textarea">
            <div style="width: 650px;margin: 10px 20px">
                <form action="/C_reply" method="post">
                    <input type="hidden" name="post.pid" value="${post.pid}"/>
                    <textarea name="content" id="textarea" style="height: 200px;max-height: 1000px;"></textarea>
                    <button type="submit" class="reply-button">回帖</button>
                </form>
            </div>
        </div>

    </div>


    <!-- 主体右部分 -->
    <div class="main-right">
        <div class="hot-user">
            <div class="clearfix">
                <div class="hot-user-title"><span></span>&nbsp;推荐</div>
            </div>

        </div>
    </div>
</div>


<%@ include file="shareViews/C_footer.jsp" %>

<script type="text/javascript">
    var editor = new wangEditor('textarea');

    editor.config.menus = [
        'source',
        '|',
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'fontsize',
        '|',
        'link',
        'table',
        'emotion',
        '|',
        'img',
        'insertcode',
        '|',
        'undo',
    ];

    //配置处理图片上传的路径，最好用相对路径
    editor.config.uploadImgUrl = 'upload.do';
    //配置图片上传到后台的参数名称
    editor.config.uploadImgFileName = 'myFileName';


    editor.create();

    //点赞按钮处理
    var likeButton = $("#like-button");
    likeButton.click(function () {
        $.ajax({
            type: "GET",
            url: "ajaxClickLike.do",
            data: {pid:${post.pid}},
            success: function (response, status, xhr) {
                likeButton.text("赞 " + response);
                likeButton.removeAttr("href");
            }
        });
    });

</script>
</body>
</html>
