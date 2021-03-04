package com.Eanvan.controller;

import com.Eanvan.model.User;
import com.Eanvan.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

/**
 * toLogin
 * toRegister
 * register
 * login
 * logout
 * checkUsername
 */
@Controller
@RequestMapping("/")
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private JavaMailSender javaMailSender;

    /*跳转到登录页面*/
    @RequestMapping("toLogin")
    public String toLogin(Model model){
        model.addAttribute("login","login");
        return "login";
    }

    @RequestMapping("toRegister")
    public String toRegister(Model model){

        return "login";
    }

    /*注册功能*/
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(User user, String password, Model model) {
        String result = loginService.register(user, password);
        if (result.equals("ok")) {
            model.addAttribute("info", "注册成功！系统理应给你发一封邮件的！，但是呢，现在还在测试，所以暂时先跳过啦~");
            return "resView/loginInfo";
        } else {
            model.addAttribute("register", "yes");
            model.addAttribute("R_username", user.getUsername());
            model.addAttribute("R_error", result);
            return "login";
        }
    }

    /*登录功能*/
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user,String remember,  Model model, HttpSession session,HttpServletResponse response) {
        Map<String, Object> map = loginService.login(user);
        if (map.get("result").equals("Y")) {
            session.setAttribute("uid", map.get("uid"));
            session.setAttribute("headUrl",map.get("headUrl"));
            session.setAttribute("username",user.getUsername());

            if (map.get("root").equals("0")){
                session.setAttribute("root","admin");
            }

            /*当记住我的选项不为空的时候，添加记住当前用户cookie*/
            if (remember != null){
                Cookie cookie1 = new Cookie("eavanusn",user.getUsername());
                cookie1.setPath("/");//设置作用域
                cookie1.setMaxAge(60 * 60 * 24 * 15);
                Cookie cookie2 = new Cookie("eavanpwd",user.getPassword());
                cookie2.setPath("/");//设置作用域
                cookie2.setMaxAge(60 * 60 * 24 * 15);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }

            //session.setAttribute("nickName", map.get("nickName"));
            //跳转到我的主页页面
            return "redirect:eanvan";
        } else {
            model.addAttribute("username", user.getUsername());
            model.addAttribute("error", map.get("error"));
            model.addAttribute("login","login"); //当前仅仅临时用于判断是否是登录页面
            return "login";
        }
    }

    /*注销功能*/
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
        session.removeAttribute("uid");
        Cookie[] cookies = request.getCookies();
        if (null != cookies){
            for(Cookie cookie : cookies){
                if (cookie.getName().equals("eavanusn")){
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }else if (cookie.getName().equals("eavanpwd")){
                    cookie.setValue(null);
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                }
            }
        }
        return "redirect:eanvan";
    }

    /*ajax用于检查用户名是否可用*/
    @RequestMapping(value = "checkUsername",method = RequestMethod.POST,produces = {"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String usernameCheck(String username){
        boolean isExist = loginService.validateUsername(username);
        /*将对象序列化为Json
        * ObjectMapper om = new ObjectMapper();
        * 使用普通的reponse方法进行返回值的写出
        * String json = om.writeValueAsString(对象名);*/
       /* response.setContentType("text/html;charset=utf-8");
        response.getOutputStream().write(().getBytes("utf-8"));*/
        //使用SpringMVC的方式进行返回值的写出
        return isExist? "用户名已存在~":"ok";
    }

}
