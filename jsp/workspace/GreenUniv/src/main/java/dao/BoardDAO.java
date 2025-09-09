package dao;


import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.BoardDTO;
import greenuniv.util.DBHelper;

public class BoardDAO extends DBHelper{
	
	private final static BoardDAO INSTANCE = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return INSTANCE;
	}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<BoardDTO> selectAll(){
		
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			//임시 확인용
			String sql =
			        "SELECT " +
			        "  `Number`                       " +          
			        "  title, " +
			        "  writer, " +
			        "  DATE_FORMAT(w_date, '%y.%m.%d') " +
			        "  view_count                      " +
			        "FROM board " +
			        "WHERE comm_cd = ? " +                               
			        "ORDER BY `Number` DESC";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
	            BoardDTO dto = new BoardDTO();
	            dto.setNumber(rs.getInt("no"));
	            dto.setTitle(rs.getString("title"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setW_date(rs.getString("wdate"));             
	            dto.setView_count(rs.getInt("views"));

	            dtoList.add(dto);
	        }
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

}
