$(function () {
    //下拉菜单处理
    let profile = $("#profile");
    let downMenu = $("#down-menu");

    profile.mouseover(function () {
        downMenu.show();
        $(this).css("background-color", "#333");
    }).mouseout(function () {
        downMenu.hide();
        $(this).css("background-color", "#3d444c");
    });

    downMenu.mouseover(function () {
        downMenu.show();
    }).mouseout(function () {
        downMenu.hide();
    });

    /*将footer栏固定在底部，根据网页窗口的可视大小变化*/
    function footerPosition() {
        let footer = $("footer");
        footer.removeClass("fixed-bottom");
        let contentHeight = document.body.scrollHeight,//网页正文全文高度
            winHeight = window.innerHeight;//可视窗口高度不包括浏览器顶部工具栏
        if (!(contentHeight > winHeight)) {
            footer.addClass("fixed-bottom")
        } else {
            footer.removeClass("fixed-bottom");
        }
    }
    footerPosition();
    $(window).resize(footerPosition);


    let regexImageFiler;
    let imgReaderl = new FileReader();
    regexImageFiler = /^(?:image\/bmp|image\/png|image\/jpeg|image\/jpg|\/gif)$/i;
    imgReaderl.onload = function(evt) {
        $("#MYimg").attr("src", evt.target.result).addClass("personalIcon");
    };

    $("#inputGroupFile").change(function() {
        let imgfFile = $("#inputGroupFile").prop("files")[0];
        if(!regexImageFiler.test(imgfFile.type)) {
            alert("选择有效图片");
        }
        imgReaderl.readAsDataURL(imgfFile);
        $("#inputLabel").hide();
    });
});
