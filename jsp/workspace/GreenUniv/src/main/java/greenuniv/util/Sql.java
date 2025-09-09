package greenuniv.util;

public class Sql {
	
	///////////////////////////////////////////
	/// User 관리
	///////////////////////////////////////////
	
	// User 데이터 입력
	public static final String INSERT_USER = 
		"INSERT INTO users (user_id, pass, user_name, hp, email, addr1, addr2, user_role) "
			+ "VALUES (?, SHA2(?,256), ?, ?, ?, ?, ?, ?)";
	
	// User 데이터 조회
	public static final String SELECT_USER_BY_ID_AND_PASS =
		"SELECT user_id, pass, user_name, hp, email, addr1, addr2, user_role " 
			+ "FROM users WHERE user_id=? AND pass=SHA2(?,256)";

	public static final String SELECT_USER_BY_ID =
		"SELECT user_id, pass, user_name, hp, email, addr1, addr2, user_role " 
			+ "FROM users WHERE user_id=?";

	public static final String SELECT_COUNT_BASE = "SELECT COUNT(*) FROM users ";
	public static final String WHERE_USER_ID = "WHERE user_id=?";
	public static final String WHERE_EMAIL   = "WHERE email=?";
	public static final String WHERE_HP      = "WHERE hp=?";
	
	// User 데이터 수정
	public static final String UPDATE_USER_PROFILE =
		"UPDATE users SET user_name=?, hp=?, email=?, addr1=?, addr2=? WHERE user_id=?";

	public static final String UPDATE_USER_PASSWORD =
		"UPDATE users SET pass=SHA2(?,256) WHERE user_id=?";

	public static final String UPDATE_USER_ROLE =
		"UPDATE users SET user_role=? WHERE user_id=?";
	
	// User 데이터 삭제
	public static final String DELETE_USER =
		"DELETE FROM users WHERE user_id=?";
}