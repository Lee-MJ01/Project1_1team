package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLEditorKit.InsertHTMLTextAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.BoardDTO;
import util.DBHelper;
import util.Sql;

public class BoardDAO extends DBHelper{
	
	private static final BoardDAO INSTANCE = new BoardDAO();
	public static BoardDAO getInstance() {
		return INSTANCE;
	}
	private BoardDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public BoardDTO selectById(String file_yn) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(file_yn);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return null;
	}
	
	public List<BoardDTO> IndexAcademicsSelectAll() {
		List<BoardDTO> listDTO = new ArrayList<>();;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_BOARD_ALL);
			psmt.setString(1, "4001");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setW_date(rs.getString("w_date"));
				listDTO.add(dto);
				
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
	        // ▼▼▼ 이 코드가 반드시 필요합니다! ▼▼▼
	        try {
	            closeAll(); 
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	
	public List<BoardDTO> IndexCommunitySelectAll() {
		List<BoardDTO> listDTO = new ArrayList<>();;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_BOARD_ALL);
			psmt.setString(1, "6001");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setW_date(rs.getString("w_date"));
				listDTO.add(dto);
				
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}finally {
	        // ▼▼▼ 이 코드가 반드시 필요합니다! ▼▼▼
	        try {
	            closeAll(); 
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	
	public List<BoardDTO> selectAll() {
		List<BoardDTO> listDTO = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(Sql.SELECT_BOARD_ALL);
			
			while(!rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setComm_cd(null);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		
		return listDTO;
	}
	public void insert() {}
	public void update() {}
	public void delete() {}
	
}
