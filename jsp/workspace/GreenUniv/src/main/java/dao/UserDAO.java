package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.UserDTO;
import util.DBHelper;
import util.Sql;

public class UserDAO extends DBHelper {
	
	private final static UserDAO INSTANCE = new UserDAO();
	public static UserDAO getInstance() {
		return INSTANCE;
	}
	
	private UserDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// INSERT 메서드 (회원 정보 입력)
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
			psmt.setString(8, dto.getUser_role() != null ? dto.getUser_role() : "VISITOR");
			
			psmt.executeUpdate();
			closeAll();
		
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	// mapping 정의
	private UserDTO map() throws SQLException {
		UserDTO u = new UserDTO();
		u.setUser_id  (rs.getString("user_id"));
		u.setPass	  (rs.getString("pass"));
		u.setUser_name(rs.getString("user_name"));
		u.setHp		  (rs.getString("hp"));
		u.setEmail	  (rs.getString("email"));
		u.setAddr1	  (rs.getString("addr1"));
		u.setAddr2	  (rs.getString("addr2"));
		u.setUser_role(rs.getString("user_role"));
		return u;
	}
	
	// mapping 정의2 (SELECT 목록 조회용, pass 조회 X)
	private UserDTO mapWithoutPass() throws SQLException {
		UserDTO u = new UserDTO();
		u.setUser_id  (rs.getString("user_id"));
		u.setUser_name(rs.getString("user_name"));
		u.setHp		  (rs.getString("hp"));
		u.setEmail	  (rs.getString("email"));
		u.setAddr1	  (rs.getString("addr1"));
		u.setAddr2	  (rs.getString("addr2"));
		u.setUser_role(rs.getString("user_role"));
		return u;
	}
	
	// SELECT 메서드 (로그인 조회)
	public Optional<UserDTO> selectForLogin(String user_id, String pass) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER_BY_ID_AND_PASS);
			psmt.setString(1, user_id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) return Optional.of(map());
			return Optional.empty();
			
		} catch (Exception e) {
			logger.error("selectForLogin", e);
			throw new RuntimeException(e);
		
		} finally { try {closeAll(); } catch(Exception ignore){} }
	}
	
	// SELECT 메서드 (단건 조회)
	public Optional<UserDTO> findById(String user_id) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_USER_BY_ID);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			
			if(rs.next()) return Optional.of(map());
			return Optional.empty();
		
		} catch (Exception e) {
			logger.error("findById", e);
			throw new RuntimeException(e);
		
		} finally { try { closeAll(); } catch(Exception ignore){} }
	}
	
	// SELECT 메서드 (목록 조회)
	public List<UserDTO> selectAll() {
		List<UserDTO> list = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement
					("SELECT user_id, user_name, hp, email, addr1, addr2, user_role FROM users ORDER BY user_id DESC");
			rs = psmt.executeQuery();
			
			while (rs.next()) list.add(mapWithoutPass());
			return list;
			
		} catch (Exception e) {
			logger.error("selectAll", e);
			throw new RuntimeException(e);
		
		} finally { try { closeAll(); } catch(Exception ignore){} }
	}
	
	// SELECT 메서드 (중복 조회, 제거)
	public boolean existsById(String user_id) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE user_id=?");
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			rs.next(); return rs.getInt(1) > 0;
			
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally { try { closeAll(); 

		} catch (Exception ignore) {} }
	}
	
	public boolean existsByEmail(String email) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE email=?");
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			rs.next(); return rs.getInt(1) > 0;
			
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally { try { closeAll(); 

		} catch (Exception ignore) {} }
	}
	
	public boolean existsByHp(String hp) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT COUNT(*) FROM users WHERE hp=?");
			psmt.setString(1, hp);
			rs = psmt.executeQuery();
			rs.next(); return rs.getInt(1) > 0;
			
		} catch (Exception e) {
			throw new RuntimeException(e);

		} finally { try { closeAll(); 

		} catch (Exception ignore) {} }
	}
}