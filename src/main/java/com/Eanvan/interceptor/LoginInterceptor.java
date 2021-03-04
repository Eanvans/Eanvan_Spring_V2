package com.Eanvan.interceptor;

import org.apache.log4j.Logger;
import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class LoginInterceptor implements HandlerInterceptor {

    //Log4j的使用说明
    private static Logger logger = Logger.getLogger(LoginInterceptor.class);

    public List<String> getExcludeUrls() {
        return excludeUrls;
    }

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    private List<String> excludeUrls;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /*为什么拦截器在某些页面会进行多次拦截*/
        //System.out.println("====>当前处理线程 : " + Thread.currentThread().getId());
        String requestUri = request.getRequestURI();
        System.out.println(requestUri);
        for (String s: excludeUrls) {
            if (requestUri.endsWith(s)){
                return true;
            }
        }
        String uid = (String) request.getSession().getAttribute("uid");
        if (uid == null){
            request.getRequestDispatcher("/toLogin").forward(request,response);
            return false;
        }else {
            return true;
        }
    }

    //该方法在action执行后，生成视图前执行。在这里，我们有机会修改视图层数据。
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    //最后执行，通常用于释放资源，处理异常。我们可以根据ex是否为空，来进行相关的异常处理。
    //因为我们在平时处理异常时，都是从底层向上抛出异常，最后到了spring框架从而到了这个方法中。
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
