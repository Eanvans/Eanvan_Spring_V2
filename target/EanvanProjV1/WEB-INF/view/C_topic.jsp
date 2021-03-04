<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/topic.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/base.js"></script>
</head>
<body>
<%@ include file="shareViews/C_header.jsp" %>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">添加话题分区</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="/addTopic" id="uploadTopic">
                <div class="modal-body">
                    <div class="text-center">
                        <div class="input-group mb-3">
                            <input type="text" name="name" class="form-control" placeholder="输入要添加的话题"
                                   aria-label="Username" aria-describedby="basic-addon1" id="input_addTopic_name">
                        </div>
                        <div class="input-group">
                            <textarea class="form-control" name="content" aria-label="With textarea"
                                      placeholder="对话题的一点点描述~" id="input_addTopic_content"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="btn_subTopic">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn_closeSubTopic">关闭
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="main w clearfix">
    <div class="main-left">
        <div class="share">

            <div class="share-left"><span class="glyphicon glyphicon-th-large"></span>&nbsp;话题广场</div>
            <div class="share-right">
                <a href="#" id="openAddTopic" data-toggle="modal" data-target="#exampleModal"><span
                        class="glyphicon glyphicon-pencil"></span>&nbsp;添加话题</a>
            </div>

        </div>
        <%--<div class="topic-root">
            <div class="topic-root-wrap">
                <c:forEach items="${topicList}" var="topic">
                    <a href="#">${topic.name}</a>
                </c:forEach>
            </div>
        </div>--%>
        <%--话题列表--%>
        <div class="topic-list">
            <div class="topic-list-wrap clearfix">
                <c:forEach items="${topicList}" var="topic" varStatus="status">
                    <c:choose>
                        <c:when test="${status.count%2!=0}">
                            <div class="topic-odd relative">
                                <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                   class="topic-image"><img src="${topic.image}"></a>
                                <div class="topic-content">
                                    <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                       class="topic-name">${topic.name}</a>
                                    <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                       class="topic-desc">${topic.content}</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="topic-even relative">
                                <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                   class="topic-image"><img src="${topic.image}"></a>
                                <div class="topic-content">
                                    <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                       class="topic-name">${topic.name}</a>
                                    <a href="/topicSection/${topic.tid}?section=${topic.name}&content=${topic.content}"
                                       class="topic-desc">${topic.content}</a>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
        </div>
        <%--更多的加载问题--%>
        <%--<div class="topic-more">
            <a href="#">更多</a>
        </div>--%>

    </div>
    <div class="main-right">

        <div class="hot-user">
            <div class="clearfix">
                <div class="hot-user-title"><span></span>&nbsp;推荐</div>
            </div>
        </div>
    </div>
</div>

<%--添加话题--%>

<%@ include file="shareViews/C_footer.jsp" %>

<%--
<script type="text/javascript">
    let btn_subTopic = $("#btn_subTopic");
    let btn_closetTopic = $("#btn_closeSubTopic");
    let topic_name = $("#input_addTopic_name");
    let topic_content = $("#input_addTopic_content")

    //封装form的数据为Json格式
    $.fn.serializeFormToJson = function () {
        //form表单数据 name value
        let arr = $(this).serializeArray();
        let param = {};
        //将form表单数据封装成json对象
        $.each(arr,function (i,obj) {
            param[obj.name] = obj.value;
        })
        return param;
    };

    btn_subTopic.click(function () {
        if ($("#input_addTopic").innerText !== "") {
            $.ajax(
                {
                    type: "POST",
                    url: "/addTopic",
                    contentType : 'application/json',
                    dataType: "json",
                    data: JSON.stringify($("#uploadTopic").serializeFormToJson()),
                    success: function (data) {
                        if (data == "ok") {
                           /* topic_name.val("");
                            topic_content.val("");*/

                        } else {
                            alert("话题添加失败.原因: " + data);
                        }
                    }
                }
            )
        }
    });
</script>
--%>
</body>
</html>













