package service;

import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;

public enum BoardService {

	instance;
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	
	public List<BoardDTO> findAll(){
		return dao.selectAll();
	}
	
}

