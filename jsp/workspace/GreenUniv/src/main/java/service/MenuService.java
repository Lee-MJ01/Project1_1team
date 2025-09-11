package service;

import java.util.List;

import dao.MenuDAO;
import dto.MenuDTO;

public enum MenuService {
    INSTANCE;
    private final MenuDAO dao = MenuDAO.getInstance();

    public List<MenuDTO> parents()   { 
		List<MenuDTO> dtoList = dao.findParents(); 
    	return dtoList ;
    }
    public List<MenuDTO> childrenAll(){ 
		List<MenuDTO> dtoList = dao.findAllChildrenOfParents(); 
    	return dtoList; }
}
