package service;

import java.util.List;

import dao.DepartmentDAO;
import dto.DepartmentDTO;

public enum DepartmentService {
	
	INSTANCE;
	
	private DepartmentDAO dao = DepartmentDAO.getInstance();
	
	public int register(DepartmentDTO dto) {
		return dao.insert(dto);
	}
	
	public DepartmentDTO findByDept_id(int dept_id) {
		return dao.selectByDept_id(dept_id);
	}
	
	public int findDeptId(String collegeName, String deptName) {
		return dao.findDeptId(collegeName, deptName);
	}
	
	public List<DepartmentDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify() {
		
	}
	
	public void remove() {
		
	}
}
