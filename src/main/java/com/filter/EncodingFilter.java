package com.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class EncodingFilter implements Filter {

    private String encoding = "UTF-8";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        String paramEncoding = filterConfig.getInitParameter("encoding");
        if (paramEncoding != null) {
            encoding = paramEncoding;
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();

        // ✅ 排除静态资源，让Tomcat默认Servlet处理
        if (uri.endsWith(".css") || uri.endsWith(".js") ||
                uri.endsWith(".jpg") || uri.endsWith(".png") ||
                uri.endsWith(".gif") || uri.endsWith(".jpeg") ||
                uri.endsWith(".html") || uri.endsWith(".htm")) {

            // 静态资源直接放行，不设置编码
            chain.doFilter(request, response);
            return;
        }

        // ✅ 只对动态资源（JSP、Servlet）设置编码
        request.setCharacterEncoding(encoding);
        response.setCharacterEncoding(encoding);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}