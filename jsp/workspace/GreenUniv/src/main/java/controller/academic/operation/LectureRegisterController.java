package controller.academic.operation;

import java.io.IOException;

import dto.CourseDTO;
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

@WebServlet("/academic/operation/lecture-register.do")
public class LectureRegisterController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private CourseService courseService = CourseService.INSTANCE;
	private DepartmentService departmentService = DepartmentService.INSTANCE;
	private ProfessorService professorService = ProfessorService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/academic/operation/lecture-register.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. 파라미터 수집
        String collegeName = req.getParameter("college");
        String deptName = req.getParameter("department");

        int dept_id = departmentService.findDeptId(collegeName, deptName);
        //int dept_id        = Integer.parseInt(req.getParameter("dept_id"));
        String period_start     = req.getParameter("period_start");
        // year의 뒤 두 자리 추출
        int year = 0;

        if (period_start != null && period_start.length() >= 4) {
            year = Integer.parseInt(period_start.substring(2, 4)); // "2025" → 2025
        }

        int semester       = Integer.parseInt(req.getParameter("semester"));
        String division    = req.getParameter("division");
        String crs_name    = req.getParameter("crs_name");
        String profName = req.getParameter("prof_name");
        int p_code         = professorService.findCodeByName(profName);
        int credit         = Integer.parseInt(req.getParameter("credit"));
        String crs_desc    = req.getParameter("crs_desc");
        //String period_start= req.getParameter("period_start");
        String period_end  = req.getParameter("period_end");
        String time_start  = req.getParameter("time_start");
        String time_end    = req.getParameter("time_end");
        String days        = req.getParameter("days");
        String eval_method = req.getParameter("eval_method");
        String textbook    = req.getParameter("textbook");
        String crs_room    = req.getParameter("crs_room");
        int capacity       = Integer.parseInt(req.getParameter("capacity"));

        //순번 조회
        int seq = courseService.getNextNum(dept_id, year, semester);
        
        String crsCdStr = String.format("%d%s%d%d", dept_id, year, semester, seq);
        int crs_cd = Integer.parseInt(crsCdStr);
        //추가 파라미터



        // 2. DTO 생성
        CourseDTO dto = new CourseDTO();
        dto.setCrs_cd(crs_cd);
        dto.setDept_id(dept_id);
        dto.setYear(year);
        dto.setSemester(semester);
        dto.setDivision(division);
        dto.setCrs_name(crs_name);
        dto.setP_code(p_code);
        dto.setCredit(credit);
        dto.setCrs_desc(crs_desc);
        dto.setPeriod_start(period_start);
        dto.setPeriod_end(period_end);
        dto.setTime_start(time_start);
        dto.setTime_end(time_end);
        dto.setDays(days);
        dto.setEval_method(eval_method);
        dto.setTextbook(textbook);
        dto.setCrs_room(crs_room);
        dto.setCapacity(capacity);

        // 3. DB 저장 (Service → DAO)
        int result = courseService.register(dto);

        // 4. 결과 리다이렉트
        String ctx = req.getContextPath();
        if (result > 0) {
            resp.sendRedirect(ctx + "/academic/operation/lecture-list.do?code=" + ResultCode.WRITE_SUCCESS.getCode());
        } else {
            resp.sendRedirect(ctx + "/academic/operation/lecture-register.do?code=" + ResultCode.WRITE_FAIL.getCode());
        }
	}
	
}
