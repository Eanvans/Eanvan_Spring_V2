let userNameFlag = false;

//校验用户名
function checkUsername() {
    //定义长度为8-20位
    let username = $("#username").val();
    let infoArea = $("#register_info");
    /*进行Ajax登录校验*/
    //使用post的简便方式
    $.post("/checkUsername", {username: username}, function (data) {
        //处理服务器的响应数据data
        if (data === "ok") {
            $("#register_info").html("");
            userNameFlag = true;
        }else {
            userNameFlag = false;
            $("#register_info").html(data);
        }
    })
    //使用ajax的完整写法
    /*$.ajax({
        type:"POST",
        /!* contentType : 'application/x-www-form-urlencoded',*!/
        url:  '/checkUsername',
        dataType: "json",
        data: {username:username},
        success:function (data) {
            alert(data);
        }
    })*/
}

function checkPasssword() {
    //定义长度为8-20位
    let password = $("#password").val();
    let reg_password = /^\w{8,20}$/;
    let flag = reg_password.test(password);
    if (flag) {
        $("#register_info").html("");
        $("#password").css("border", "");
    } else {
        $("#register_info").html("密码长度要8-20位哦");
        $("#password").css("border", "1px solid red");
        return flag;
    }
    return flag;
}

function checkEamil() {
    let value = $("#inputEmail").val();
    let reg_Eamil = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
    let flag = reg_Eamil.test(value);
    if (!flag) {
        $(alert("邮箱格式错误~"));
        return flag;
    } else {

    }
    return flag;
}

function checkLoginForm(){
    let input_Password = $("#inputPassword");
    let md5_Password = $("#encodingPassword");
    let isRemember = $("#rememberMe");
    md5_Password.val(md5(input_Password.val()));
    return true;
}

function encodingRegisterForm(){
    $("#R_encoding_password").val(md5($("#password").val()));
    return true;
}



$(function () {
    /*进行Ajax登录校验*/
    //使用post的简便方式
    $("#registerForm").submit(function () {
        console.log(userNameFlag + "    " + checkPasssword());
        return userNameFlag && checkPasssword();
    })

    $("#username").blur(checkUsername);
    $("#password").blur(checkPasssword);
    //忘记密码的检查方式
});