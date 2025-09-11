package controller.academic.operation;

import java.io.IOException;
import java.util.List;

import dto.CourseDTO;
import dto.OperationOverviewDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CourseService;
import service.DepartmentService;
import service.ProfessorService;
import util.ResultCode;

@WebServlet("/academic/operation/overview.do")
public class OverviewController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private CourseService courseService = CourseService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int page = 1;
	    int pageSize = 10;

	    String pageParam = req.getParameter("page");
	    if (pageParam != null) {
	        page = Integer.parseInt(pageParam);
	    }

	    int offset = (page - 1) * pageSize;

	    List<OperationOverviewDTO> list = courseService.getOverview(offset, pageSize);
	    int total = courseService.countOverview();
	    int totalPages = (int) Math.ceil((double) total / pageSize);

	    req.setAttribute("overviewList", list);
	    req.setAttribute("currentPage", page);
	    req.setAttribute("totalPages", totalPages);

	    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/academic/operation/overview.jsp");
	    dispatcher.forward(req, resp);
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
	
}
