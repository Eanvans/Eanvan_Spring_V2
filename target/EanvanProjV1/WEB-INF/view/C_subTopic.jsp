<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>${sectionContent}</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/topic.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
<%@ include file="shareViews/C_header.jsp" %>

<div class="main w clearfix">
    <div class="main-left">
        <div class="share">
            <div class="share-left">
                <div class="share-left">
                    <nav aria-label="breadcrumb" class="float-left">
                        <ol class="breadcrumb" style="height: 50px;padding-top: 0;background-color: transparent;">
                            <c:forEach items="${navigateMap}" var="map" varStatus="s">
                                <c:if test="${s.count == navigateMap.size()}">
                                    <li class="breadcrumb-item "><a href="${map.value}">${map.key}</a></li>
                                </c:if>
                                <c:if test="${s.count != navigateMap.size()}">
                                    <li class="breadcrumb-item"><a style=" color: #008bff;" href="${map.value}">${map.key}</a></li>
                                </c:if>
                            </c:forEach>
                            <%--
                            <li class="breadcrumb-item"><a href="#">佛罗里达</a></li>
                            <li class="breadcrumb-item active" aria-current="page">生活</li>
                            --%>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>

        <div class="topic-list" style="border-bottom: 1px dashed #ddd;">
            <div class="topic-list-wrap clearfix">
                <c:choose>
                    <c:when test="${subTopic.equals('country')}">
                        <c:forEach items="${topicList}" var="topic" varStatus="status">
                            <c:choose>
                                <c:when test="${status.count%2!=0}">
                                    <div class="topic-odd relative">
                                        <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                           class="topic-image"><img src="${topic.imageUrl}"></a>
                                        <div class="topic-content">
                                            <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                               class="topic-name">${topic.name}</a>
                                            <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                               class="topic-desc">${topic.content}</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="topic-even relative">
                                        <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                           class="topic-image"><img src="${topic.imageUrl}"></a>
                                        <div class="topic-content">
                                            <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                               class="topic-name">${topic.name}</a>
                                            <a href="/topicSection/${topic.tid}/${topic.cityId}?topicName=${topicName}&section=${topic.name}&content=${topic.content}"
                                               class="topic-desc">${topic.content}</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:when>
                    <c:when test="${subTopic.equals('city')}">
                        <c:forEach items="${cityList}" var="c" varStatus="status">
                            <c:choose>
                                <c:when test="${status.count%2!=0}">
                                    <div class="topic-odd relative">
                                        <a href="/topicSection/${tid}/${c.cityId}/${c.name}?topicName=${topicName}&city=${cityName}"
                                           class="topic-image"><img src="${c.image}"></a>
                                        <div class="topic-content">
                                            <a href="/topicSection/${tid}/${c.cityId}/${c.name}?topicName=${topicName}&city=${cityName}"
                                               class="topic-name">${c.content}</a>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="topic-even relative">
                                        <a href="/topicSection/${tid}/${c.cityId}/${c.name}?city=${cityName}"
                                           class="topic-image"><img src="${c.image}"></a>
                                        <div class="topic-content">
                                            <a href="/topicSection/${tid}/${c.cityId}/${c.name}?city=${cityName}"
                                               class="topic-name">${c.content}</a>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:when>
                    <c:when test="${subTopic.equals('citySection')}">


                    </c:when>
                    <c:otherwise>
                        <%--404--%>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="post">
            <div class="post-wrap">
                <div class="post-choice">
                    <a href="#" class="post-choice-current">最近</a>
                    <a href="#">最热</a>
                    <a href="#" class="post-choice-last">精华</a>
                </div>

                <ul class="post-list">
                    <c:forEach items="${pageBean.list}" var="post">
                        <li class="clearfix">
                            <div class="post-image">
                                <a href="/profile/toProfile?uid=${post.user.uid}"><img src="${post.user.headUrl}"></a>
                            </div>
                            <div class="post-content">
                                <div class="post-title"><a href="/toPost?pid=${post.pid}">${post.title}</a></div>
                                <div class="post-other">
                                    <div class="post-other-left">
                                        <span class="post-username"><a
                                                href="/toPost?uid=${post.user.uid}">${post.user.username}</a></span>
                                        <span>&nbsp;发表</span>
                                        <span class="post-time">&nbsp;${post.publishTime}</span>
                                        <span>&nbsp;最后回复&nbsp;</span>
                                        <span class="post-reply-time">${post.replyTime}</span>
                                    </div>
                                    <div class="post-other-right">
                                        <span class="post-reply-count">回复 ${post.replyCount}</span>&nbsp;
                                        <span class="post-like-count">赞 ${post.likeCount}</span>&nbsp;
                                        <span class="post-scan-count">浏览 ${post.scanCount}</span>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>

                </ul>

                <%--分页导航--%>
                <nav class="col-md-10 col-md-offset-2">
                    <ul class="pagination pagination-sm">
                        <%--首页--%>
                        <li><a href="/listPostByTime?curPage=1">首页</a></li>
                        <%--上一页--%>
                        <c:choose>
                            <c:when test="${pageBean.curPage!=1 }">
                                <li><a href="/listPostByTime?curPage=${pageBean.curPage-1 }"><span>&laquo;</span></a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><span>&laquo;</span></li>
                            </c:otherwise>
                        </c:choose>
                        <%--中间部分--%>
                        <c:choose>
                            <c:when test="${pageBean.allPage<=10 }">
                                <c:forEach begin="1" end="${ pageBean.allPage}" var="i">
                                    <li class="pageNum"><a href="/listPostByTime?curPage=${i }">${i }</a></li>
                                </c:forEach>
                            </c:when>
                            <c:when test="${pageBean.curPage<=5 }">
                                <c:forEach begin="1" end="10" var="i">
                                    <li class="pageNum"><a href="/listPostByTime?curPage=${i }">${i }</a></li>
                                </c:forEach>
                            </c:when>
                            <c:when test="${pageBean.allPage-pageBean.curPage<5 }">
                                <c:forEach begin="${pageBean.allPage-9 }" end="${ pageBean.allPage}" var="i">
                                    <li class="pageNum"><a href="/listPostByTime?curPage=${i }">${i }</a></li>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach begin="${pageBean.curPage-4 }" end="${ pageBean.curPage+5}" var="i">
                                    <li class="pageNum"><a href="/listPostByTime?curPage=${i }">${i }</a></li>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        <%--下一页--%>
                        <c:choose>
                            <c:when test="${pageBean.curPage!=pageBean.allPage }">
                                <li><a href="/listPostByTime?curPage=${pageBean.curPage+1 }"><span>&raquo;</span></a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><span>&raquo;</span></li>
                            </c:otherwise>
                        </c:choose>
                        <%--尾页--%>
                        <li><a href="/listPostByTime?curPage=${pageBean.allPage}">尾页</a></li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>
    <div class="main-right">

        <div class="hot-user">
            <div class="clearfix">
                <div class="hot-user-title"><span></span>&nbsp;</div>
            </div>
            <%--  <ul class="hot-user-list">
                  <c:forEach items="${hotUserList}" var="user">
                      <li class="clearfix">
                          <a href="/profile/toProfile?uid=${user.uid}" class="hot-user-image"><img src="${user.headUrl}"></a>
                          <a href="/profile/toProfile?uid=${user.uid}" class="hot-user-name">${user.username}</a>
                      </li>
                  </c:forEach>
              </ul>--%>
        </div>

        <div class="hot-user">
            <div class="clearfix">
                <div class="hot-user-title"><span></span>&nbsp;</div>
            </div>
            <%--<ul class="hot-user-list">
                <c:forEach items="${userList}" var="user">
                    <li class="clearfix">
                        <a href="/profile/toProfile?uid=${user.uid}" class="hot-user-image"><img src="${user.headUrl}"></a>
                        <a href="/profile/toProfile?uid=${user.uid}" class="hot-user-name">${user.username}</a>
                    </li>
                </c:forEach>
            </ul>--%>
        </div>

    </div>
</div>

<%@ include file="shareViews/C_footer.jsp" %>

<script type="text/javascript">
    $(function () {
        var curPage = ${pageBean.curPage};
        $(".pageNum").each(function () {
            if ($(this).text() == curPage) {
                $(this).addClass("active");
            }
        });
    });

</script>
</body>
</html>
