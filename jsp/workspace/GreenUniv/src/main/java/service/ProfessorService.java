package service;

import dao.ProfessorDAO;
import dto.ProfessorDTO;
import util.PageResult;

public enum ProfessorService {
    INSTANCE;

    private final ProfessorDAO dao = ProfessorDAO.getInstance();

    public int register(ProfessorDTO dto){ return dao.insert(dto); }
    public ProfessorDTO findOne(int profId){ return dao.selectOne(profId); }
    public PageResult<ProfessorDTO> findPage(String cond, String kw, int page, int size){
        return dao.selectPage(cond, kw, page, size);
    }
<<<<<<< HEAD
    public int findCodeByName(String profName) {
        return dao.findCodeByName(profName);
    }
=======
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
}
