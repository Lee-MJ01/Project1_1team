package controller.university.admission;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.BoardDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.BoardService;


@WebServlet("/admission/noticeview.do")
public class NoticeViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = BoardService.INSTANCE;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noparam = req.getParameter("no");
		 int number;
	        try {
	            number = Integer.parseInt(noparam);
	        } catch (NumberFormatException e) {
	            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "no must be integer");
	            return;
	        }
	    BoardDTO boardDTO = boardService.FindNoticeView(number);
		logger.debug(boardDTO.toString());
		
		req.setAttribute("BoardDTO", boardDTO);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/admission/noticeView.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

}
