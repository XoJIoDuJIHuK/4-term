package Filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;

@WebFilter("/FilterToRegister")
public class FilterToRegister implements Filter {

    private FilterConfig config;
    private boolean active = false;
    private static ArrayList<String> pages;

    public void init(FilterConfig fConfig) {
        config = fConfig;
        String act = fConfig.getInitParameter("active");
        if (act != null)
            active = (act.equalsIgnoreCase("TRUE"));
        if (pages == null)
            pages = new ArrayList<>();
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (active) {
            HttpServletRequest req = (HttpServletRequest)request;
            // Раскладываем адрес на составляющие
            String[] list = req.getRequestURI().split("/");
            // Извлекаем наименование страницы
            String page = null;
            if (list[list.length - 1].indexOf(".jsp") > 0)
            {
                page = list[list.length - 1];
            }
            if ((page != null) && page.equalsIgnoreCase("main.jsp")) {
                if (pages.contains("login.jsp") || pages.contains("registration.jsp"))
                {
                    chain.doFilter(request, response);
                } else {
                    ServletContext ctx = config.getServletContext();
                    RequestDispatcher dispatcher = ctx.getRequestDispatcher("/registration.jsp");
                    dispatcher.forward(request, response);
                }
                return;
            } else if (page != null) {
                if (!pages.contains(page))
                    pages.add(page);
            }
        }
            chain.doFilter(request, response);
    }

    public void destroy() {
        config = null;
    }
}
