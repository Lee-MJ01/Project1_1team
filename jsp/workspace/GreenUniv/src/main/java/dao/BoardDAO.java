package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
     * 게시판 종류(comm_cd)에 따라 페이지 시작점(limitStart)부터 5개의 게시글을 조회합니다.
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

	//입학 안내 공지사항 view select
			public BoardDTO selectAdmissionNoticeView(int number) {
			    BoardDTO dto = null;
			    try {
			        conn = getConnection();
			        psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ONE);
			        psmt.setString(1, "2001"); 
			        psmt.setInt(2, number);

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
			        logger.error(e.getMessage(), e);
			    }
			    return dto;
			}


			//입학 안내 공지사항 view select
			public BoardDTO selectAcademicNoticeView(int number) {
			    BoardDTO dto = null;
			    try {
			        conn = getConnection();
			        psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ONE);
			        psmt.setString(1, "4001"); 
			        psmt.setInt(2, number);

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
			        logger.error(e.getMessage(), e);
			    }
			    return dto;
			}


			//입학 안내 공지사항 view select
			public BoardDTO selectCommunityNoticeView(int number) {
			    BoardDTO dto = null;
			    try {
			        conn = getConnection();
			        psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ONE);
			        psmt.setString(1, "6001"); 
			        psmt.setInt(2, number);

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
			        logger.error(e.getMessage(), e);
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
	//커뮤니티 뉴스 및 칼럼
	public List<BoardDTO> communityNewsSelectAll(int page, int pageSize){
	    List<BoardDTO> dtoList = new ArrayList<>();
	    int offset = (Math.max(page,1)-1) * Math.max(pageSize,1);

	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.SELECT_COMMUNITY_NEWS_ALL);
	        psmt.setString(1, "6002");     
	        psmt.setInt(2, offset);
	        psmt.setInt(3, pageSize);

	        rs = psmt.executeQuery();
	        while (rs.next()) {
	            BoardDTO dto = new BoardDTO();
	            dto.setNumber(rs.getInt("no"));
	            dto.setDivision(rs.getString("division"));
	            dto.setTitle(rs.getString("title"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setW_date(rs.getString("wdate"));   
	            dto.setView_count(rs.getInt("view_count"));
	            dtoList.add(dto);
	        }
	        closeAll();

	    } catch (Exception e) {
	        logger.error(e.getMessage(), e);
	    } 
	    return dtoList;
	}
	
	//커뮤니티 취업정보
	public List<BoardDTO> communityjobsSelectAll(int page, int pageSize){
	    List<BoardDTO> dtoList = new ArrayList<>();
	    int offset = (Math.max(page,1)-1) * Math.max(pageSize,1);
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.SELECT_JOBS_LIST);
	        psmt.setString(1, "6003");   
	        psmt.setInt(2, offset);
	        psmt.setInt(3, pageSize);
	        
	        rs = psmt.executeQuery();
	        while (rs.next()){
	            BoardDTO d = new BoardDTO();
	            d.setNumber(rs.getInt("no"));
	            d.setStat_2(rs.getString("stat_2"));
	            d.setCompany(rs.getString("company"));
	            d.setTitle(rs.getString("title"));
	            d.setDeadline(rs.getString("deadline_str"));
	            d.setView_count(rs.getInt("view_count"));
	            dtoList.add(d);
	        }
	        closeAll();
	    } catch(Exception e){
	        logger.error(e.getMessage(), e);
	    }
	    return dtoList;
	}
	
	//커뮤니티자유게시판
	public List<BoardDTO> communityBoardSelectAll(){
		
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ALL);
			psmt.setString(1, "6004");
			
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
	//커뮤니티 자료실
	public List<BoardDTO> communityResourceSelectAll(){
		
		List<BoardDTO> dtoList = new ArrayList<BoardDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_NOTICE_ALL);
			psmt.setString(1, "6006");
			
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
	
	// 다음 글 번호 구하기
	public int nextNumber(String commCd) {
	    int next = 1; // 글 없을 때는 1번부터 시작

	    try (Connection con = getConnection();
	         PreparedStatement ps = con.prepareStatement(Sql.SELECT_NEXT_NO)) {

	        ps.setString(1, commCd);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                next = rs.getInt("nextNo"); // SELECT ... AS nextNo 로 가져옴
	            }
	        }
	    } catch (Exception e) {
	        logger.error("nextNumber() error, commCd={}", commCd, e);
	    }

	    return next;
	}

	
	//게시판 등록
	public int insertBoard(BoardDTO dto) {
	    int r = 0;
	    try {
	        conn = getConnection();
	        psmt = conn.prepareStatement(Sql.INSERT_BOARD);
	        psmt.setString(1, dto.getComm_cd());
	        psmt.setInt(2, dto.getNumber());
	        psmt.setString(3, dto.getTitle());
	        psmt.setString(4, dto.getContent());
	        psmt.setString(5, dto.getWriter());
	        r = psmt.executeUpdate();
	    }catch (Exception e) {
	        logger.error(e.getMessage(), e); 	
	    }
	    return r;
	}

	public void insert() {}
	public void update() {}
	public void delete() {}
}
	