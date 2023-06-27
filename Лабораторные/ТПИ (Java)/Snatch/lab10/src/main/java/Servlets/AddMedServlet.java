package Servlets;


import DB.Med;
import DB.MedDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddMedServlet", value = "/AddMedServlet")
public class AddMedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String teacher = request.getParameter("adress");
        String faculty = request.getParameter("phone");
        Med subject = new Med(name, teacher, faculty);
        try {
            MedDAO medsDAO = new MedDAO();
            if(!medsDAO.Create(subject)){
                request.setAttribute("AddErrorMessage","Error while adding med center");
            }
            request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("ErrorCode", ex.fillInStackTrace());
            request.setAttribute("ErrorMessage", ex.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
