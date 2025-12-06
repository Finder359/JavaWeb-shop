package com.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter("/admin/*")  // 拦截所有 /admin/ 下的请求
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();

        // ✅ 1. 放行登录页面和登录请求
        if (uri.endsWith("login.jsp") || uri.contains("UserServlet")) {
            chain.doFilter(request, response);
            return;
        }

        // ✅ 2. 放行静态资源（CSS、JS、图片等）
        if (uri.endsWith(".css") || uri.endsWith(".js") ||
                uri.endsWith(".jpg") || uri.endsWith(".png") ||
                uri.endsWith(".gif") || uri.endsWith(".jpeg")) {
            chain.doFilter(request, response);
            return;
        }

        // ✅ 3. 放行验证码
        if (uri.contains("CaptchaServlet")) {
            chain.doFilter(request, response);
            return;
        }

        // ✅ 4. 检查是否登录
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            // 已登录，放行
            chain.doFilter(request, response);
        } else {
            // 未登录，通过URL参数传递错误信息
            resp.sendRedirect(req.getContextPath() + "/admin/login.jsp?msg=notlogin");

        }
    }

    @Override
    public void destroy() {
    }
}