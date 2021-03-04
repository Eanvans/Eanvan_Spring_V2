$(function () {
    /*定义变量*/
    let topicContent = $("#topicContentArea");
    let deviceContent = $("#deviceContentArea");
    let statusContent = $("#statusContentArea");
    let topicTab = $("#topicTab");
    let deviceTab = $("#deviceTab");
    let statusTab = $("#statusTab");

    /*定义函数*/
    /*设定每一个开关的状态*/
    let fn_setSwitch = function(){
        let switchs =  $('[name="switch"]');
        for (let i = 0; i < switchs.length; i++) {
            switchs.eq(i).bootstrapSwitch({
                state:switchs.eq(i).attr("value") == "true" ? true : false,
                onText: "开启",
                offText: "关闭",
                onColor: "success",
                offColor: "danger",
                size: "small",
                onSwitchChange: function (event, state) {
                    if(state==true){
                        console.log('已打开');
                    }else{
                        console.log('已关闭');
                    }
                }
            });
    }};

    /*刚加载完后*/
    topicContent.show();
    deviceContent.hide();
    statusContent.hide()

    fn_setSwitch();

    //用于左侧边栏的不同页面的切换
    //我的主题
    topicTab.click(function () {
        topicContent.show();
        deviceContent.hide();
        statusContent.hide();
        topicTab.addClass("active");
        deviceTab.removeClass("active");
        statusTab.removeClass("active");
    });
    //我的设备
    deviceTab.click(function () {
        topicContent.hide();
        deviceContent.show();
        statusContent.hide();
        topicTab.removeClass("active");
        deviceTab.addClass("active");
        statusTab.removeClass("active");
    });
    //设备运行记录
    statusTab.click(function () {
        topicContent.hide();
        deviceContent.hide();
        statusContent.show();
        topicTab.removeClass("active");
        deviceTab.removeClass("active");
        statusTab.addClass("active");
    });

    //弹出模态框
    $('#exampleModal').on('show.bs.modal', function (event) {
        // Button that triggered the modal
        let button = $(event.relatedTarget)
        // Extract info from data-* attributes
        let recipient = button.data('whatever')
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        /*let modal = $(this)
        modal.find('.modal-title').text('New message to ' + recipient)
        modal.find('.modal-body input').val(recipient)*/
    })

    //AJAX添加新的Topic之后进行表格的更新
    let loadTopics = function(){
        $.ajax(
            {
                type:"POST",
                uri:"/refreshTopic.do",
                dataType:"jsonp",
                data:JSON.stringify($("#at_form").serializeFormToJson()),
                success:function () {
                    alert("success!");
                }
            }
        );
    };

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
    $("#test").click(function () {
        loadTopics();
    });
});
