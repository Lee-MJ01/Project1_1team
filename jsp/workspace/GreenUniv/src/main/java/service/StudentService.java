package service;

import java.util.List;

import dao.StudentDAO;
import dto.StudentDTO;

public enum StudentService {
    INSTANCE;

    private final StudentDAO dao = StudentDAO.getInstance();

    public int register(StudentDTO dto) { return dao.insert(dto); }
    public StudentDTO findOne(int stdId) { return dao.selectOne(stdId); }
    public List<StudentDTO> findAll() { return dao.selectAll(); }
}
