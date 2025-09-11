package controller;

import service.OperationService;
import dto.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@WebServlet("/academic/index.do")
public class AcademicIndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int year = Optional.ofNullable(req.getParameter("year"))
                           .map(Integer::parseInt)
                           .orElse(LocalDate.now().getYear());
        String semester = Optional.ofNullable(req.getParameter("semester")).orElse("1");
        String term = semester; 

        OperationService svc = OperationService.INSTANCE;

        req.setAttribute("uni",     svc.getStats(year, semester));
        req.setAttribute("eduList", svc.getCourses(year, semester));
        req.setAttribute("byGrade", svc.getByGrade(year, term));
        req.setAttribute("byDept",  svc.getByDept());
        req.setAttribute("notices", svc.getNotices());
        req.setAttribute("qna",     svc.getQna());

        // ★ 여기로 변경
        req.getRequestDispatcher("/WEB-INF/views/academic/index.jsp")
           .forward(req, resp);
    }
}
