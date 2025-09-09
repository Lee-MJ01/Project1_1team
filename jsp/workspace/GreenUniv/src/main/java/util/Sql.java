package util;

public class Sql {
	// board
	public static final String SELECT_BOARD_ALL = 
			"select title, w_date from board where comm_cd = ? order by w_date desc LIMIT 5;";
	
	// college
	public static final String INSERT_COLLEGE =
	    "INSERT INTO college (college_name, college_name_en, intro_title, intro_body, image_path) VALUES (?, ?, ?, ?, ?)";

	public static final String SELECT_COLLEGE =
	    "SELECT college_name, college_name_en, intro_title, intro_body, image_path FROM college WHERE college_name=?";

	public static final String SELECT_COLLEGE_ALL =
	    "SELECT college_name, college_name_en, intro_title, intro_body, image_path " +
	    "FROM college ORDER BY college_name LIMIT ?, 10";

	public static final String UPDATE_COLLEGE =
	    "UPDATE college SET college_name_en=?, intro_title=?, intro_body=?, image_path=? WHERE college_name=?";

	public static final String DELETE_COLLEGE =
	    "DELETE FROM college WHERE college_name=?";

	public static final String SELECT_COLLEGE_COUNT_TOTAL =
	    "SELECT COUNT(*) FROM college";

	
	// student (등록 페이지용)
	public static final String INSERT_STUDENT =
	  "INSERT INTO student (" +
	  " std_id, resident_number, name, e_name, gender, division, phone, email, address," +
	  " entryyear, graduationyear, dept_id, entryterm, entrygrade, advisor, status" +
	  ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	public static final String SELECT_STUDENT =
	  "SELECT std_id, resident_number, name, e_name, gender, division, phone, email, address," +
	  " entryyear, graduationyear, dept_id, entryterm, entrygrade, advisor, status " +
	  "FROM student WHERE std_id=?";

	//  목록 간단 조회 – 페이지네이션 없이 전부
	public static final String SELECT_STUDENT_ALL_SIMPLE =
	  "SELECT std_id, name, resident_number, phone, email, dept_id, entrygrade, entryterm, status " +
	  "FROM student ORDER BY std_id DESC";
   // 총 개수
   public static final String SELECT_STUDENT_LIST_COUNT =
       "SELECT COUNT(*) " +
       "FROM student s JOIN department d ON d.dept_id = s.dept_id %s";

   // 목록 (MySQL: LIMIT ? OFFSET ?)
   public static final String SELECT_STUDENT_LIST_MYSQL =
       "SELECT s.std_id, s.name, s.resident_number, s.phone, s.email, " +
       "       d.dept_name AS dept_name, s.entrygrade, s.entryterm, s.status " +
       "FROM student s JOIN department d ON d.dept_id = s.dept_id %s " +
       "ORDER BY s.std_id DESC " +
       "LIMIT ? OFFSET ?";

   
   // util/Sql.java 에 추가

   // ── professor ────
   public static final String INSERT_PROFESSOR =
     "INSERT INTO professor (" +
     " prof_id, resident_number, name, e_name, gender, division, phone, email," +
     " zip, addr1, addr2," +
     " graduated_univ, graduation_date, major_field, degree, dept_id, hire_date" +
     ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

   public static final String SELECT_PROFESSOR =
     "SELECT p.prof_id, p.resident_number, p.name, p.e_name, p.gender, p.division, p.phone, p.email," +
     "       p.zip, p.addr1, p.addr2, p.graduated_univ, p.graduation_date, p.major_field, p.degree," +
     "       p.dept_id, p.hire_date, d.dept_name " +
     "FROM professor p JOIN department d ON d.dept_id = p.dept_id WHERE p.prof_id=?";

   // 총 개수
   public static final String SELECT_PROFESSOR_LIST_COUNT =
     "SELECT COUNT(*) FROM professor p JOIN department d ON d.dept_id = p.dept_id %s";

   // 목록 (MySQL LIMIT ? OFFSET ?)
   public static final String SELECT_PROFESSOR_LIST_MYSQL =
     "SELECT p.prof_id, p.name, p.phone, p.email, d.dept_name, p.degree, p.hire_date " +
     "FROM professor p JOIN department d ON d.dept_id = p.dept_id %s " +
     "ORDER BY p.prof_id DESC " +
     "LIMIT ? OFFSET ?";

	   
	
	
	//Department --서현우
	//학과등록
	public static final String INSERT_DEPARTMENT= "INSERT INTO department (college_name, dept_name, dept_name_en, established, chair_name, dept_phone, dept_office) VALUES (?,?,?,?,?,?,?)";
	//dept_id로 학과 셀렉트
	public static final String SELECT_DEPARTMENT_BY_DEPT_ID = "SELECT * from department where dept_id=?"; 
	//dept모든 행 select
	public static final String SELECT_ALL_DEPARTMENT = "SELECT * FROM department";
	
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
