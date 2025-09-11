package controller.university.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/email/verifyCode.do")
public class EmailVerifyController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        
        // 사용자가 입력한 코드
        String inputCode = req.getParameter("code");
        // 세션에 저장된 발급 코드
        String sessionCode = (String) req.getSession().getAttribute("emailCode");

        resp.setContentType("text/plain;charset=UTF-8");

        if (sessionCode != null && sessionCode.equals(inputCode)) {
            resp.getWriter().print("인증 성공");
        } else {
            resp.getWriter().print("인증 실패");
        }
    }
}