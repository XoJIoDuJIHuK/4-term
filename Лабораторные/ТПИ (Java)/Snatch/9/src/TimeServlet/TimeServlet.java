package TimeServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.util.Enumeration;

@WebServlet(name = "TimeServlet", urlPatterns = {"/TimeServlet"})
public class TimeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try {
            writer.println("<html>");
            writer.println("<head>");
            writer.println("<title>FirstServlet</title>");
            writer.println("</head>");
            writer.println("<body>");
            writer.println("<h1 style=\"text-align: center;\">Текущее время " + LocalTime.now() + "</h1>");
            writer.println("<p>Версия и номер протокола " + "<b>" + request.getProtocol() + "</b>" + "</p>");
            writer.println("<p>IP-адреса клиента, от имени которого пришел запрос и его имя" + "<b>" + request.getRemoteAddr() + "  " + request.getRemoteUser() + "</b>" + "</p>");
            writer.println("<p>Имя метода доступа к ресурсам, на основе которого построен запрос " + "<b>" + request.getMethod() + "</b>" + "</p>");
            writer.println("<p>URL-адрес, который клиент использовал для выполнения запроса " + "<b>" + request.getRequestURL() + "</b>" + "</p>");
            writer.println("<p>Информация о заголовках");
            Enumeration<String> headerNames = request.getHeaderNames();
            while(headerNames.hasMoreElements()){
                String name = headerNames.nextElement();
                String headerValues = request.getHeader(name);
                writer.println(name + ":  " + headerValues);
            }
            writer.println("</p>");
            writer.println("</body>");
            writer.println("</html>");
        } finally {
            writer.close();
        }
    }
}

