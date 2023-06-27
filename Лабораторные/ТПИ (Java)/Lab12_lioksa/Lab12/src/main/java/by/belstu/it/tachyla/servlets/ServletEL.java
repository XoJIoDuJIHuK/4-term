package by.belstu.it.tachyla.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jetbrains.annotations.NotNull;

import java.io.IOException;

@WebServlet(name = "ServletEL", urlPatterns = "/servlet-el")
public class ServletEL extends HttpServlet {
    @Override
    protected void doGet(@NotNull HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int[] nums = { 1, 2, 3, 4 };
        req.setAttribute("nums", nums);
        req.getRequestDispatcher("core.jsp").forward(req, resp);
    }
}
