package Filters;

import Model.*;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "RedirectFilter", urlPatterns = { "/welcome.jsp"},
        initParams = {@WebInitParam(name = "LOGIN_PATH", value = "/login.jsp")})
public class RedirectFilter implements Filter {
    private String indexPath;

    public void init(FilterConfig config) throws ServletException {
        indexPath = config.getInitParameter("LOGIN_PATH");
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();
        UserType type = (UserType) session.getAttribute("userType");
        if(type == null) {
            type = UserType.Guest;
            session.setAttribute("userType", type);
        }
        if(type == UserType.Guest) {
            RequestDispatcher requestDispatcher = request.getServletContext().getRequestDispatcher(indexPath);
            requestDispatcher.forward(httpServletRequest, httpServletResponse);
            return;
        };
        chain.doFilter(request, response);
    }
}
