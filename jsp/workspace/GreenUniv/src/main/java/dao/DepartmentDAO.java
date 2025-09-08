package dao;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.DepartmentDTO;
import util.DBHelper;
import util.Sql;

public class DepartmentDAO extends DBHelper{
	
	private final static DepartmentDAO INSTANCE = new DepartmentDAO();
	public static DepartmentDAO getInstance() {
		return INSTANCE;
	}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private DepartmentDAO() {};
	
	public void insert(DepartmentDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_DEPARTMENT);
			psmt.setString(1, dto.getCollege_name());
			psmt.setString(2, dto.getDept_name());
			psmt.setString(3, dto.getDept_name_en());
			psmt.setString(4, dto.getEstablished());
			psmt.setString(5, dto.getChair_name());
			psmt.setString(6, dto.getDept_phone());
			psmt.setString(7, dto.getDept_office());
		}
		catch (Exception e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}
	public void select(String dept_name) {}
	public List<DepartmentDTO> selectAll(){
		return null;
	}
	
	public void update(DepartmentDTO dto) {
		
	}
	
	public void delete (int dept_id) {
		
	}
	
	
}
