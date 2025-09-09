package controller.university;

import java.io.IOException;
import java.net.http.HttpClient;
import java.util.List;

import dto.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;

@WebServlet("/university/index.do")
public class IndexListController extends HttpServlet {
	private static final long serialVersionUID = 7217574776731435299L;
	
	private BoardService serviceBoard = BoardService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BoardDTO> dtoAcademicsList = serviceBoard.IndexAcademicsfindAll();
		req.setAttribute("dtoAcademicsList", dtoAcademicsList);
		
		List<BoardDTO> dtoCommunityList = serviceBoard.IndexCommunityfindAll();
		req.setAttribute("dtoCommunityList", dtoCommunityList);
		
		RequestDispatcher dipatcher = req.getRequestDispatcher("/index.jsp");
		dipatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
