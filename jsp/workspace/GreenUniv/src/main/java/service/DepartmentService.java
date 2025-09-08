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
	
	public void findByDeptName(String dept_name) {
		dao.select(dept_name);
	}
	
	public List<DepartmentDTO> findAll(){
		return dao.selectAll();
	}
	
	public void modify (DepartmentDTO dto) {
		dao.update(dto);
	}
	
	public void remove(int dept_no) {
		dao.delete(dept_no);
	}
}
