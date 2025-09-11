package controller.university.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.UserService;

@WebServlet("/member/checkId.do")
public class CheckIdController extends HttpServlet {

    private final UserService userService = UserService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        String userId = req.getParameter("user_id");
        resp.setContentType("text/plain;charset=UTF-8");

        if (userId == null || userId.trim().isEmpty()) {
            resp.getWriter().print("아이디를 입력하세요.");
            return;
        }

        boolean exists = userService.existsById(userId);

        if (exists) {
            resp.getWriter().print("이미 사용 중인 아이디입니다.");
        } else {
            resp.getWriter().print("사용 가능한 아이디입니다.");
        }
    }
}