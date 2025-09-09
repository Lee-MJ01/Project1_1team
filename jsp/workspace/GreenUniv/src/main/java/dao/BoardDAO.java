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
	        try {
	            closeAll(); 
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	
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
	public void insert() {}
	public void update() {}
	public void delete() {}
	