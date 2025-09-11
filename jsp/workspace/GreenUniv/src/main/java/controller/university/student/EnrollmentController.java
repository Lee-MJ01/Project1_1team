package controller.university.student;

import java.io.IOException;
import java.util.List;

import dto.EnrolledCourseDTO;
import dto.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.EnrollmentService;

@WebServlet("/student/registered.do")
public class EnrollmentController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final EnrollmentService service = EnrollmentService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("loginUser");
        
        // 로그인 상태가 아니거나, 학생이 아니면 로그인 페이지로 리다이렉트
        if (loginUser == null || !"STUDENT".equals(loginUser.getUser_role())) {
            resp.sendRedirect(req.getContextPath() + "/member/login.do");
            return;
        }
        
        int stdId = Integer.parseInt(loginUser.getUser_id());
        
        // Service를 통해 현재 학기 수강신청 목록 조회
        List<EnrolledCourseDTO> enrolledCourses = service.findEnrolledCourses(stdId);
        
        // 조회된 목록을 request에 담아 JSP로 전달
        req.setAttribute("enrolledCourses", enrolledCourses);
        
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/student/registered.jsp");
        dispatcher.forward(req, resp);
    }
}