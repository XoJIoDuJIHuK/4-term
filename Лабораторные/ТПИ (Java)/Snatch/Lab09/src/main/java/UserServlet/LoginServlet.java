package UserServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String password = String.valueOf(request.getParameter("password").hashCode());
        PrintWriter writer = response.getWriter();
        PrintWriter out = response.getWriter();
        try {
            DB users = new DB();
            if(users.checkUser(new User(login, password))) {
                response.addCookie(new Cookie(login, password));
                response.sendRedirect("registration.jsp");
                /*writer.println("<h1> hi, "+login+"<h1>");
                writer.println("<h1 style=\"text-align: center;\">Текущее время " + LocalTime.now() + "</h1>");*/
                writer.println("<h1> Добро пожаловать! <h1>");
            }
            else {
                response.sendRedirect("registration.jsp");
                writer.println("no such users");
            }
        } finally {
            writer.println();
            writer.close();
            out.close();
        }
    }
}
