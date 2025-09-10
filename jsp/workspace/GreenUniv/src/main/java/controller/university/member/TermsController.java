package controller.university.member;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dto.TermsDTO;
import service.TermsService;

@WebServlet("/member/terms.do")
public class TermsController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
private TermsService service = TermsService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		TermsDTO termsDTO = service.findById(1);
		//System.out.println(termsDTO);
		
		req.setAttribute("termsDTO", termsDTO);		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/member/terms.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
