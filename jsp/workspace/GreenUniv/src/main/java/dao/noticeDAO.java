package dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import util.DBHelper;
import util.Sql;

public class noticeDAO extends DBHelper{
	private final static noticeDAO instance = new noticeDAO();
	public static noticeDAO getInstance() {
		return instance;
	}
	
	private noticeDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public void selectAll(){
		try {
			conn = getConnection();
			//psmt = conn.prepareStatement();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}

}
