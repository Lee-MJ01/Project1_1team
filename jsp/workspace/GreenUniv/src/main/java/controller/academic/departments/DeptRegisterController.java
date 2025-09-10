package controller.academic.departments;

import java.io.IOException;

import dto.DepartmentDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.DepartmentService;
import util.ResultCode;


@WebServlet("/academic/departments/department-write.do")
public class DeptRegisterController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	private DepartmentService departmentService = DepartmentService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전송데이터 수신
		//dept_id는 원래 자동증분이었는데 단과대학번호 + max+1값으로 증가시킬예정
		int college_id = Integer.parseInt(req.getParameter("college_id"));
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
		switch (college_id) {
		    	case 100: college_name = "인문사회대학"; break;
		    	case 200: college_name = "자연과학대학"; break;
		    	case 300: college_name = "공과대학"; break;
		}
		dto.setCollege_name(college_name);
		dto.setDept_name(dept_name);
		dto.setDept_name_en(dept_name_en);
		dto.setEstablished(established);
		dto.setChair_name(chair_name);
		dto.setDept_phone(dept_phone);
		dto.setDept_office(dept_office);
		//추가필드 셋
		dto.setCollege_id(college_id);
	
		
		//등록 서비스 요청
		int result = departmentService.register(dto);
		
		//등록 후 확인메시지
        String ctx = req.getContextPath();
        if (result > 0) {
            resp.sendRedirect(ctx + "/academic/departments/department-list.do?code=" + ResultCode.WRITE_SUCCESS.getCode());
        } else {
            resp.sendRedirect(ctx + "/academic/departments/department-write.do?code=" + ResultCode.WRITE_FAIL.getCode());
        }
		
	}
	
	
}
