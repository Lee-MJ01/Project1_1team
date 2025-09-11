package controller.university.admission;

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

@WebServlet("/admission/notice.do")
public class NoticeListController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = BoardService.INSTANCE;
	private static final String COMM_CD = "2001"; // 입학안내 공지사항 코드

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 	--- jboard 방식 페이지네이션 로직 ---
        
        // 1. 현재 페이지 번호 가져오기
        String pg = req.getParameter("pg");
        int currentPage = (pg != null && !pg.isEmpty()) ? Integer.parseInt(pg) : 1;
        
        // 2. 전체 게시글 수 구하기
        int total = boardService.selectCountNotices(COMM_CD);
        
        // 3. 마지막 페이지 번호 계산
        int lastPageNum = (int) Math.ceil(total / 5.0);
        
        // 4. 페이지 그룹 계산 (시작, 끝 번호)
        int pageGroupCurrent = (int) Math.ceil(currentPage / 5.0);
        int pageGroupStart = (pageGroupCurrent - 1) * 5 + 1;
        int pageGroupEnd = pageGroupCurrent * 5;
        
        if (pageGroupEnd > lastPageNum) {
            pageGroupEnd = lastPageNum;
        }
        
        // 5. 페이지 시작 번호 계산 (OFFSET 대신)
        int limitStart = (currentPage - 1) * 5;
        
        // 6. 현재 페이지 게시글 목록 가져오기
        List<BoardDTO> dtoList = boardService.selectNotices(COMM_CD, limitStart);
        
        // 7. JSP로 모든 계산 결과 전달
        req.setAttribute("dtoList", dtoList);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPageNum", lastPageNum);
        req.setAttribute("pageGroupStart", pageGroupStart);
        req.setAttribute("pageGroupEnd", pageGroupEnd);
        req.setAttribute("total", total);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/admission/notice.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
