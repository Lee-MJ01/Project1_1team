package service;

import java.util.List;

import dao.DepartmentDAO;
import dto.DepartmentDTO;

public enum DepartmentService {
	
	INSTANCE;
	
	private DepartmentDAO dao = DepartmentDAO.getInstance();
	
<<<<<<< HEAD
	public int register(DepartmentDTO dto) {
		return dao.insert(dto);
=======
	public void register(DepartmentDTO dto) {
		dao.insert(dto);
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
	}
	
	public DepartmentDTO findByDept_id(int dept_id) {
		return dao.selectByDept_id(dept_id);
	}
	
<<<<<<< HEAD
	public int findDeptId(String collegeName, String deptName) {
		return dao.findDeptId(collegeName, deptName);
	}
	
=======
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
	public List<DepartmentDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify() {
		
	}
	
	public void remove() {
		
	}
}
