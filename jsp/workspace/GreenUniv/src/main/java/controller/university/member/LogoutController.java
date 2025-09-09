package controller.university.member;

import java.io.IOException;

import util.ResultCode;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/university/member/logout.do")
public class LogoutController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		if (session != null) {
			session.removeAttribute("loginUser");
			session.invalidate();
		}
		
		resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		resp.setHeader("Pragma", "no-cache");
		resp.setDateHeader("Expires", 0);
		
		String cpath = req.getContextPath();
		resp.sendRedirect(cpath + "/university/member/login.do?code=" + ResultCode.LOGOUT_SUCCESS.getCode());
	}
}
