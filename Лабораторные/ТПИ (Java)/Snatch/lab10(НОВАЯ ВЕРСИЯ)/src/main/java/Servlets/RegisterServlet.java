package Servlets;

import Model.*;
import DB.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String login = request.getParameter("login");
        String password = request.getParameter("password");
        PrintWriter writer = response.getWriter();
        try {
            if(login.length() < 2 || password.length() < 2)
            {
                request.setAttribute("ErrorMessage","Wrong login or password!");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }

            UsersDAO usersDAO = new UsersDAO();

            if(usersDAO.GetUser(login) != null) {
                request.setAttribute("ErrorMessage","User with such login already exists");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
            else {
                User user = new User();
                user.setLogin(login);
                user.setPassword(password);
                user.setRole(Math.random() * 10 < 8 ? UserType.User : UserType.Admin);

                usersDAO.Register(login ,password, user.getRole());

                HttpSession session = request.getSession();
                session.setAttribute("userType", user.getRole());

                response.sendRedirect(request.getContextPath() + "/welcome.jsp");
            }
        } catch(Exception exception) {
            request.setAttribute("ErrorCode", exception.fillInStackTrace());
            request.setAttribute("ErrorMessage", exception.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
