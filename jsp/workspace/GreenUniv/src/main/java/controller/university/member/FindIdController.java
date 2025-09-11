package controller.university.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/member/findId.do")
public class FindIdController extends HttpServlet {
    
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String name = req.getParameter("user_name");
        String email = req.getParameter("email");
        String result = UserService.INSTANCE.findUserId(name, email).orElse("NOT_FOUND");
        resp.setContentType("text/plain;charset=UTF-8");
        resp.getWriter().print(result); // 마스킹된 아이디 또는 NOT_FOUND
    }
}