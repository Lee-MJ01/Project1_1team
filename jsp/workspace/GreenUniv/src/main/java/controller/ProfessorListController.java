package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;

import dto.ProfessorDTO;
import service.ProfessorService;
import util.PageResult;

@WebServlet("/professor/list.do")
public class ProfessorListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String cond = req.getParameter("cond"); // prof_id|name|phone|email|dept|degree
        String kw   = req.getParameter("kw");
        int page = toInt(req.getParameter("page"), 1);
        int size = toInt(req.getParameter("size"), 10);

        PageResult<ProfessorDTO> pr =
            ProfessorService.INSTANCE.findPage(cond, kw, page, size);

        req.setAttribute("pr", pr);
        req.setAttribute("cond", cond);
        req.setAttribute("kw", kw == null ? "" : kw);
        req.setAttribute("size", size);

        req.getRequestDispatcher("/WEB-INF/views/academic/personnel/professors.jsp")
           .forward(req, resp);
    }
    private int toInt(String s, int def){ try{ return Integer.parseInt(s);}catch(Exception e){ return def; } }
}
