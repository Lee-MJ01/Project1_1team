package dao;

import dto.ProfessorDTO;
import util.DBHelper;
import util.PageResult;

import java.sql.*;
import java.util.*;

public class ProfessorDAO extends DBHelper {

    private static final ProfessorDAO INSTANCE = new ProfessorDAO();
    public static ProfessorDAO getInstance(){ return INSTANCE; }
    private ProfessorDAO(){}

    // INSERT는 17컬럼( degree 포함 )으로 고정
    private static final String INSERT_SQL =
        "INSERT INTO professor (" +
        " p_code, nation, name_ko, name_en, gender, jumin, hp, email," +
        " addr_code, addr, addr_detail, dept_id, hire_date, status," +
        " univ, graduate_date, degree" +
        ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

    /** 등록 */
    public int insert(ProfessorDTO d){
        try (Connection con = connOrThrow();
             PreparedStatement ps = con.prepareStatement(INSERT_SQL)) {

            int i = 1;
            ps.setInt(i++,    d.getProf_id());               // p_code
            setNullable(ps, i++, d.getDivision());           // nation
            setNullable(ps, i++, d.getName());               // name_ko
            setNullable(ps, i++, d.getE_name());             // name_en
            setNullable(ps, i++, d.getGender());             // gender
            setNullable(ps, i++, d.getResident_number());    // jumin
            setNullable(ps, i++, d.getPhone());              // hp
            setNullable(ps, i++, d.getEmail());              // email
            setNullableInt(ps, i++, d.getZip());             // addr_code (INT, nullable)
            setNullable(ps, i++, d.getAddr1());              // addr
            setNullable(ps, i++, d.getAddr2());              // addr_detail
            ps.setInt(i++,    d.getDept_id());               // dept_id
            setNullable(ps, i++, d.getHire_date());          // hire_date
            setNullable(ps, i++, d.getStatus());             // status
            setNullable(ps, i++, d.getGraduated_univ());     // univ
            setNullable(ps, i++, d.getGraduation_date());    // graduate_date
            setNullable(ps, i++, d.getDegree());             // degree

            return ps.executeUpdate();

        } catch (SQLException e) {
            System.err.printf("[ProfessorDAO.insert] SQLState=%s, ErrorCode=%d, Message=%s%n",
                    e.getSQLState(), e.getErrorCode(), e.getMessage());
            throw new RuntimeException("Professor insert failed", e);
        }
    }

