package dao;

import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CafeteriaDTO;
import util.DBHelper;
import util.Sql;

public class CafeteriaDAO extends DBHelper{
	
	private static final CafeteriaDAO INSTANCE = new CafeteriaDAO();
	public static CafeteriaDAO getInstance() {
		return INSTANCE;
	}
	private CafeteriaDAO() {}
	
	private Logger logger = LoggerFactory.getLogger(getClass()); 
	
	public List<CafeteriaDTO> select_week_cafe() {
		List<CafeteriaDTO> dtoList = new ArrayList<CafeteriaDTO>();
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(Sql.SELECT_MEAL_FOOD_WEEK);
			
			// 오늘 날짜 구하기
			LocalDate today = LocalDate.now();
			
			// 이번 주 월요일 구하기
			LocalDate monday = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
			
			// 이번 주 월요일 구하기
			LocalDate friday = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.FRIDAY));
			
			psmt.setObject(1, monday);
			psmt.setObject(2, friday);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CafeteriaDTO dto = new CafeteriaDTO();
				dto.setFood_name(rs.getString(1));
				dto.setMeal_date(rs.getString(2));
				dto.setMeal_type(rs.getString(3));
				dto.setStart_date(monday.toString());
				dto.setEnd_date(friday.toString());
				dtoList.add(dto);
			}
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			try {
				closeAll();
			} catch (SQLException e) {
				logger.error(e.getMessage());
			}
		}
		
		return dtoList;
	}
	
	
}
