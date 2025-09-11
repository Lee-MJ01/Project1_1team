package controller.university.colleges;

import java.io.IOException;
import java.util.List;

import dto.CollegeDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CollegeService;

@WebServlet("/colleges/humanities.do")
public class HumanitiesListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CollegeService collegeService = CollegeService.INSTANCE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CollegeDTO dto = collegeService.findOne("인문사회대학");

		req.setAttribute("college", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/colleges/humanities.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
