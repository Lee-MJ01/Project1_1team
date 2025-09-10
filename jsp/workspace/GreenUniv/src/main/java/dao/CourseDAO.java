package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CourseDTO;
import dto.DepartmentDTO;
import util.DBHelper;
import util.Sql;

public class CourseDAO extends DBHelper{

	private final static CourseDAO INSTANCE = new CourseDAO();
	public static CourseDAO getInstance() {
		return INSTANCE;
	}
	
	private CourseDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insert(CourseDTO dto) {
		int result =0;
		
		
		
		
		return result;		
	}
	
	public CourseDTO selectOne(int crs_cd) {
		CourseDTO dto = null;
			
		return dto;
	}
	public List<CourseDTO> selectAll() {
		
		List<CourseDTO> dtoList = new ArrayList<CourseDTO>();

		return dtoList;
	}
	public void update(CourseDTO dto) {}
	public void delete(int crs_cd) {}
	
}
