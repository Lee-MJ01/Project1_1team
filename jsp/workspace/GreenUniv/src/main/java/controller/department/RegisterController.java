package controller.department;

import java.io.IOException;

import dto.DepartmentDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DepartmentService;


@WebServlet("/academic/department/register.do")
public class RegisterController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private DepartmentService departmentService = DepartmentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전송데이터 수신
		// int dept_id = Integer.parseInt(req.getParameter("dept_id")); 자동증분이라 필요 x
		String college_name = req.getParameter("college_name");
		String dept_name= req.getParameter("dept_name");
		String dept_name_en= req.getParameter("dept_name_en");
		String established= req.getParameter("established");
		String chair_name= req.getParameter("chair_name");
		String dept_phone= req.getParameter("dept_phone");
		String dept_office= req.getParameter("dept_office");
		
		//DTO 생성 및 초기화
		DepartmentDTO dto = new DepartmentDTO();
		//dto.setDept_id(dept_id); 자동증분이라 필요 x
		dto.setCollege_name(college_name);
		dto.setDept_name(dept_name);
		dto.setDept_name_en(dept_name_en);
		dto.setEstablished(established);
		dto.setChair_name(chair_name);
		dto.setDept_phone(dept_phone);
		dto.setDept_office(dept_office);
		
		//등록 서비스 요청
		departmentService.register(dto);
		
		//이동
		//resp.sendRedirect("/");
		
	}
	
	
}
