package service;

import dao.ProfessorDAO;
import dto.ProfessorDTO;
import util.PageResult;

public enum ProfessorService {
    INSTANCE;

    private final ProfessorDAO dao = ProfessorDAO.getInstance();

    public int register(ProfessorDTO dto){ return dao.insert(dto); }
    public ProfessorDTO findOne(int pcode){ return dao.selectOne(pcode); }
    public PageResult<ProfessorDTO> findPage(String cond, String kw, int page, int size){
        return dao.selectPage(cond, kw, page, size);
    }

    public int generateProfessorCode(int year, int deptId){
        int seq = dao.nextProfessorSeq(year, deptId);   
        int dept3 = Math.abs(deptId) % 1000;
        int seq3  = Math.abs(seq) % 1000;
        return year * 1_000_000 + dept3 * 1_000 + seq3;
    }
    
    public int findCodeByName(String profname) {
        return dao.findCodeByName(profname);
    }

    
}
