<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" language="java"
         import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/wangEditor.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/profile.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editProfile.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<%@ include file="shareViews/C_header.jsp" %>

<c:choose>
    <c:when test="${profile.equals('profile')}">
        <!-- 中间主体板块 -->
        <div class="main w clearfix">
            <div class="m-left">
                <div class="user-image"><img src="${user.headUrl}"></div>
                <div class="user-info">
                    <div class="user-name">${user.username}</div>
                    <div class="user-desc">${user.description}</div>
                    <div class="user-position">坐标：${user.position}</div>
                    <div class="user-school">学校：${user.school}</div>
                    <div class="user-job">工作：${user.job}</div>
                </div>
                <div class="clearfix" style="border-bottom: 1px dashed #ddd;"></div>
                <div class="user-button">
                    <c:choose>
                        <c:when test="${following==true}">
                            <a href="unfollow.do?uid=${user.uid}" class="button-unfollow">取消关注</a>
                        </c:when>
                        <c:otherwise>
                            <a href="follow.do?uid=${user.uid}" class="button-follow">关注</a>
                        </c:otherwise>
                    </c:choose>

                </div>

                <div class="user-post">
                    <div class="user-post-title"><span></span>&nbsp;发帖</div>
                    <ul class="user-post-list">
                        <c:forEach items="${postList}" var="post">
                            <li>
                                <span class="glyphicon glyphicon-file"></span>&nbsp;
                                <a href="/toPost?pid=${post.pid}">${post.title}</a>
                                <span class="user-post-time">发布于 ${post.publishTime}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="m-right">
                <div class="user-follow">
                    <div class="user-follow">关注了<span class="user-count">${user.followCount}</span>人</div>
                    <div class="user-follower">关注者<span class="user-count">${user.followerCount}</span>人</div>
                </div>
                <div class="user-attr">
                    <span class="user-like-count">获赞：${user.likeCount}</span>
                    <span class="user-post-count">发帖：${user.postCount}</span>

                </div>
                <div class="user-scan-count">个人主页被浏览${user.scanCount}次</div>
            </div>

        </div>
        <!-- 主体结束 -->
    </c:when>
    <c:when test="${profile.equals('myProfile')}">

        <!-- 中间主体板块 -->
        <div class="main w clearfix">
            <div class="m-left">
                <div class="user-image"><img src="${user.headUrl}"></div>
                <div class="user-info">
                    <div class="user-name">${user.username}</div>
                    <div class="user-desc">${user.description}</div>
                    <div class="user-position">坐标：${user.position}</div>
                    <div class="user-school">学校：${user.school}</div>
                    <div class="user-job">工作：${user.job}</div>
                </div>
                <div class="clearfix" style="border-bottom: 1px dashed #ddd;"></div>
                <div class="user-button">
                    <a href="/profile/toEditProfile" class="button-follow">编辑信息</a>
                </div>

                <div class="user-post">
                    <div class="user-post-title"><span></span>&nbsp;发帖</div>
                    <ul class="user-post-list">
                        <c:forEach items="${postList}" var="post">
                            <li>
                                <span class="glyphicon glyphicon-file"></span>&nbsp;
                                <a href="/toPost?pid=${post.pid}">${post.title}</a>
                                <span class="user-post-time">发布于 ${post.publishTime}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="m-right">
                <div class="user-follow">
                    <div class="user-follow">关注了<span class="user-count">${user.followCount}</span>人</div>
                    <div class="user-follower">关注者<span class="user-count">${user.followerCount}</span>人</div>
                </div>
                <div class="user-attr">
                    <span class="user-like-count">获赞：${user.likeCount}</span>&nbsp;
                    <span class="user-post-count">发帖：${user.postCount}</span>

                </div>
                <div class="user-scan-count">个人主页被浏览${user.scanCount}次</div>
            </div>

        </div>
        <!-- 主体结束 -->
    </c:when>
    <c:when test="${profile.equals('editProfile')}">
        <!-- 中间主体板块 -->
        <div class="main w clearfix">
            <div class="edit-header"><span></span>&nbsp;编辑信息</div>
            <form action="/profile/editProfile" method="post">
                <div class="edit-title">
                    <input type="hidden" name="uid" value="${user.uid}">
                    用户名：<input type="text" name="username" value="${user.username}">
                </div>
                <div class="edit-title">
                    签&nbsp;&nbsp;&nbsp;名：<input type="text" name="description" value="${user.description}">
                </div>
                <div class="edit-title">
                    位&nbsp;&nbsp;&nbsp;置：<input type="text" name="position" value="${user.description}">
                </div>
                <div class="edit-title">
                    学&nbsp;&nbsp;&nbsp;校：<input type="text" name="school" value="${user.school}">
                </div>
                <div class="edit-title">
                    工&nbsp;&nbsp;&nbsp;作：<input type="text" name="job" value="${user.job}">
                </div>
                <div class="relative">
                    <button class="edit-submit">确认编辑</button>
                </div>
            </form>

            <div style="margin-top: 60px;"></div>
            <div class="edit-header"><span></span>&nbsp;修改密码</div>
            <form action="/profile/updatePassword" method="post">
                <div class="edit-title">
                    <div class="text-danger">${passwordError}</div>
                    原密码：<input type="password" name="password">
                </div>
                <div class="edit-title">
                    新密码：<input type="password" name="newPassword">
                </div>
                <div class="edit-title">
                    确&nbsp;&nbsp;&nbsp;认：<input type="password" name="rePassword">
                </div>
                <div class="relative">
                    <button class="edit-submit">确认修改</button>
                </div>
            </form>

            <div style="margin-top: 60px;"></div>
            <div class="edit-header"><span></span>&nbsp;更换头像</div>
            <form action="updateHeadUrl.do" method="post" enctype="multipart/form-data">
                <div class="edit-title">
                    <span class="text-danger"><%--${error3}--%></span>
                    <input type="file" name="myFileName">
                </div>
                <div class="relative">
                    <button class="edit-submit">确认更新</button>
                </div>
            </form>
        </div>
        <!-- 主体结束 -->
    </c:when>
</c:choose>

<%@ include file="shareViews/C_footer.jsp" %>

</body>
</html>













