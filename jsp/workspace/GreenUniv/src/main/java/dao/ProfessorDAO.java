package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.ProfessorDTO;
import util.DBHelper;
import util.Sql;
import util.PageResult;

public class ProfessorDAO extends DBHelper {

    private static final ProfessorDAO INSTANCE = new ProfessorDAO();
    public static ProfessorDAO getInstance(){ return INSTANCE; }
    private ProfessorDAO(){}

    // 등록
    public int insert(ProfessorDTO d){
        int result = 0;
        try{
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.INSERT_PROFESSOR);
            int i = 1;
            psmt.setInt(i++,    d.getProf_id());
            psmt.setString(i++, d.getResident_number());
            psmt.setString(i++, d.getName());
            psmt.setString(i++, d.getE_name());
            psmt.setString(i++, d.getGender());
            psmt.setString(i++, d.getDivision());
            psmt.setString(i++, d.getPhone());
            psmt.setString(i++, d.getEmail());
            psmt.setString(i++, d.getZip());
            psmt.setString(i++, d.getAddr1());
            psmt.setString(i++, d.getAddr2());
            psmt.setString(i++, d.getGraduated_univ());
            psmt.setString(i++, d.getGraduation_date());  // 'YYYY-MM-DD'
            psmt.setString(i++, d.getMajor_field());
            psmt.setString(i++, d.getDegree());
            psmt.setInt(i++,    d.getDept_id());
            psmt.setString(i++, d.getHire_date());        // 'YYYY-MM-DD'
            result = psmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }

    // 단건
    public ProfessorDTO selectOne(int profId){
        ProfessorDTO d = null;
        try{
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_PROFESSOR);
            psmt.setInt(1, profId);
            rs = psmt.executeQuery();
            if(rs.next()){
                d = mapDetail(rs);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try { closeAll(); } catch (Exception ignore) {}
        }
        return d;
    }

    // 검색 + 페이지네이션
    // cond : prof_id | name | phone | email | dept | degree
    public PageResult<ProfessorDTO> selectPage(String cond, String kw, int page, int size){
        List<ProfessorDTO> list = new ArrayList<>();
        int total = 0;

        String where = "";
        List<Object> params = new ArrayList<>();

        // 화이트리스트(컬럼 매핑)
        java.util.Map<String,String> COL = java.util.Map.of(
            "prof_id", "p.prof_id",
            "name",    "p.name",
            "phone",   "p.phone",
            "email",   "p.email",
            "dept",    "d.dept_name",
            "degree",  "p.degree"
        );

        if(cond != null && kw != null && !kw.isBlank() && COL.containsKey(cond)){
            where = " WHERE " + COL.get(cond) + " LIKE ? ";
            params.add("%" + kw.trim() + "%");
        }

        PreparedStatement ps = null;
        ResultSet rs2 = null;

        try{
            conn = getConnection();

            // 1) count
            String cntSql = String.format(Sql.SELECT_PROFESSOR_LIST_COUNT, where);
            ps = conn.prepareStatement(cntSql);
            for(int i=0;i<params.size();i++) ps.setObject(i+1, params.get(i));
            rs2 = ps.executeQuery();
            if(rs2.next()) total = rs2.getInt(1);
            close(ps, rs2);

            // 2) page rows
            String pageSql = String.format(Sql.SELECT_PROFESSOR_LIST_MYSQL, where);
            ps = conn.prepareStatement(pageSql);
            int idx = 1;
            for(Object p : params) ps.setObject(idx++, p);
            int offset = Math.max(page,1);
            offset = (offset-1) * size;
            ps.setInt(idx++, size);
            ps.setInt(idx,   offset);

            rs2 = ps.executeQuery();
            while(rs2.next()){
                ProfessorDTO d = new ProfessorDTO();
                int i = 1;
                d.setProf_id(rs2.getInt(i++));
                d.setName(rs2.getString(i++));
                d.setPhone(rs2.getString(i++));
                d.setEmail(rs2.getString(i++));
                d.setDept_name(rs2.getString(i++));
                d.setDegree(rs2.getString(i++));
                d.setHire_date(rs2.getString(i++));
                list.add(d);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            close(ps, rs2);
            try { closeAll(); } catch (Exception ignore) {}
        }
        return new PageResult<>(list, Math.max(page,1), size, total, 5);
    }

    // 내부 유틸
    private ProfessorDTO mapDetail(ResultSet rs) throws Exception {
        ProfessorDTO d = new ProfessorDTO();
        int i = 1;
        d.setProf_id(rs.getInt(i++));
        d.setResident_number(rs.getString(i++));
        d.setName(rs.getString(i++));
        d.setE_name(rs.getString(i++));
        d.setGender(rs.getString(i++));
        d.setDivision(rs.getString(i++));
        d.setPhone(rs.getString(i++));
        d.setEmail(rs.getString(i++));
        d.setZip(rs.getString(i++));
        d.setAddr1(rs.getString(i++));
        d.setAddr2(rs.getString(i++));
        d.setGraduated_univ(rs.getString(i++));
        d.setGraduation_date(rs.getString(i++));
        d.setMajor_field(rs.getString(i++));
        d.setDegree(rs.getString(i++));
        d.setDept_id(rs.getInt(i++));
        d.setHire_date(rs.getString(i++));
        d.setDept_name(rs.getString(i++));
        return d;
    }

    private void close(PreparedStatement ps, ResultSet rs){
        try{ if(rs!=null) rs.close(); }catch(Exception ignore){}
        try{ if(ps!=null) ps.close(); }catch(Exception ignore){}
    }
}
