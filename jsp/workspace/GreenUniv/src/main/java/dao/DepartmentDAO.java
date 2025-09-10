package dao;

import java.sql.SQLException;
import java.util.ArrayList;
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
	
	private DepartmentDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(DepartmentDTO dto) {
		
		try {
			
			conn=getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_DEPARTMENT);
			psmt.setString(1,dto.getCollege_name());
			psmt.setString(2,dto.getDept_name());
			psmt.setString(3,dto.getDept_name_en());
			psmt.setString(4,dto.getEstablished());
			psmt.setString(5,dto.getChair_name());
			psmt.setString(6,dto.getDept_phone());
			psmt.setString(7,dto.getDept_office());
			psmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		
	}
	
	public DepartmentDTO selectByDept_id(int dept_id) {
		DepartmentDTO dto = null;
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(Sql.SELECT_DEPARTMENT_BY_DEPT_ID);
			psmt.setInt(1, dept_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new DepartmentDTO();
				dto.setDept_id(rs.getInt(1));
				dto.setCollege_name(rs.getString(2));
				dto.setDept_name(rs.getString(3));
				dto.setDept_name_en(rs.getString(4));
				dto.setEstablished(rs.getString(5));
				dto.setChair_name(rs.getString(6));
				dto.setDept_phone(rs.getString(7));
				dto.setDept_office(rs.getString(8));
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		} 
		finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		return dto;
	}
	public List<DepartmentDTO> selectAll() {
		
		List<DepartmentDTO> dtoList = new ArrayList<DepartmentDTO>();
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_ALL_DEPARTMENT);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setDept_id(rs.getInt(1));
				dto.setCollege_name(rs.getString(2));
				dto.setDept_name(rs.getString(2));
				dto.setDept_name_en(rs.getString(4));
				dto.setEstablished(rs.getString(5));
				dto.setChair_name(rs.getString(6));
				dto.setDept_phone(rs.getString(7));
				dto.setDept_office(rs.getString(8));
				
				dtoList.add(dto);
				
			}
			
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		
		return dtoList;
	}
	public void update(DepartmentDTO dto) {}
	public void delete(int dept_id) {}
	
}
