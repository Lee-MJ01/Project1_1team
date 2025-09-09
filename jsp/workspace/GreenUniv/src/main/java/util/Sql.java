package util;

public class Sql {
	
	// terms
	public static final String SELECT_TERMS = "SELECT * FROM TB_TERMS where NO=?";
	
	// user
	public static final String SELECT_COUNT = "SELECT COUNT(*) FROM TB_USER ";
	public static final String WHERE_USID = "WHERE USID=?";
	public static final String WHERE_NICK = "WHERE NICK=?";
	public static final String WHERE_EMAIL = "WHERE EMAIL=?";
	public static final String WHERE_HP   = "WHERE HP=?";
	
	public static final String SELECT_USER_BY_PASS = "SELECT * FROM TB_USER WHERE USID=? AND PASS=STANDARD_HASH(?, 'SHA256')";
	
	
	public static final String INSERT_USER = "INSERT INTO TB_USER (USID, PASS, US_NAME, NICK, EMAIL, HP, ZIP, ADDR1, ADDR2, REG_IP, REG_DATE) "
											+ "VALUES (?,STANDARD_HASH(?, 'SHA256'),?,?,?,?,?,?,?,?,SYSDATE)";

	
	// article
	public static final String SELECT_COUNT_TOTAL = "SELECT COUNT(*) FROM TB_ARTICLE";
	public static final String SELECT_ARTICLE_ALL = "SELECT A.*, U.nick FROM TB_ARTICLE A "
													+ "JOIN TB_USER U  ON A.WRITER = U.USID "
													+ "ORDER BY ANO DESC "
													+ "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
	
	public final static String SELECT_ARTICLE_WITH_FILE = "SELECT A.*, U.NICK, F.* FROM TB_ARTICLE A "
														+ "JOIN TB_USER U ON A.WRITER = U.USID "
														+ "LEFT JOIN TB_FILE F ON A.ANO = F.ANO "
														+ "WHERE A.ANO=?";
	
	public final static String SELECT_COUNT_SEARCH = "SELECT COUNT(*) FROM TB_ARTICLE ";
	public final static String SELECT_ARTICLE_SEARCH = "SELECT A.*, U.NICK FROM TB_ARTICLE A "
														+ "JOIN TB_USER U ON A.WRITER = U.USID ";
	
	public final static String SEARCH_WHERE_TITLE = "WHERE TITLE LIKE ?";
	public final static String SEARCH_WHERE_CONTENT = "WHERE CONTENT LIKE ?";
	public final static String SEARCH_WHERE_NICK = "WHERE NICK LIKE ?";
	
	public final static String SEARCH_ORDER_ANO = "ORDER BY ANO DESC ";
	public final static String SEARCH_OFFSET_ROW = "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
	
	
	public static final String SELECT_MAX_ANO = "SELECT MAX(ANO) FROM TB_ARTICLE";
	public static final String INSERT_ARTICLE = "INSERT INTO TB_ARTICLE (TITLE, CONTENT, FILE_CNT, WRITER, REG_IP, WDATE) VALUES (?, ?, ?, ?, ?, SYSDATE)";
	
	// comment
	public static final String INSERT_COMMENT = "INSERT INTO TB_COMMENT (ANO, CONTENT, WRITER, REG_IP, WDATE) VALUES (?, ?, ?, ?, SYSDATE)";
	public static final String SELECT_COMMENT_ALL = "SELECT C.*, U.NICK FROM TB_COMMENT C "
													+ "JOIN TB_USER U ON C.WRITER = U.USID "
													+ "WHERE ano=? ORDER BY CNO ASC";
	
	public static final String SELECT_COMMENT_LATEST = "SELECT C.*, U.NICK FROM TB_COMMENT C "
														+ "JOIN TB_USER U ON C.WRITER = U.USID "
														+ "WHERE cno=(SELECT MAX(cno) FROM TB_COMMENT)";
	
	
	// file
	public static final String INSERT_FILE = "INSERT INTO TB_FILE (ANO, ONAME, SNAME, RDATE) VALUES (?, ?, ?, SYSDATE)";
	public final static String SELECT_FILE = "SELECT * FROM TB_FILE WHERE fno=?";
	public final static String UPDATE_FILE_DOWNLOAD = "UPDATE TB_FILE SET DOWNLOAD = DOWNLOAD + 1 WHERE FNO=?";
	
	
	
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


	
	
	
	
	
	
}
