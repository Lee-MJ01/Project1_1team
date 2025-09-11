package controller.academic.operation;

import java.io.IOException;
import java.util.List;

import dto.CourseDTO;
import dto.DepartmentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CourseService;
import service.DepartmentService;

@WebServlet("/academic/operation/lecture-list.do")
public class LectureListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private CourseService courseService = CourseService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	    // 페이지 파라미터 받기
	    int page = 1;
	    int pageSize = 10;
	    if (req.getParameter("page") != null) {
	        page = Integer.parseInt(req.getParameter("page"));
	    }
	    int offset = (page - 1) * pageSize;

	    // 데이터 가져오기
	    List<CourseDTO> courseDtoList = courseService.findPaged(offset, pageSize);
	    int totalCount = courseService.countAll();
	    int totalPages = (int) Math.ceil((double) totalCount / pageSize);

	    req.setAttribute("courseDtoList", courseDtoList);
	    req.setAttribute("currentPage", page);
	    req.setAttribute("totalPages", totalPages);

	    RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/academic/operation/lecture-list.jsp");
	    dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
