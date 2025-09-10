package service;

import java.util.List;

import dao.CourseDAO;
import dao.DepartmentDAO;
import dto.CourseDTO;
import dto.DepartmentDTO;

public enum CourseService {
	
	INSTANCE;
	
	private CourseDAO dao = CourseDAO.getInstance();
	
	public int register(CourseDTO dto) {
		return dao.insert(dto);
	}
	
	public CourseDTO findByOne(int crs_id) {
		return dao.selectOne(crs_id);
	}
	
	public List<CourseDTO> findAll() {
		return dao.selectAll();
	}
	
	public void modify() {
		
	}
	
	public void remove() {
		
	}
	
	public int getNextNum(int deptId, int year, int semester) {
		return dao.getNextSeq(deptId, year,semester);
	}
}
