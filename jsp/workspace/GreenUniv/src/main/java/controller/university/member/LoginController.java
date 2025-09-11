package controller.university.member;

import java.io.IOException;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import service.StudentService;
import dto.StudentDTO;
import dao.UserDAO;
import dto.UserDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;
import util.ResultCode;


@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private UserService userService = UserService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/university/member/login.jsp").forward(req, resp);
	  }
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	    throws ServletException, IOException {
	    
		req.setCharacterEncoding("UTF-8");

	    String user_id = req.getParameter("user_id");
	    String pass = req.getParameter("pass");
	    String role = req.getParameter("role");

	    // 로그인 결과를 담을 Optional 객체
	    Optional<UserDTO> optUser = Optional.empty();
	    
	    // Service 인스턴스 가져오기
	    UserService userService = UserService.INSTANCE;
	    StudentService studentService = StudentService.INSTANCE;

	    // 선택된 role에 따라 다른 로그인 서비스 호출
	    if ("student".equals(role)) {
	        // '학부생' 선택 시
	        optUser = studentService.login(user_id, pass);
	    } else if ("staff".equals(role)) {
	        // '교직원' 선택 시 (추후 ProfessorService.login() 등으로 구현)
	        // optUser = professorService.login(user_id, pass);
	    } else {
	        // '일반인' 선택 시
	        optUser = userService.login(user_id, pass);
	    }
	    
	    if (optUser.isPresent()) {
	        UserDTO user = optUser.get();
	        
	        // 학부생인지 여부를 역할(role) 값으로 판단
	        boolean isStudent = "STUDENT".equals(user.getUser_role());

	        // 세션 발급
	        HttpSession session = req.getSession(true);
	        session.setAttribute("loginUser", user);
	        session.setAttribute("isStudent", isStudent);
	        
	        // 메인 페이지로 리다이렉트
	        resp.sendRedirect(req.getContextPath() + "/");
	      
	    } else {
	        // 로그인 실패 처리
	        resp.sendRedirect(req.getContextPath() + "/member/login.do?code=" + ResultCode.LOGIN_FAIL.getCode());
	    }
	}

	private boolean isBlank(String s) {
	    return s == null || s.trim().isEmpty();
	}
}