    /** 연도+학과 prefix로 professor 테이블에서 다음 순번 계산(별도 seq 테이블 불필요) */
    public int nextProfessorSeq(int year, int deptId) {
        final int dept3 = Math.abs(deptId) % 1000;
        final int base  = year * 1_000_000 + dept3 * 1_000;
        final int upper = base + 999;
        final String sql = "SELECT MAX(p_code) FROM professor WHERE p_code BETWEEN ? AND ?";

        try (Connection con = connOrThrow();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, base);
            ps.setInt(2, upper);

            try (ResultSet rs = ps.executeQuery()) {
                int last = 0;
                if (rs.next()) last = rs.getInt(1);
                if (rs.wasNull()) last = 0;
                return (last == 0) ? 1 : (last - base) + 1;
            }

        } catch (SQLException e) {
            System.err.printf("[ProfessorDAO.nextProfessorSeq] SQLState=%s, ErrorCode=%d, Message=%s%n",
                    e.getSQLState(), e.getErrorCode(), e.getMessage());
            throw new RuntimeException("Professor next seq failed", e);
        }
    }

    /** 단건 조회(상세) */
    public ProfessorDTO selectOne(int pcode){
        final String sql =
            "SELECT p.p_code, p.nation, p.name_ko, p.name_en, p.gender, p.jumin, p.hp, p.email," +
            "       p.addr_code, p.addr, p.addr_detail, p.dept_id, p.hire_date, p.status," +
            "       p.univ, p.graduate_date, p.degree, d.dept_name " +
            "FROM professor p LEFT JOIN department d ON d.dept_id = p.dept_id WHERE p.p_code=?";

        try (Connection con = connOrThrow();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, pcode);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                return mapDetail(rs);
            }

        } catch (SQLException e) {
            System.err.printf("[ProfessorDAO.selectOne] SQLState=%s, ErrorCode=%d, Message=%s%n",
                    e.getSQLState(), e.getErrorCode(), e.getMessage());
            throw new RuntimeException("Professor selectOne failed", e);
        }
    }

    /** 검색 + 페이징 목록 */
    public PageResult<ProfessorDTO> selectPage(String cond, String kw, int page, int size){
        List<ProfessorDTO> list = new ArrayList<>();
        int total = 0;

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

        String where = "";
        List<Object> params = new ArrayList<>();
        if (cond != null && kw != null && !kw.isBlank() && COL.containsKey(cond)) {
            where = " WHERE " + COL.get(cond) + " LIKE ? ";
            params.add("%" + kw.trim() + "%");
        }

        String countSql =
            "SELECT COUNT(*) FROM professor p LEFT JOIN department d ON d.dept_id = p.dept_id" + where;
        String listSql =
            "SELECT p.p_code, p.name_ko, p.hp, p.email, d.dept_name, p.degree, p.status, p.hire_date " +
            "FROM professor p LEFT JOIN department d ON d.dept_id = p.dept_id" + where +
            " ORDER BY p.p_code DESC LIMIT ? OFFSET ?";

        try (Connection con = connOrThrow()) {
            // count
            try (PreparedStatement ps = con.prepareStatement(countSql)) {
                for (int i=0;i<params.size();i++) ps.setObject(i+1, params.get(i));
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) total = rs.getInt(1);
                }
            }
            // rows
            try (PreparedStatement ps = con.prepareStatement(listSql)) {
                int idx = 1;
                for (Object p : params) ps.setObject(idx++, p);
                int offset = Math.max(page,1);
                offset = (offset-1) * size;
                ps.setInt(idx++, size);
                ps.setInt(idx,   offset);

                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        ProfessorDTO row = new ProfessorDTO();
                        int i=1;
                        row.setProf_id(rs.getInt(i++));
                        row.setName(rs.getString(i++));
                        row.setPhone(rs.getString(i++));
                        row.setEmail(rs.getString(i++));
                        row.setDept_name(rs.getString(i++));
                        row.setDegree(rs.getString(i++));
                        row.setStatus(rs.getString(i++));
                        row.setHire_date(rs.getString(i++));
                        list.add(row);
                    }
                }
            }
        } catch (SQLException e) {
            System.err.printf("[ProfessorDAO.selectPage] SQLState=%s, ErrorCode=%d, Message=%s%n",
                    e.getSQLState(), e.getErrorCode(), e.getMessage());
            throw new RuntimeException("Professor selectPage failed", e);
        }
        return new PageResult<>(list, Math.max(page,1), size, total, 5);
    }

    // ---------- 내부 유틸 ----------

    private ProfessorDTO mapDetail(ResultSet rs) throws SQLException {
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
        int zip = rs.getInt(i++); if (rs.wasNull()) d.setZip(null); else d.setZip(String.valueOf(zip));
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

    private void setNullable(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, Types.VARCHAR);
        else ps.setString(idx, v.trim());
    }
    private void setNullableInt(PreparedStatement ps, int idx, String v) throws SQLException {
        if (v == null || v.isBlank()) ps.setNull(idx, Types.INTEGER);
        else {
            try { ps.setInt(idx, Integer.parseInt(v.trim())); }
            catch (NumberFormatException nfe) { ps.setNull(idx, Types.INTEGER); }
        }
    }
    private Connection connOrThrow() throws SQLException {
        try { return getConnection(); } // DBHelper.getConnection()
        catch (javax.naming.NamingException ne) {
            throw new SQLException("JNDI lookup failed for DataSource 'jdbc/greendae1'", ne);
        }
    }
}
