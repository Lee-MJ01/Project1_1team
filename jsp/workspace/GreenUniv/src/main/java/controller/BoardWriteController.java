package controller;

import java.io.IOException;

import dto.BoardDTO;
import dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.BoardService;
import service.MenuService;
import util.ResultCode;

@WebServlet("/board/write.do")
@MultipartConfig(maxFileSize = 10 * 1024 * 1024) // 파일 10MB 예시

public class BoardWriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private final BoardService boardService = BoardService.INSTANCE;
    private final MenuService  menuService  = MenuService.INSTANCE;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 드롭다운 데이터 주입
        req.setAttribute("parents",  menuService.parents());      
        req.setAttribute("children", menuService.childrenAll()); 
        
        req.getRequestDispatcher("/WEB-INF/views/university/boardWrite.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	
    	
        //HttpSession session = req.getSession(false);
        //UserDTO user = (session != null) ? (UserDTO) session.getAttribute("sessUser") : null;

    	 req.setCharacterEncoding("UTF-8");

         String parentCd = req.getParameter("parent_cd"); // UI용(검증/로그용)
         String commCd   = req.getParameter("comm_cd");   // 실제 게시판 코드(필수)
         String title    = req.getParameter("title");
         String content  = req.getParameter("content");

         //if (user == null) { resp.sendError(401); return; }
         //String writer = user.getUser_id();

         UserDTO user = (UserDTO) req.getSession().getAttribute("sessUser");
         String writer = (user != null && user.getUser_id() != null) ? user.getUser_id() : "1";

         //글 등록
         BoardDTO dto = new BoardDTO();
         dto.setComm_cd(commCd);
         dto.setTitle(title);
         dto.setContent(content);
         dto.setWriter(writer);
         
         int newNo = boardService.write(dto);
 
         resp.sendRedirect(
        		    req.getContextPath() 
        		    + "/board/write.do?code="+ResultCode.WRITE_SUCCESS.getCode()
        		);

    }
}

