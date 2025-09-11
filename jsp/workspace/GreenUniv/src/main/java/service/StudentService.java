package service;

import java.util.List;
import java.util.Optional;

import dao.StudentDAO;
import dto.StudentDTO;
import dto.UserDTO;
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


    // 학번 발급
    public int issueStdId(String entryYear, int deptId) {
        return dao.issueStdId(entryYear, deptId);
    }
    
    /**
     * 학생 로그인 비즈니스 로직
     * @param stdId 학번
     * @param password 비밀번호 (주민번호)
     * @return UserDTO로 변환된 학생 정보 Optional
     */
    public Optional<UserDTO> login(String stdId, String password) {
        // DAO를 통해 학생 정보 조회
        Optional<StudentDTO> optStudent = dao.login(stdId, password);
        
        // 조회된 학생 정보가 있다면, 공용 UserDTO 객체로 변환하여 반환
        return optStudent.map(student -> {
            UserDTO user = new UserDTO();
            user.setUser_id(String.valueOf(student.getStd_id()));
            user.setUser_name(student.getName());
            user.setUser_role("STUDENT");
            return user;
        });
    }
}
