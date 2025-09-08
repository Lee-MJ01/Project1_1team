package DAO;

import Utill.DBHelper;

public class ScoreDAO extends DBHelper{
	
	private final static ScoreDAO INSTANCE = new ScoreDAO();
	public static ScoreDAO getInstance() {
		return INSTANCE;
	}	
	
	private ScoreDAO() {}

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int insert(ScoreDTO dto) {
		
	}
	
	
}
