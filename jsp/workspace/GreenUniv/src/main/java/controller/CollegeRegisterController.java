package controller;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dto.CollegeDTO;
import service.CollegeService;
import util.ResultCode;

@MultipartConfig
@WebServlet("/college/write.do")
public class CollegeRegisterController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final CollegeService service = CollegeService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/academic/departments/department-register.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String college_name    = req.getParameter("college_name");
        String college_name_en = req.getParameter("college_name_en");
        String intro_title     = req.getParameter("intro_title");
        String intro_body      = req.getParameter("intro_body");

        // 파일 업로드 처리
        Part filePart = req.getPart("image_path");
        String fileName = filePart.getSubmittedFileName();

        String uploadPath = req.getServletContext().getRealPath("/upload");
        File dir = new File(uploadPath);
        if (!dir.exists()) dir.mkdirs();
        filePart.write(uploadPath + "/" + fileName);

        CollegeDTO dto = new CollegeDTO();
        dto.setCollege_name(college_name);
        dto.setCollege_name_en(college_name_en);
        dto.setIntro_title(intro_title);
        dto.setIntro_body(intro_body);
        dto.setImage_path("upload/" + fileName);

        int result = service.register(dto);

        String ctx = req.getContextPath();
        if (result > 0) {
            resp.sendRedirect(ctx + "/college/list.do?code=" + ResultCode.WRITE_SUCCESS.getCode());
        } else {
            resp.sendRedirect(ctx + "/college/write.do?code=" + ResultCode.WRITE_FAIL.getCode());
        }
    }
}
