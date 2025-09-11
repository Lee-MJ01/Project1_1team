package controller.university.student;

import java.io.IOException;
import java.util.List;

import dto.CourseDTO;
import dto.PagenationDTO;
import dto.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.EnrollmentService;

@WebServlet("/student/registration.do")
public class RegistrationController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private final EnrollmentService service = EnrollmentService.INSTANCE;

    // GET 요청: 개설 강좌 목록 페이지 보여주기
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        // --- 페이지네이션 로직  ---
    	String pg = req.getParameter("pg");
        
        // Service에 페이지네이션 처리를 요청하고 결과 DTO를 받음
        PagenationDTO pagenationDTO = service.getPagenationInfo(pg);
        
        // 계산된 limitStart 값으로 게시글 목록 조회
        List<CourseDTO> courseList = service.findAvailableCoursesByPage(pagenationDTO.getLimitStart());
        
        // JSP로 결과 전달
        req.setAttribute("courseList", courseList);
        req.setAttribute("pagenationDTO", pagenationDTO);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/student/registration.jsp");
        dispatcher.forward(req, resp);
    }
    
    // POST 요청: '신청' 버튼을 눌렀을 때 수강신청 처리
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/member/login.do");
            return;
        }

        String crsCdStr = req.getParameter("crs_cd");
        int crsCd = Integer.parseInt(crsCdStr);
        int stdId = Integer.parseInt(loginUser.getUser_id());
        
        service.enrollCourse(stdId, crsCd);
        
        // 처리 후 수강신청 페이지로 다시 이동하여 결과 확인
        resp.sendRedirect(req.getContextPath() + "/student/registration.do");
    }
}