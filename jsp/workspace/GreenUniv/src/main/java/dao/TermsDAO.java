package dao;

import java.util.List;

import dao.TermsDAO;
import dto.TermsDTO;
import util.Sql;
import util.DBHelper;

public class TermsDAO extends DBHelper {
	
	private final static TermsDAO INSTANCE = new TermsDAO();
	public static TermsDAO getInstance() {
		return INSTANCE;
	}	
	
	private TermsDAO() {}
	
	public void insert(TermsDTO dto) {
		
	}
	
	public TermsDTO select(int no) {
		
		TermsDTO dto = null;
		
		try {
			conn = getConnection();
			
			psmt = conn.prepareStatement(Sql.SELECT_TERMS);
			psmt.setInt(1, no);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new TermsDTO();
				dto.setNo(rs.getInt(1));
				dto.setTerms(rs.getString(2));
				dto.setPrivacy(rs.getString(3));
			}
			
			closeAll();
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return dto;
	}
	
	public List<TermsDTO> selectAll() {
		return null;
	}
	
	public void update(TermsDTO dto) {
		
	}
	
	public void delete(int no) {
		
	}
}
