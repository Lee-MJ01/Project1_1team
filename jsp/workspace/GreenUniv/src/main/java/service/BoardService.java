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
	
	public List<BoardDTO> findAll(){
		return dao.selectAll();
	}
}
