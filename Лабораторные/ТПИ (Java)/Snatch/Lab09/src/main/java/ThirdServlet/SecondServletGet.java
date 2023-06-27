package ThirdServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;

@WebServlet(name = "SecondServletGet", urlPatterns = {"/SecondServletGet"})
public class SecondServletGet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h1 style=\"text-align: center;\">Текущее время " + LocalTime.now() + "</h1>");
    }
}
