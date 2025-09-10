package controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dto.StudentDTO;
import service.StudentService;
import util.ResultCode;

@WebServlet("/student/write.do")
public class StudentRegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final StudentService service = StudentService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        RequestDispatcher rd =
            req.getRequestDispatcher("/WEB-INF/views/academic/personnel/student-register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        try {
            StudentDTO d = new StudentDTO();

            String entryYear = req.getParameter("entryyear");
            int deptId = Integer.parseInt(req.getParameter("dept_id"));
            int stdId = service.issueStdId(entryYear, deptId);
            d.setStd_id(stdId);

            d.setResident_number(req.getParameter("resident_number"));
            d.setName(req.getParameter("name"));
            d.setE_name(req.getParameter("e_name"));
            d.setGender(req.getParameter("gender"));
            d.setDivision(req.getParameter("division"));
            d.setPhone(req.getParameter("phone"));   // ← 추가
            d.setEmail(req.getParameter("email"));

            String zip   = req.getParameter("zip");
            String addr1 = req.getParameter("addr1");
            String addr2 = req.getParameter("addr2");
            String address = String.join(" ",
                java.util.Arrays.stream(new String[]{zip, addr1, addr2})
                    .filter(s -> s != null && !s.isBlank())
                    .toArray(String[]::new)
            );
            d.setAddress(address);

            d.setEntryyear(entryYear);
            d.setGraduationyear(req.getParameter("graduationyear"));
            d.setDept_id(deptId);
            d.setEntryterm(req.getParameter("entryterm"));
            d.setEntrygrade(req.getParameter("entrygrade"));
            d.setAdvisor(req.getParameter("advisor"));
            d.setStatus(req.getParameter("status"));

            int result = service.register(d);

            String ctx = req.getContextPath();
            if (result > 0) {
                resp.sendRedirect(ctx + "/student/write.do?code=" + ResultCode.WRITE_SUCCESS.getCode());
            } else {
                resp.sendRedirect(ctx + "/student/write.do?code=" + ResultCode.WRITE_FAIL.getCode());
            }
        } catch (Exception e) {
            e.printStackTrace();
            String ctx = req.getContextPath();
            resp.sendRedirect(ctx + "/student/write.do?code=" + ResultCode.WRITE_FAIL.getCode());
        }
    }
}
