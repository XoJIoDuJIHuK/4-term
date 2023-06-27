package Servlets;

import DB.Med;
import DB.MedDAO;
import Model.*;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "MedServlet", value = "/MedServlet")
public class MedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            MedDAO subjectsDAO = new MedDAO();
            ArrayList<Med> med = subjectsDAO.GetAll();
            request.setAttribute("meds", med);
        } catch (Exception exception) {
            exception.printStackTrace();
        }

        getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}