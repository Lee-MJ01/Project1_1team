package service;

import java.util.List;

import dao.StudentDAO;
import dto.StudentDTO;
import util.PageResult;

public enum StudentService {
    INSTANCE;

    private final StudentDAO dao = StudentDAO.getInstance();

    public int register(StudentDTO dto) { return dao.insert(dto); }
    public StudentDTO findOne(int stdId) { return dao.selectOne(stdId); }
    public List<StudentDTO> findAll() { return dao.selectAll(); }

    // 컨트롤러에서 호출하는 시그니처와 정확히 일치
    public PageResult<StudentDTO> findPage(String cond, String kw, int page, int size) {
        return dao.selectPage(cond, kw, page, size);
    }
}
