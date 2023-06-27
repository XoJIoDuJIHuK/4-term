package models;

import db.DBConnection;
import entities.nation;
import exceptions.ModelException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DelNation {
    public static void DelNationMethod(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");
        DBConnection dataBaseContext = new DBConnection();
        String name = req.getParameter("namedelet");
        if (name.equals("")) {
            req.setAttribute("error", "Заполните поле");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("controller?command=page");
            requestDispatcher.forward(req, resp);
            return;
        } else {
            nation Nation = null;
            try {
                Nation = dataBaseContext.GetByname(name);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (Nation == null)
            {
                req.setAttribute("error", " Такого народа не существует");
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("controller?command=page");
                requestDispatcher.forward(req, resp);
            }
            else{
                try {
                    req.setAttribute("error", "Нация " + name + " удалена");
                    dataBaseContext.Remove(name);
                    RequestDispatcher requestDispatcher = req.getRequestDispatcher("controller?command=page");
                    requestDispatcher.forward(req, resp);
                } catch (ModelException e) {
                    e.printStackTrace();
                }
            }
        }
            req.setAttribute("error", "Нация " + name + " удалена");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("controller?command=page");
            requestDispatcher.forward(req, resp);
        }
    }
