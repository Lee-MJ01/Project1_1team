package controller.university.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/member/findPw.do")
public class FindPwController extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String userId = req.getParameter("user_id");
        String email  = req.getParameter("email");
        String code   = req.getParameter("code");
        String sessionCode = (String) req.getSession().getAttribute("emailCode");

        resp.setContentType("text/plain;charset=UTF-8");
        if (sessionCode == null || !sessionCode.equals(code)) {
            resp.getWriter().print("INVALID_CODE");
            return;
        }
        boolean ok = UserService.INSTANCE.resetPassword(userId, email);
        resp.getWriter().print(ok ? "RESET_OK" : "RESET_FAIL");
    }
}