package service;

import java.util.List;

import dao.DepartmentDAO;
import dto.DepartmentDTO;

public enum DepartmentService {
	
	INSTANCE;
	
	private DepartmentDAO dao = DepartmentDAO.getInstance();
	
	public void register(DepartmentDTO dto) {
		dao.insert(dto);
	}
	
	public DepartmentDTO findByDept_id(int dept_id) {
		return dao.selectByDept_id(dept_id);
	}
	
	public List<DepartmentDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify() {
		
	}
	
	public void remove() {
		
	}
}
