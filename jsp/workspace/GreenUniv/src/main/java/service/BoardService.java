package service;

import java.util.ArrayList;
import java.util.List;

import dao.BoardDAO;
import dto.BoardDTO;
import util.Sql;

public enum BoardService {
	INSTANCE;
	
	private BoardDAO dao = BoardDAO.getInstance();
	
	// index에 보여지는 학사공지사항 select
	public List<BoardDTO> IndexAcademicsfindAll() {
		List<BoardDTO> dtoList = dao.IndexAcademicsSelectAll(); 
		return dtoList;
	}
	
	// 게시판 종류(comm_cd)에 따른 전체 게시글 수 조회
    public int selectCountNotices(String commCd) {
        return dao.selectCountNotices(commCd);
    }
    
    // 게시판 종류(comm_cd)에 따라 페이지 시작점부터 10개 게시글 조회
    public List<BoardDTO> selectNotices(String commCd, int limitStart) {
        return dao.selectNotices(commCd, limitStart);
    }
	
	// index에 보여지는 공지사항 select
	public List<BoardDTO> IndexCommunityfindAll() {
		List<BoardDTO> dtoList = dao.IndexCommunitySelectAll(); 
		return dtoList;
	}
	
	// index에 보여지는 공지사항 select
	public List<BoardDTO> IndexCommuNewsfindAll() {
		List<BoardDTO> dtoList = dao.IndexCommuNewsSelectAll(); 
		return dtoList;
	}
	
	//입학안내 공지사항 select
	public List<BoardDTO> admissionNoticeFindAll(){
		return dao.admissionNoticeSelectAll();
	}
	
	//입학안내 공지사항 뷰
	public BoardDTO FindAdmissionNoticeView(int number){
	    return dao.selectAdmissionNoticeView(number);
	}	
	//학사안내 공지사항 뷰
	public BoardDTO FindAcademicNoticeView(int number){
	    return dao.selectAcademicNoticeView(number);
	}	
	//커뮤니티 공지사항 뷰
	public BoardDTO FindCommunityNoticeView(int number){
	    return dao.selectCommunityNoticeView(number);
	}
	
	//입학안내 공지사항 select
	public List<BoardDTO> academicsNoticeFindAll(){
		return dao.academicsNoticeSelectAll();
	}
	
	//커뮤니티 공지사항 select
	public List<BoardDTO> communityNoticeFindAll(){
		return dao.communityNoticeSelectAll();

	}
	
	//커뮤니티 뉴스 및 칼럼
	public List<BoardDTO> communityNewsSelectAll(int page, int pageSize){
		return dao.communityNewsSelectAll(page, pageSize);
	}
	
//	//커뮤니티 공지사항 select
//	public List<BoardDTO> communitynewsFindAll(int page, int pageSize){
//		return dao.communityNewsSelectAll(page, pageSize);
//
//	}
//	
	//커뮤니티 취업공지상담? select
	public List<BoardDTO> communityjobsFindAll(int page, int pageSize){
		return dao.communityjobsSelectAll(page, pageSize);

	}
	//커뮤니티 게시판 select
	public List<BoardDTO> communityBoardFindAll(){
		return dao.communityBoardSelectAll();
	
	}

		
	//커뮤니티 게시판 select
	public List<BoardDTO> communityResourceFindAll(){
		return dao.communityResourceSelectAll();

	}
	
	//글쓰기
	public int write(BoardDTO dto) {
	    int newNo = dao.nextNumber(dto.getComm_cd());
	    dto.setNumber(newNo);
	    int r = dao.insertBoard(dto);
	    return r > 0 ? newNo : 0;
	}
	
}
