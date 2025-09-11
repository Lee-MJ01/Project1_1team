package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.MenuDTO;
import util.DBHelper;
import util.Sql;

public class MenuDAO extends DBHelper{
	 private static final MenuDAO INSTANCE = new MenuDAO();
	 public static MenuDAO getInstance() { return INSTANCE; }
	 private MenuDAO(){}
	 
	 private Logger logger = LoggerFactory.getLogger(this.getClass());


	 public List<MenuDTO> findParents() {
	        List<MenuDTO> list = new ArrayList<>();
	        try {
	            conn = getConnection();
	            psmt = conn.prepareStatement(Sql.SELECT_PARENTS);
	            rs = psmt.executeQuery();
	            while (rs.next()) {
	                list.add(new MenuDTO(rs.getString("comm_cd"), rs.getString("comm_nm")));
	            }
	            closeAll();
	        }catch (Exception e) {
				logger.error(e.getMessage());
	        }
	        return list;
	    }
	 
	 public List<MenuDTO> findAllChildrenOfParents() {
	        List<MenuDTO> list = new ArrayList<>();
	        try {
	            conn = getConnection();
	            psmt = conn.prepareStatement(Sql.SELECT_CHILDREN_ALL);
	            rs = psmt.executeQuery();
	            while (rs.next()) {
	                MenuDTO d = new MenuDTO(rs.getString("comm_cd"), rs.getString("comm_nm"));
	                d.setUp_comm_cd(rs.getString("up_comm_cd"));
	                list.add(d);
	            	}
	                closeAll();
		        }catch (Exception e) {
					logger.error(e.getMessage());
		        }
	        return list;
	 }
	 
}
