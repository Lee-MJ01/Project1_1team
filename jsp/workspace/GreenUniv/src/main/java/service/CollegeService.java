package service;

import java.util.List;
import dao.CollegeDAO;
import dto.CollegeDTO;

public enum CollegeService {
    INSTANCE;

    private CollegeDAO dao = CollegeDAO.getInstance();

    public int register(CollegeDTO dto) {
        return dao.insert(dto);
    }

    public CollegeDTO findOne(String college_name) {
        return dao.selectOne(college_name);
    }

    public List<CollegeDTO> findAll(int start) {
        return dao.selectAll(start);
    }

    public int modify(CollegeDTO dto) {
        return dao.update(dto);
    }

    public int remove(String college_name) {
        return dao.delete(college_name);
    }
}
