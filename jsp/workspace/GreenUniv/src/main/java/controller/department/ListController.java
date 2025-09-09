package controller.department;

import java.io.IOException;
import java.util.List;

import dto.DepartmentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DepartmentService;

@WebServlet("/academic/departments/department-list.do")
public class ListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private DepartmentService departmentService = DepartmentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전체 조회
		List<DepartmentDTO> dtoList = departmentService.findAll();
		
		//request 공유참조(jsp출력)
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/academic/departments/department-list.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
