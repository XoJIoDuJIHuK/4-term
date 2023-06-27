package Servlets;

import DB.Med;
import DB.MedDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateMedServlet", value = "/UpdateMedServlet")
public class UpdateMedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String adress = request.getParameter("adress");
        String phone = request.getParameter("phone");
        Med med = new Med(name, adress, phone);
        try {
            MedDAO medsDAO = new MedDAO();
            if(!medsDAO.Update(id, med)){
                request.setAttribute("UpdateErrorMessage","Error while updating med center");
            }
            request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("ErrorCode", ex.fillInStackTrace());
            request.setAttribute("ErrorMessage", ex.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
