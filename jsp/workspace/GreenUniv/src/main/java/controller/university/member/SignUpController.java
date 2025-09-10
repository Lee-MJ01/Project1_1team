package controller.university.member;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.ResultCode;
import dto.UserDTO;
import service.UserService;

@WebServlet("/member/signup.do")
public class SignUpController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService = UserService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/member/signup.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		// 전송 데이터 수신
		String user_id 	 = req.getParameter("user_id");
		String pass 	 = req.getParameter("pass");
		String user_name = req.getParameter("user_name");
		String hp 		 = req.getParameter("hp");
		String email 	 = req.getParameter("email");
		String addr1 	 = req.getParameter("addr1");
		String addr2 	 = req.getParameter("addr2");
		
		// DTO 생성 및 초기화
		UserDTO dto = new UserDTO();
		dto.setUser_id(user_id);
		dto.setPass(pass);
		dto.setUser_name(user_name);
		dto.setHp(hp);
		dto.setEmail(email);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);		
		dto.setUser_role("VISITOR"); // 기본값
		
		// 등록 서비스 요청
		userService.register(dto);
		
		// 이동
		resp.sendRedirect("/GreenUniv/member/login.do?code="+ResultCode.REGISTER_SUCCESS.getCode());
	
	}
}
