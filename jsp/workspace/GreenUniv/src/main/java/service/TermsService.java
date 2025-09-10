package service;

import java.util.List;

import dao.TermsDAO;
import dto.TermsDTO;

public enum TermsService {
	
	INSTANCE;
	
	private TermsDAO dao = TermsDAO.getInstance();
	
	public void register(TermsDTO dto) {
		dao.insert(dto);
	}
	
	public TermsDTO findById(int no) {
		return dao.select(no);
	}
	
	public List<TermsDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify(TermsDTO dto) {
		dao.update(dto);
	}
	
	public void remove(int no) {
		dao.delete(no);
	}
}
