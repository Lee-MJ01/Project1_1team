package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;

import dto.ProfessorDTO;
import service.DepartmentService;
import service.ProfessorService;

@WebServlet("/professor/write.do")
public class ProfessorRegisterController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    req.setAttribute("deptList", DepartmentService.INSTANCE.findAll());

	    req.getRequestDispatcher("/WEB-INF/views/academic/personnel/professor-register.jsp")
	       .forward(req, resp);
	}


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String ctx = req.getContextPath();

        try{
            ProfessorDTO d = new ProfessorDTO();

            d.setResident_number(req.getParameter("resident_number"));
            d.setName(req.getParameter("name"));
            d.setE_name(req.getParameter("e_name"));
            d.setGender(req.getParameter("gender"));
            d.setDivision(req.getParameter("division")); // nation
            d.setPhone(req.getParameter("phone"));
            d.setEmail(req.getParameter("email"));
            d.setZip(req.getParameter("zip"));
            d.setAddr1(req.getParameter("addr1"));
            d.setAddr2(req.getParameter("addr2"));
            d.setGraduated_univ(req.getParameter("graduated_univ"));
            d.setGraduation_date(req.getParameter("graduation_date")); 
            d.setMajor_field(req.getParameter("major_field"));         
            d.setDegree(req.getParameter("degree"));

            int deptId = Integer.parseInt(req.getParameter("dept_id"));
            d.setDept_id(deptId);

            String hireDate = req.getParameter("hire_date");           
            d.setHire_date(hireDate);

            d.setStatus("재직중");

            int year = (hireDate != null && hireDate.length() >= 4)
                        ? Integer.parseInt(hireDate.substring(0, 4))
                        : java.time.LocalDate.now().getYear();

            int pcode = ProfessorService.INSTANCE.generateProfessorCode(year, deptId);
            d.setProf_id(pcode);

            int result = ProfessorService.INSTANCE.register(d);

            if(result > 0){
                resp.sendRedirect(ctx + "/professor/list.do?code=201");
            }else{
                resp.sendRedirect(ctx + "/professor/write.do?code=501");
            }
        }catch(Exception e){
            e.printStackTrace();
            resp.sendRedirect(ctx + "/professor/write.do?code=501");
        }
    }
    
}
