package UserServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String password = String.valueOf(request.getParameter("password").hashCode());
        PrintWriter writer = response.getWriter();
        try {
            DB users = new DB();
            User user = new User(login, password);
            if (users.getUsersFromFile().contains(user)) {
                writer.println("account already exists");
            }
            else {
                users.addUser(user);
                writer.println("ok");
            }
        } catch(Exception ex) {
            writer.println(Arrays.toString(ex.getStackTrace()));
        }
    }
}