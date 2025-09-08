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
	
	
	
	
	
	
	
	
	
	
	
	
}
