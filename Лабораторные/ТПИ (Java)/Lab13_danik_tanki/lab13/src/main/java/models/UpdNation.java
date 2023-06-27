package models;

import db.DBConnection;
import entities.nation;
import exceptions.ModelException;
import org.testng.mustache.Model;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class UpdNation {
    public static void UpdateNationMethod(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String number = req.getParameter("number");
        if (name.equals("") || number.equals("")) {
            req.setAttribute("error", "Заполните все поля");
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("controller?command=page");
            requestDispatcher.forward(req, resp);
        } else {
            DBConnection dataBaseHandler = new DBConnection();
            nation Nation = null;
            try {
                Nation = dataBaseHandler.GetByname(name);
            } catch (ModelException e) {
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
                    dataBaseHandler.Update(name, number);
                } catch (ModelException e) {
                    e.printStackTrace();
                }
            }
        }
        req.setAttribute("error", " Обновлено");
        req.getRequestDispatcher("controller?command=page").forward(req, resp);
    }
}

