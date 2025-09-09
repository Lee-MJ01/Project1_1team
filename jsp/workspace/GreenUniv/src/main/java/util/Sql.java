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
	//Department --서현우
	//학과등록
	public static final String INSERT_DEPARTMENT= "INSERT INTO department (college_name, dept_name, dept_name_en, established, chair_name, dept_phone, dept_office) VALUES (?,?,?,?,?,?,?)";
	//dept_id로 학과 셀렉트
	public static final String SELECT_DEPARTMENT_BY_DEPT_ID = "SELECT * from department where dept_id=?"; 
	//dept모든 행 select
	public static final String SELECT_ALL_DEPARTMENT = "SELECT * FROM department";
	
	
}
