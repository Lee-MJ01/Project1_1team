package controller.university.campuslife;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import dto.CafeteriaDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CafeteriaService;

@WebServlet("/campuslife/cafeteria.do")
public class CafeteriaPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CafeteriaService service = CafeteriaService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<CafeteriaDTO> dtoList = service.select_week_cafe();
		CafeteriaDTO dto = null; 
		
		dto = dtoList.get(0);
		
		
		Set<String> date = new LinkedHashSet<>();
		for(CafeteriaDTO d : dtoList) {
			date.add(d.getMeal_date());
		}
		List<String> weekDate = new ArrayList<String>(date);
		
		
		// 식단표 만들기
		Map<String, Map<String, List<String>>> cafeList = new LinkedHashMap<>();
		
		for(String s : weekDate) {
			cafeList.put(s, new LinkedHashMap<>());
		}
		
		for(CafeteriaDTO cafeDTO : dtoList) {
			cafeList.get(cafeDTO.getMeal_date())
					.computeIfAbsent(cafeDTO.getMeal_type(), k -> new ArrayList<>())
					.add(cafeDTO.getFood_name());
		}
		
		req.setAttribute("cafeList", cafeList);
		req.setAttribute("weekDate", weekDate);
		req.setAttribute("dto", dto);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/university/campuslife/cafeteria.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
