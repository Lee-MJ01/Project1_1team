package controller.university.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

@WebServlet("/member/email/sendCode.do")
public class EmailCodeController extends HttpServlet {
	
	private final UserService userService = UserService.INSTANCE;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		// 인증코드 발급
		String code = userService.sendEmailCode(email);

		// 세션에 저장 (나중에 검증에 사용)
		req.getSession().setAttribute("emailCode", code);

		resp.setContentType("text/plain;charset=UTF-8");
		if (code != null) {
			resp.getWriter().print(code);
		} else {
			resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			resp.getWriter().print("메일 발송 실패");
		}
	}
}