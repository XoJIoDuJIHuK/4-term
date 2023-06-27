package models;


import db.DBConnection;
import entities.users;
import exceptions.DBException;
import exceptions.ModelException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class Register {
    public static void RegisterMethod(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        users usercheck = null;
        if (login.isEmpty()  || password.isEmpty()) {
            req.setAttribute("result", "Поля не заполнены");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("register.jsp");
            requestDispatcher.forward(req, resp);
        } else {
            try {
                DBConnection dataBaseHandler = new DBConnection();
                usercheck = dataBaseHandler.GetByUsername(login);
                if (usercheck!=null ) {
                    req.setAttribute("result", "Пользователь с таким логином уже существует");
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("register.jsp");
                    requestDispatcher.forward(req, resp);
                }
                else {
                    users user = new users(login, password, "user");
                    dataBaseHandler.AddUser(user);
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("welcome.jsp");
                    requestDispatcher.forward(req, resp);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    }
}
