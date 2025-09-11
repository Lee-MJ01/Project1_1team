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
			logger.error("insert", e);
			throw new RuntimeException(e);
			
		} finally { try { closeAll(); } catch (Exception ignore) {} }
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
	
	/**
	 * 주어진 ID가 student 테이블에 존재하는지 확인 (학부생 여부 체크)
	 * @param userId 확인할 사용자 ID (학번)
	 * @return 학생이면 true, 아니면 false
	 */
	public boolean isStudent(String userId) {
	    boolean result = false;
	    try {
	        conn = getConnection();
	        // student 테이블에서 std_id가 일치하는 데이터가 있는지 COUNT
	        psmt = conn.prepareStatement("SELECT COUNT(*) FROM student WHERE std_id = ?");
	        psmt.setString(1, userId);
	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            // COUNT 결과가 0보다 크면 학생임
	            if (rs.getInt(1) > 0) {
	                result = true;
	            }
	        }
	    } catch (Exception e) {
	        logger.error("isStudent 오류: " + e.getMessage());
	    } finally {
	        try {
	            closeAll();
	        } catch (SQLException e) {
	            logger.error("isStudent 자원 해제 오류", e);
	        }
	    }
	    return result;
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
	public boolean existsById(String userId) {
	    boolean result = false;
	    try {
	        conn = getConnection();
	        String sql = "SELECT COUNT(*) FROM users WHERE user_id = ?";
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, userId);

	        rs = psmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getInt(1) > 0;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try { closeAll(); } catch (Exception ignored) {}
	    }
	    return result;
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
	
	// 아이디, 비밀번호 찾기
	public Optional<String> findUserIdByNameEmail(String name, String email) {
	    String sql = "SELECT user_id FROM users WHERE user_name=? AND email=?";
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, name);
	        psmt.setString(2, email);
	        rs = psmt.executeQuery();
	        if (rs.next()) return Optional.ofNullable(rs.getString(1));
	    } catch(Exception e){ e.printStackTrace(); }
	    finally { try { closeAll(); } catch(Exception ignore){} }
	    return Optional.empty();
	}

	public boolean existsByIdAndEmail(String userId, String email) {
	    String sql = "SELECT COUNT(*) FROM users WHERE user_id=? AND email=?";
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, userId);
	        psmt.setString(2, email);
	        rs = psmt.executeQuery();
	        if (rs.next()) return rs.getInt(1) > 0;
	    } catch(Exception e){ e.printStackTrace(); }
	    finally { try { closeAll(); } catch(Exception ignore){} }
	    return false;
	}

	public int updatePassword(String userId, String encPass) {
	    String sql = "UPDATE users SET pass=? WHERE user_id=?";
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(sql);
	        psmt.setString(1, encPass);
	        psmt.setString(2, userId);
	        return psmt.executeUpdate();
	    } catch(Exception e){ e.printStackTrace(); }
	    finally { try { closeAll(); } catch(Exception ignore){} }
	    return 0;
	}
}