package service;

import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;

import dao.CafeteriaDAO;
import dto.CafeteriaDTO;
import util.Sql;

public enum CafeteriaService {
	INSTANCE;
	
	private CafeteriaDAO dao = CafeteriaDAO.getInstance();
	
	public List<CafeteriaDTO> select_week_cafe() {
		List<CafeteriaDTO> dtoList = dao.select_week_cafe();
		
		return dtoList;
	}

}
