package greenuniv.util;

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
	
	public static final String SELECT_MAX_ANO = "SELECT MAX(ANO) FROM TB_ARTICLE";
	public static final String INSERT_ARTICLE = "INSERT INTO TB_ARTICLE (TITLE, CONTENT, FILE_CNT, WRITER, REG_IP, WDATE) VALUES (?, ?, ?, ?, ?, SYSDATE)";
	
	// file
	public static final String INSERT_FILE = "INSERT INTO TB_FILE (ANO, ONAME, SNAME, RDATE) VALUES (?, ?, ?, SYSDATE)";

}