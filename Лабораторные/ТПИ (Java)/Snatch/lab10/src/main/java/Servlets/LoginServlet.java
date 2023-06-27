package Servlets;

import Model.*;
import DB.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        try {
            UsersDAO usersDAO = new UsersDAO();
            UsersDAO.LoginResult result = usersDAO.Login(login, password);

            switch (result) {
                case UserNotFound:
                    request.setAttribute("ErrorMessage","No such user found");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                    break;
                case WrongPassword:
                    request.setAttribute("ErrorMessage","Wrong password!");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                    break;
                case Success:
                    User user = usersDAO.GetUser(login);

                    HttpSession session = request.getSession();
                    session.setAttribute("userType", user.getRole());

                    response.sendRedirect(request.getContextPath() + "/welcome.jsp");
                    break;
            }
        } catch (Exception exception) {
            request.setAttribute("ErrorCode", exception.fillInStackTrace());
            request.setAttribute("ErrorMessage", exception.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } finally {
            writer.close();
        }
    }
}
