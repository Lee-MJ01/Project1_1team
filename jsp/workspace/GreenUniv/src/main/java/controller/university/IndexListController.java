package controller.university;

import java.io.IOException;
import java.util.List;

import dto.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;

@WebServlet("")
public class IndexListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService serviceBoard = BoardService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("123125");
		List<BoardDTO> dtoAcademicsList = serviceBoard.IndexAcademicsfindAll();
		req.setAttribute("dtoAcademicsList", dtoAcademicsList);
		
		List<BoardDTO> dtoCommunityList = serviceBoard.IndexCommunityfindAll();
		req.setAttribute("dtoCommunityList", dtoCommunityList);
		
		List<BoardDTO> dtoCommuNewsList = serviceBoard.IndexCommuNewsfindAll();
		req.setAttribute("dtoCommuNewsList", dtoCommuNewsList);
		
		RequestDispatcher dipatcher = req.getRequestDispatcher("/index.jsp");
		dipatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
