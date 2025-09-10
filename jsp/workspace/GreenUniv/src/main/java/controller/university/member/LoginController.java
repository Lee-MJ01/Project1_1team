package controller.university.member;

import java.io.IOException;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.UserDAO;
import dto.UserDTO;
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
	
	    String user_id 	= req.getParameter("user_id");
	    String pass		= req.getParameter("pass");
	    String next		= req.getParameter("next");
	    
	    // 기본 유효성
	    if (isBlank(user_id) || isBlank(pass)) {
	      req.setAttribute("error", "아이디와 비밀번호를 입력하세요.");
	      req.setAttribute("user_id", user_id);
	      req.getRequestDispatcher("/WEB-INF/views/university/member/login.jsp").forward(req, resp);
	      return;
	    }
	    
	    // 로그인
	    Optional<UserDTO> opt = UserDAO.getInstance().selectForLogin(user_id, pass);
	    
	    if (opt.isPresent()) {
	      UserDTO user = opt.get();
	      user.setPass(null); // 세션에서 비밀번호 제거
	      
	      // 세션 발급
	      HttpSession session = req.getSession(true);
	      session.setAttribute("loginUser", user);
	      session.setMaxInactiveInterval(60*30);
	      
	      // 리다이렉트 (next 페이지로 이동)
	      if (next != null && !next.isBlank()) {
	        resp.sendRedirect(next);
	        
	      } else {
	        resp.sendRedirect(req.getContextPath() + "/index.jsp");
	      }
	      
	    } else {
	    	
	    	// 실패 시, 폼 되돌리기
	    	req.setAttribute("error", "아이디 또는 비밀번호가 올바르지 않습니다.");
	    	req.setAttribute("user_id", user_id); // 아이디 유지
	    	resp.sendRedirect("/GreenUniv/member/login.do?code="+ResultCode.LOGIN_FAIL.getCode());
	    }
	  }
	
	private boolean isBlank(String s) {
		return s == null || s.trim().isEmpty();
	}
}
