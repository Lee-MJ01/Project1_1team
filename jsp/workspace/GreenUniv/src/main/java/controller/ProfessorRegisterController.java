package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;

import dto.ProfessorDTO;
import service.ProfessorService;
import util.ResultCode;

@WebServlet("/professor/write.do")
public class ProfessorRegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/academic/personnel/professor-register.jsp")
           .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try{
            ProfessorDTO d = new ProfessorDTO();
            d.setProf_id(Integer.parseInt(req.getParameter("prof_id")));   // 자동생성 안하면 수동 입력
            d.setResident_number(req.getParameter("resident_number"));
            d.setName(req.getParameter("name"));
            d.setE_name(req.getParameter("e_name"));
            d.setGender(req.getParameter("gender"));
            d.setDivision(req.getParameter("division"));
            d.setPhone(req.getParameter("phone"));
            d.setEmail(req.getParameter("email"));
            d.setZip(req.getParameter("zip"));
            d.setAddr1(req.getParameter("addr1"));
            d.setAddr2(req.getParameter("addr2"));
            d.setGraduated_univ(req.getParameter("graduated_univ"));
            d.setGraduation_date(req.getParameter("graduation_date"));
            d.setMajor_field(req.getParameter("major_field"));
            d.setDegree(req.getParameter("degree"));
            d.setDept_id(Integer.parseInt(req.getParameter("dept_id")));
            d.setHire_date(req.getParameter("hire_date"));

            int result = ProfessorService.INSTANCE.register(d);
            String ctx = req.getContextPath();
            if(result > 0){
                resp.sendRedirect(ctx + "/professor/write.do?code=" + ResultCode.WRITE_SUCCESS.getCode());
            }else{
                resp.sendRedirect(ctx + "/professor/write.do?code=" + ResultCode.WRITE_FAIL.getCode());
            }
        }catch(Exception e){
            e.printStackTrace();
            String ctx = req.getContextPath();
            resp.sendRedirect(ctx + "/professor/write.do?code=" + ResultCode.WRITE_FAIL.getCode());
        }
    }
}
