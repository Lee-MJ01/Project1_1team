package greenuniv.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import greenuniv.dto.UserDTO;
import greenuniv.util.DBHelper;
import greenuniv.util.Sql;

public class UserDAO extends DBHelper {
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}
	
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insert(UserDTO dto) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.INSERT_USER);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getUser_name());
			psmt.setString(4, dto.getHp());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getAddr1());
			psmt.setString(7, dto.getAddr2());
			psmt.setBoolean(8, dto.isAdmin());
			
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
