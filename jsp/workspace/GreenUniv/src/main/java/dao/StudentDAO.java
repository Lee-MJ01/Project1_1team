package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.StudentDTO;
import util.DBHelper;
import util.Sql;

public class StudentDAO extends DBHelper {

    private static final StudentDAO INSTANCE = new StudentDAO();
    public static StudentDAO getInstance() { return INSTANCE; }
    private StudentDAO() {}

    // 등록
    public int insert(StudentDTO d) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.INSERT_STUDENT);
            int i = 1;
            psmt.setInt(i++,    d.getStd_id());
            psmt.setString(i++, d.getResident_number());
            psmt.setString(i++, d.getName());
            psmt.setString(i++, d.getE_name());
            psmt.setString(i++, d.getGender());
            psmt.setString(i++, d.getDivision());
            psmt.setString(i++, d.getPhone());   // ← DTO의 phone → DB의 hp
            psmt.setString(i++, d.getEmail());
            psmt.setString(i++, d.getAddress());
            psmt.setString(i++, d.getEntryyear());
            psmt.setString(i++, d.getGraduationyear());
            psmt.setInt(i++,    d.getDept_id());
            psmt.setString(i++, d.getEntryterm());
            psmt.setString(i++, d.getEntrygrade());
            psmt.setString(i++, d.getAdvisor());
            psmt.setString(i++, d.getStatus());
            result = psmt.executeUpdate();
            closeAll();
        } catch (Exception e) {
            throw new RuntimeException("Student insert failed", e);
        }
        return result;
    }

    // 학번 발급
    public int issueStdId(String entryYear, int deptId) {
        int seq = 0;
        try {
            conn = getConnection();

            try (PreparedStatement ps = conn.prepareStatement(Sql.UPSERT_STUDENT_SEQ)) {
                ps.setString(1, entryYear);
                ps.setInt(2, deptId);
                ps.executeUpdate();
            }
            try (Statement s = conn.createStatement();
                 ResultSet r = s.executeQuery(Sql.SELECT_LAST_INSERT_ID)) {
                if (r.next()) seq = r.getInt(1);
            }

            String id = entryYear + String.format("%03d", deptId) + String.format("%03d", seq);
            return Integer.parseInt(id);
        } catch (Exception e) {
            throw new RuntimeException("Issue std_id failed", e);
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
    }

    // 단건
    public StudentDTO selectOne(int stdId) {
        StudentDTO d = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_STUDENT);
            psmt.setInt(1, stdId);
            rs = psmt.executeQuery();
            if (rs.next()) {
                d = new StudentDTO();
                int i = 1;
                d.setStd_id(rs.getInt(i++));
                d.setResident_number(rs.getString(i++));
                d.setName(rs.getString(i++));
                d.setE_name(rs.getString(i++));
                d.setGender(rs.getString(i++));
                d.setDivision(rs.getString(i++));
                d.setPhone(rs.getString(i++));     // hp → DTO.phone
                d.setEmail(rs.getString(i++));
                d.setAddress(rs.getString(i++));
                d.setEntryyear(rs.getString(i++));
                d.setGraduationyear(rs.getString(i++));
                d.setDept_id(rs.getInt(i++));
                d.setEntryterm(rs.getString(i++));
                d.setEntrygrade(rs.getString(i++));
                d.setAdvisor(rs.getString(i++));
                d.setStatus(rs.getString(i++));
            }
            closeAll();
        } catch (Exception e) {
            throw new RuntimeException("Student selectOne failed", e);
        }
        return d;
    }

    // 전체 목록
    public List<StudentDTO> selectAll() {
        List<StudentDTO> list = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(Sql.SELECT_STUDENT_ALL_SIMPLE);
            while (rs.next()) {
                StudentDTO d = new StudentDTO();
                int i = 1;
                d.setStd_id(rs.getInt(i++));
                d.setName(rs.getString(i++));
                d.setResident_number(rs.getString(i++));
                d.setPhone(rs.getString(i++));
                d.setEmail(rs.getString(i++));
                d.setDept_id(rs.getInt(i++));
                d.setEntrygrade(rs.getString(i++));
                d.setEntryterm(rs.getString(i++));
                d.setStatus(rs.getString(i++));
                list.add(d);
            }
            closeAll();
        } catch (Exception e) {
            throw new RuntimeException("Student selectAll failed", e);
        }
        return list;
    }

    // 검색 컬럼 화이트리스트
    private static final java.util.Map<String,String> COL = java.util.Map.of(
        "std_id",     "s.std_id",
        "name",       "s.name",
        "phone",      "s.hp",        // 검색조건 'phone' → 실제 컬럼 s.hp
        "email",      "s.email",
        "dept",       "d.dept_name",
        "entrygrade", "s.entry_grade",
        "entryterm",  "s.entry_term",
        "status",     "s.status"
    );

    // 페이징 목록
    public util.PageResult<dto.StudentDTO> selectPage(String cond, String kw, int page, int size) {
        java.util.List<dto.StudentDTO> list = new java.util.ArrayList<>();
        int total = 0;

        String where = "";
        java.util.List<Object> params = new java.util.ArrayList<>();
        if (cond != null && kw != null && !kw.isBlank() && COL.containsKey(cond)) {
            where = " WHERE " + COL.get(cond) + " LIKE ? ";
            params.add("%" + kw.trim() + "%");
        }

        PreparedStatement ps = null;
        ResultSet rs2 = null;

        try {
            conn = getConnection();

            String cntSql = String.format(Sql.SELECT_STUDENT_LIST_COUNT, where);
            ps = conn.prepareStatement(cntSql);
            for (int i=0;i<params.size();i++) ps.setObject(i+1, params.get(i));
            rs2 = ps.executeQuery();
            if (rs2.next()) total = rs2.getInt(1);
            close(ps, rs2);

            String pageSql = String.format(Sql.SELECT_STUDENT_LIST_MYSQL, where);
            ps = conn.prepareStatement(pageSql);

            int idx = 1;
            for (Object p : params) ps.setObject(idx++, p);

            int offset = Math.max(page,1) - 1; offset *= size;
            ps.setInt(idx++, size);
            ps.setInt(idx,   offset);

            rs2 = ps.executeQuery();
            while (rs2.next()) {
                StudentDTO d = new StudentDTO();
                int i = 1;
                d.setStd_id(rs2.getInt(i++));
                d.setName(rs2.getString(i++));
                d.setResident_number(rs2.getString(i++));
                d.setPhone(rs2.getString(i++));
                d.setEmail(rs2.getString(i++));
                d.setDept_name(rs2.getString(i++));
                d.setEntrygrade(rs2.getString(i++));
                d.setEntryterm(rs2.getString(i++));
                d.setStatus(rs2.getString(i++));
                list.add(d);
            }
        } catch (Exception e) {
            throw new RuntimeException("Student selectPage failed", e);
        } finally {
            close(ps, rs2);
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return new util.PageResult<>(list, Math.max(page,1), size, total, 5);
    }

    private void close(PreparedStatement ps, ResultSet rs) {
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (ps != null) ps.close(); } catch (Exception ignore) {}
    }
}
