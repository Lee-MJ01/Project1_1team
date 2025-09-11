package service;

import java.util.List;

import dao.CourseDAO;
import dao.DepartmentDAO;
import dto.CourseDTO;
import dto.DepartmentDTO;
import dto.OperationOverviewDTO;

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
	
	public List<CourseDTO> selectForLectureList(){
		return dao.selectForLectureList();
	}
	
	public void modify() {
		
	}
	
	public void remove() {
		
	}
	
	public int getNextNum(int deptId, int year, int semester) {
		return dao.getNextSeq(deptId, year,semester);
	}
	
	// CourseService.java
	public List<CourseDTO> findPaged(int offset, int pageSize) {
	    return dao.selectPaged(offset, pageSize);
	}

	public int countAll() {
	    return dao.countAll();
	}

	public List<OperationOverviewDTO> getOverview(int offset, int pageSize) {
	    return dao.selectOverviewPaged(offset, pageSize);
	}
	
	public int countOverview() {
		return dao.countOverview();
	}


}
