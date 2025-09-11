package controller.university.student;

import java.io.IOException;
import java.util.List;

import dao.GradesSearchDAO;
import dto.GradesSearchDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/student/grades.do")
public class GradeSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<GradesSearchDTO> gradeList = GradesSearchDAO.getInstance().selectAll();
        request.setAttribute("gradeList", gradeList);

        request.getRequestDispatcher("/WEB-INF/views/university/student/grades.jsp").forward(request, response);
    }
}

