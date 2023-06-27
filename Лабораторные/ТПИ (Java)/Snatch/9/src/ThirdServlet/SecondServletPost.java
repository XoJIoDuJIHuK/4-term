package ThirdServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;

@WebServlet(name = "SecondServletPost", urlPatterns = {"/SecondServletPost"})
public class SecondServletPost extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getAttribute("Name").toString();
        out.println("<h4 style=\"text-align: center;\">Текущее время " + LocalTime.now() + "</h4>");
        out.println("<h1 style=\"text-align: center;\">"+name+"</h1>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    {

    }
}
