package controller.academic.operation;

import java.io.IOException;
import java.util.List;

import dto.CourseDTO;
import dto.EnrollmentDTO2;
import dto.OperationOverviewDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CourseService;
import service.DepartmentService;
import service.EnrollmentService2;
import service.ProfessorService;
import util.ResultCode;

@WebServlet("/academic/operation/enrollment.do")
public class EnrollmentController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private EnrollmentService2 service = EnrollmentService2.INSTANCE;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String pg = req.getParameter("pg");
        int currentPage = (pg == null) ? 1 : Integer.parseInt(pg);
        int size = 10; // 페이지당 10개

        int total = service.getTotal();
        int lastPage = (total % size == 0) ? total / size : total / size + 1;

        List<EnrollmentDTO2> list = service.getEnrollments(currentPage, size);

        req.setAttribute("enrollments2", list);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPage", lastPage);

        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/academic/operation/enrollment.jsp");
        rd.forward(req, resp);
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
