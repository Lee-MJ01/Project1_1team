package dao;

import dto.ProfessorDTO;
import util.DBHelper;
import util.PageResult;
import util.Sql;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProfessorDAO extends DBHelper {

    private static final ProfessorDAO INSTANCE = new ProfessorDAO();
    public static ProfessorDAO getInstance(){ return INSTANCE; }
    private ProfessorDAO(){}

    // 등록
    public int insert(ProfessorDTO d){
        int result = 0;
        PreparedStatement ps = null;
        try{
            conn = getConnection();
            ps = conn.prepareStatement(Sql.INSERT_PROFESSOR);
            int i = 1;
            ps.setInt(i++,    d.getProf_id());          // p_code
            ps.setString(i++, d.getDivision());         // nation
            ps.setString(i++, d.getName());             // name_ko
            ps.setString(i++, d.getE_name());           // name_en
            ps.setString(i++, d.getGender());           // gender
            ps.setString(i++, d.getResident_number());  // jumin
            ps.setString(i++, d.getPhone());            // hp
            ps.setString(i++, d.getEmail());            // email
            ps.setString(i++, d.getZip());              // addr_code
            ps.setString(i++, d.getAddr1());            // addr
            ps.setString(i++, d.getAddr2());            // addr_detail
            ps.setInt(i++,    d.getDept_id());          // dept_id
            ps.setString(i++, d.getHire_date());        // hire_date
            ps.setString(i++, d.getStatus());           // status
            ps.setString(i++, d.getGraduated_univ());   // univ
            ps.setString(i++, d.getGraduation_date());  // graduate_date
            ps.setString(i++, d.getDegree());           // degree

            result = ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{ if(ps!=null) ps.close(); }catch(Exception ignore){}
            try{ closeAll(); }catch(Exception ignore){}
        }
        return result;
    }



    public int nextProfessorSeq(int year, int deptId){
        PreparedStatement ps = null;
        ResultSet rs = null;
        int seq = 0;
        try{
            conn = getConnection();
            ps = conn.prepareStatement(Sql.UPSERT_PROFESSOR_SEQ);
            ps.setInt(1, year);
            ps.setInt(2, deptId);
            ps.executeUpdate();
            if(ps!=null) ps.close();

            ps = conn.prepareStatement(Sql.SELECT_LAST_INSERT_ID);
            rs = ps.executeQuery();
            if(rs.next()) seq = rs.getInt(1);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{ if(rs!=null) rs.close(); }catch(Exception ignore){}
            try{ if(ps!=null) ps.close(); }catch(Exception ignore){}
            try{ closeAll(); }catch(Exception ignore){}
        }
        return seq;
    }

    // 단건
    public ProfessorDTO selectOne(int pcode){
        ProfessorDTO d = null;
        PreparedStatement ps = null; ResultSet rs = null;
        try{
            conn = getConnection();
            ps = conn.prepareStatement(Sql.SELECT_PROFESSOR);
            ps.setInt(1, pcode);
            rs = ps.executeQuery();
            if(rs.next()){
                d = mapDetail(rs);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{ if(rs!=null) rs.close(); }catch(Exception ignore){}
            try{ if(ps!=null) ps.close(); }catch(Exception ignore){}
            try{ closeAll(); }catch(Exception ignore){}
        }
        return d;
    }

    // 검색 + 페이지
    public PageResult<ProfessorDTO> selectPage(String cond, String kw, int page, int size){
        List<ProfessorDTO> list = new ArrayList<>();
        int total = 0;

        String where = "";
        List<Object> params = new ArrayList<>();

        Map<String,String> COL = Map.of(
            "prof_id",   "p.p_code",
            "name",      "p.name_ko",
            "phone",     "p.hp",
            "email",     "p.email",
            "dept",      "d.dept_name",
            "degree",    "p.degree",
            "status",    "p.status",
            "hire_date", "p.hire_date"
        );
        if(cond != null && kw != null && !kw.isBlank() && COL.containsKey(cond)){
            where = " WHERE " + COL.get(cond) + " LIKE ? ";
            params.add("%" + kw.trim() + "%");
        }

        PreparedStatement ps = null; ResultSet rs = null;
        try{
            conn = getConnection();

            // count
            ps = conn.prepareStatement(String.format(Sql.SELECT_PROFESSOR_LIST_COUNT, where));
            for(int i=0;i<params.size();i++) ps.setObject(i+1, params.get(i));
            rs = ps.executeQuery();
            if(rs.next()) total = rs.getInt(1);
            rs.close(); ps.close();

            // rows
            ps = conn.prepareStatement(String.format(Sql.SELECT_PROFESSOR_LIST_MYSQL, where));
            int idx = 1;
            for(Object p : params) ps.setObject(idx++, p);
            int offset = Math.max(page,1);
            offset = (offset-1) * size;
            ps.setInt(idx++, size);
            ps.setInt(idx,   offset);

            rs = ps.executeQuery();
            while(rs.next()){
                ProfessorDTO row = new ProfessorDTO();
                int i=1;
                row.setProf_id(rs.getInt(i++));     // p_code
                row.setName(rs.getString(i++));     // name_ko
                row.setPhone(rs.getString(i++));    // hp
                row.setEmail(rs.getString(i++));
                row.setDept_name(rs.getString(i++));
                row.setDegree(rs.getString(i++));
                row.setStatus(rs.getString(i++));
                row.setHire_date(rs.getString(i++));
                list.add(row);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{ if(rs!=null) rs.close(); }catch(Exception ignore){}
            try{ if(ps!=null) ps.close(); }catch(Exception ignore){}
            try{ closeAll(); }catch(Exception ignore){}
        }
        return new PageResult<>(list, Math.max(page,1), size, total, 5);
    }

    private ProfessorDTO mapDetail(ResultSet rs) throws Exception {
        ProfessorDTO d = new ProfessorDTO();
        int i = 1;
        d.setProf_id(rs.getInt(i++));
        d.setDivision(rs.getString(i++));
        d.setName(rs.getString(i++));
        d.setE_name(rs.getString(i++));
        d.setGender(rs.getString(i++));
        d.setResident_number(rs.getString(i++));
        d.setPhone(rs.getString(i++));
        d.setEmail(rs.getString(i++));
        d.setZip(rs.getString(i++));
        d.setAddr1(rs.getString(i++));
        d.setAddr2(rs.getString(i++));
        d.setDept_id(rs.getInt(i++));
        d.setHire_date(rs.getString(i++));
        d.setStatus(rs.getString(i++));
        d.setGraduated_univ(rs.getString(i++));
        d.setGraduation_date(rs.getString(i++));
        d.setDegree(rs.getString(i++));
        d.setDept_name(rs.getString(i++));
        return d;
    }
    
    public int findCodeByName(String profname) {
        String sql = "SELECT p_code FROM professor WHERE name_ko=?";
        int p_code = 0;
        try {
			conn= getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, profname);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				p_code = rs.getInt(1);
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return p_code;
    }

    
}
