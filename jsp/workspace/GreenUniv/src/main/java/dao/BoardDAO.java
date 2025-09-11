package dao;
import java.sql.PreparedStatement;
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
	
	/**
     * 게시판 종류(comm_cd)에 따른 전체 게시글 수를 조회합니다.
     * @param commCd
     * @return
     */
    public int selectCountNotices(String commCd) {
        int total = 0;
        conn = null;
        psmt = null;
        rs = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_NOTICE_COUNT_TOTAL);
            psmt.setString(1, commCd);
            rs = psmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            logger.error("selectCountNotices 오류: " + e.getMessage());
        } finally {
        	try {
	        	closeAll();
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
        }
        return total;
    }
    
    /**
     * 게시판 종류(comm_cd)에 따라 페이지 시작점(limitStart)부터 10개의 게시글을 조회합니다.
     * @param commCd
     * @param limitStart
     * @return
     */
    public List<BoardDTO> selectNotices(String commCd, int limitStart) {
        List<BoardDTO> dtoList = new ArrayList<>();
        conn = null;
        psmt = null;
        rs = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_NOTICE_LIST_PAGE); // LIMIT ?, OFFSET ? 대신 LIMIT ? 사용
            psmt.setString(1, commCd);
            psmt.setInt(2, limitStart);
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
            logger.error("selectNotices 오류: " + e.getMessage());
        } finally {
        	try {
	        	closeAll();
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
        }
        return dtoList;
    }
	
	public BoardDTO selectById(String file_yn) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(file_yn);
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return null;
	}
	
	// 학사공지사항 검색(index.jsp용)
	public List<BoardDTO> IndexAcademicsSelectAll() {
		List<BoardDTO> listDTO = new ArrayList<>();
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
	        try {
	        	if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	
	// 커뮤니티 공지사항 검색(index.jsp용) 
	public List<BoardDTO> IndexCommunitySelectAll() {
		List<BoardDTO> listDTO = new ArrayList<>();
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
	        	if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	
	// 커뮤니티 뉴스및칼럼 검색(index.jsp용) 
	public List<BoardDTO> IndexCommuNewsSelectAll() {
		List<BoardDTO> listDTO = new ArrayList<>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_BOARD_ALL);
			psmt.setString(1, "6002");
			
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
	        	if (rs != null) rs.close();
	            if (psmt != null) psmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            logger.error("자원 해제 중 오류 발생", e);
	        }
	    }
		
		
		return listDTO;
	}
	

	public List<BoardDTO> admissionNoticeSelectAll(){
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ALL);
			psmt.setString(1, "2001");
			
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
			closeAll();

		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}

	//공지사항 view select
	public BoardDTO selectNoticeView(int number) {
	    BoardDTO dto = null;

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ONE);
	        psmt.setInt(1, number);     

	        rs = psmt.executeQuery();

	        if (rs.next()) {
	            dto = new BoardDTO();
	            dto.setNumber(rs.getInt("no"));            
	            dto.setTitle(rs.getString("title"));
	            dto.setContent(rs.getString("content"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setW_date(rs.getString("wdate"));   
	            dto.setView_count(rs.getInt("views"));     
	        }
	        closeAll();
	    } catch (Exception e) {
	        logger.error(e.getMessage());
	    } 
	    return dto;
	}


	//학사안내 공지사항 select
	public List<BoardDTO> academicsNoticeSelectAll(){
		
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ALL);
			psmt.setString(1, "4001");
			
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
			
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	
	//커뮤니티 공지사항 select
	public List<BoardDTO> communityNoticeSelectAll(){
		
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ALL);
			psmt.setString(1, "6001");
			
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
			
			closeAll();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtoList;
	}
	public void insert() {}
	public void update() {}
	public void delete() {}
}
	