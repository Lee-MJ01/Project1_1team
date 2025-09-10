package dao;

import java.sql.PreparedStatement;
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
	
	public int insert(DepartmentDTO dto) {
		int result = 0;
		try {
			
			conn=getConnection();
			
			//1.단과대학 별 max dept_id 조회
	        String sqlMax = "SELECT MAX(dept_id) FROM department WHERE college_name = ?";
	        psmt = conn.prepareStatement(sqlMax);
	        psmt.setString(1, dto.getCollege_name()); // dto.getCollege_name(), test로 세팅하면 들어가는거 확인
	        rs = psmt.executeQuery();
	        
	        int newDeptId;
	        if(rs.next()) {
	        	int maxId = rs.getInt(1);
	        	if(maxId ==0) { //가장초기 dept번호
	        		dto.setDept_id(dto.getCollege_id()+1);
	        	}
	        	else {
	        		dto.setDept_id(maxId+1);
	        	}
	        }

	        //2.INSERT
			PreparedStatement psmt2 = conn.prepareStatement(Sql.INSERT_DEPARTMENT);
			psmt2.setInt(1,dto.getDept_id()); //이거에 dept_id 담아줄거임
			psmt2.setString(2,dto.getCollege_name());
			psmt2.setString(3,dto.getDept_name());
			psmt2.setString(4,dto.getDept_name_en());
			psmt2.setString(5,dto.getEstablished());
			psmt2.setString(6,dto.getChair_name());
			psmt2.setString(7,dto.getDept_phone());
			psmt2.setString(8,dto.getDept_office());
			result = psmt2.executeUpdate();
			
			
			psmt2.close();
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
		
		return result;
		
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
	
	public int findDeptId(String collegeName, String deptName) {
	    int id = 0;
	    String sql = "SELECT dept_id FROM department d " +
	                 "JOIN college c ON d.college_name = c.college_name " +
	                 "WHERE c.college_name=? AND d.dept_name=?";
	    
	    try {
			conn=getConnection();
			psmt = conn.prepareStatement(sql);
	        psmt.setString(1, collegeName);
	        psmt.setString(2, deptName);
	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            id = rs.getInt("dept_id");
	        }
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	    return id;
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
