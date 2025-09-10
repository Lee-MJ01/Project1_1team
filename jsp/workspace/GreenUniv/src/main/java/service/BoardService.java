package service;

import java.util.ArrayList;
import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import util.Sql;

public enum BoardService {
	INSTANCE;
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	// index에 보여지는 학사공지사항 select
	public List<BoardDTO> IndexAcademicsfindAll() {
		List<BoardDTO> dtoList = dao.IndexAcademicsSelectAll(); 
		return dtoList;
	}
	
	// index에 보여지는 공지사항 select
	public List<BoardDTO> IndexCommunityfindAll() {
		List<BoardDTO> dtoList = dao.IndexCommunitySelectAll(); 
		return dtoList;
	}
	
	// index에 보여지는 공지사항 select
	public List<BoardDTO> IndexCommuNewsfindAll() {
		List<BoardDTO> dtoList = dao.IndexCommuNewsSelectAll(); 
		return dtoList;
	}
	
<<<<<<< HEAD
	//입학안내 공지사항 select
	public List<BoardDTO> admissionNoticeFindAll(){
		return dao.admissionNoticeSelectAll();
	}
	
	//입학안내 공지사항 뷰
	public BoardDTO FindNoticeView(int number){
		return dao.selectNoticeView(number);
		
	}
	
	//입학안내 공지사항 select
	public List<BoardDTO> academicsNoticeFindAll(){
		return dao.academicsNoticeSelectAll();
	}
	
	//커뮤니티 공지사항 select
	public List<BoardDTO> communityNoticeFindAll(){
		return dao.communityNoticeSelectAll();
=======
	public List<BoardDTO> findAll(){
		return dao.selectAll();
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
	}
}
