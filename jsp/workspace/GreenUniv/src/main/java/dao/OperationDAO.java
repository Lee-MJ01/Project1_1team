package dao;

import config.DB;
import dto.*;

import java.sql.*;
import java.util.*;

public class OperationDAO {
    private static final OperationDAO INSTANCE = new OperationDAO();
    public static OperationDAO getInstance(){ return INSTANCE; }
    private OperationDAO(){}

    // ===== (A) 상단 숫자 모음 =====
    public OverviewStatsDTO fetchOverviewStats(int year, String semester) {
        OverviewStatsDTO d = new OverviewStatsDTO();

        String qDept   = "SELECT COUNT(*) FROM department";
        String qCourse = "SELECT COUNT(*) FROM course WHERE year=? AND semester=?";
        String qProf   = "SELECT COUNT(*) FROM professor";
        String qStaff  = "SELECT COUNT(*) FROM users WHERE user_role IN ('STAFF','ADMIN')";
        String qActive = "SELECT COUNT(*) FROM student WHERE status='재학'";
        String qLeave  = "SELECT COUNT(*) FROM student WHERE status='휴학'";
        String qGrad   = "SELECT COUNT(*) FROM student WHERE status='대학원'";
        String qAlumni = "SELECT COUNT(*) FROM student WHERE status='졸업'";

        try (Connection con = DB.getConnection()) {
            d.deptCnt   = scalar(con, qDept);
            d.courseCnt = scalar(con, qCourse, ps -> { ps.setInt(1, year); ps.setString(2, semester); });
            d.profCnt   = scalar(con, qProf);
            d.staffCnt  = scalar(con, qStaff);
            d.stuActive = scalar(con, qActive);
            d.stuLeave  = scalar(con, qLeave);
            d.stuGrad   = scalar(con, qGrad);
            d.alumni    = scalar(con, qAlumni);
        } catch (Exception e) { throw new RuntimeException(e); }

        return d;
    }

    // ===== (B) 교육 운영 현황 리스트 =====
    public List<CourseOverviewDTO> fetchCourseOverview(int year, String semester) {
        String sql =
            "SELECT d.dept_name AS dept_name, c.crs_cd, " +
            "       COALESCE(c.crs_name, c.crs_desc) AS crs_name, " +
            "       CONCAT(c.year, '학년') AS grade_label, " +
            "       p.name_ko AS prof_name, c.division, c.credit, c.crs_room, c.capacity, " +
            "       COALESCE(enr.enrolled, 0) AS enrolled, " +
            "       ROUND(CASE WHEN c.capacity>0 THEN COALESCE(enr.enrolled,0)/c.capacity*100 ELSE 0 END) AS rate_pct " +
            "FROM course c " +
            "JOIN department d ON d.dept_id = c.dept_id " +
            "LEFT JOIN professor p ON p.p_code = c.p_code " +
            "LEFT JOIN ( " +
            "  SELECT crs_cd, COUNT(*) AS enrolled " +
            "  FROM enrollment WHERE year=? AND semester=? GROUP BY crs_cd " +
            ") enr ON enr.crs_cd = c.crs_cd " +
            "WHERE c.year=? AND c.semester=? " +
            "ORDER BY d.dept_name, c.crs_cd " +
            "LIMIT 100";

        List<CourseOverviewDTO> list = new ArrayList<>();
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year); ps.setString(2, semester);
            ps.setInt(3, year); ps.setString(4, semester);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CourseOverviewDTO r = new CourseOverviewDTO();
                    r.deptName  = rs.getString("dept_name");
                    r.crsCd     = rs.getString("crs_cd");
                    r.crsName   = rs.getString("crs_name");
                    r.gradeLabel= rs.getString("grade_label");
                    r.profName  = rs.getString("prof_name");
                    r.division  = rs.getString("division");
                    r.credit    = rs.getInt("credit");
                    r.room      = rs.getString("crs_room");
                    r.capacity  = rs.getInt("capacity");
                    r.enrolled  = rs.getInt("enrolled");
                    r.ratePct   = rs.getInt("rate_pct");
                    r.enrolledOfCapacity = r.enrolled + "/" + r.capacity;
                    list.add(r);
                }
            }
        } catch (Exception e) { throw new RuntimeException(e); }
        return list;
    }

    // ===== (C) 학년별 학생 현황 =====
    public List<ByGradeDTO> fetchByGrade(int year, String term) {
        String sql =
            "SELECT CONCAT(sr.grade,'학년') AS grade_label, " +
            "       SUM(CASE WHEN s.status='재학' THEN 1 ELSE 0 END) AS active_cnt, " +
            "       SUM(CASE WHEN s.status='휴학' THEN 1 ELSE 0 END) AS leave_cnt, " +
            "       COUNT(*) AS total_cnt " +
            "FROM student_records sr " +
            "JOIN student s ON s.std_id = sr.std_id " +
            "WHERE sr.year=? AND sr.term=? " +
            "GROUP BY sr.grade " +
            "ORDER BY sr.grade";
        List<ByGradeDTO> list = new ArrayList<>();
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, year); ps.setString(2, term);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ByGradeDTO r = new ByGradeDTO();
                    r.gradeLabel = rs.getString("grade_label");
                    r.activeCnt  = rs.getInt("active_cnt");
                    r.leaveCnt   = rs.getInt("leave_cnt");
                    r.totalCnt   = rs.getInt("total_cnt");
                    list.add(r);
                }
            }
        } catch (Exception e) { throw new RuntimeException(e); }
        return list;
    }

    // ===== (D) 학과별 학생 현황 =====
    public List<ByDeptDTO> fetchByDept() {
        String sql =
            "SELECT d.dept_name, " +
            "       SUM(CASE WHEN s.status='재학' THEN 1 ELSE 0 END) AS active_cnt, " +
            "       SUM(CASE WHEN s.status='휴학' THEN 1 ELSE 0 END) AS leave_cnt, " +
            "       COUNT(*) AS total_cnt " +
            "FROM student s " +
            "JOIN department d ON d.dept_id = s.dept_id " +
            "GROUP BY d.dept_id, d.dept_name " +
            "ORDER BY d.dept_name";
        List<ByDeptDTO> list = new ArrayList<>();
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ByDeptDTO r = new ByDeptDTO();
                r.deptName = rs.getString("dept_name");
                r.activeCnt= rs.getInt("active_cnt");
                r.leaveCnt = rs.getInt("leave_cnt");
                r.totalCnt = rs.getInt("total_cnt");
                list.add(r);
            }
        } catch (Exception e) { throw new RuntimeException(e); }
        return list;
    }

    // ===== (E) 게시판 =====
    public List<BoardRowDTO> fetchAcademicNotices(int limit) {
        String sql =
            "SELECT Number AS no, title, writer, DATE_FORMAT(w_date,'%y.%m.%d') AS wdate " +
            "FROM board WHERE comm_cd='ACADEMIC_NOTICE' " +
            "ORDER BY Number DESC LIMIT ?";
        return fetchBoardList(sql, limit, false);
    }

    public List<BoardRowDTO> fetchAdmissionQna(int limit) {
        String sql =
            "SELECT Number AS no, title, '' AS writer, DATE_FORMAT(w_date,'%y.%m.%d') AS wdate, " +
            "       CASE WHEN view_count IS NOT NULL THEN '답변완료' ELSE '답변대기' END AS status " +
            "FROM board WHERE comm_cd='ADMISSION_QNA' " +
            "ORDER BY Number DESC LIMIT ?";
        return fetchBoardList(sql, limit, true);
    }

    // ===== helpers =====
    private int scalar(Connection con, String sql) {
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            rs.next(); return rs.getInt(1);
        } catch (Exception e) { throw new RuntimeException(e); }
    }

    private int scalar(Connection con, String sql, SQLConsumer<PreparedStatement> binder) {
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            binder.accept(ps);
            try (ResultSet rs = ps.executeQuery()) {
                rs.next(); return rs.getInt(1);
            }
        } catch (Exception e) { throw new RuntimeException(e); }
    }

    private List<BoardRowDTO> fetchBoardList(String sql, int limit, boolean hasStatus) {
        List<BoardRowDTO> list = new ArrayList<>();
        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BoardRowDTO r = new BoardRowDTO();
                    r.no     = rs.getInt("no");
                    r.title  = rs.getString("title");
                    r.writer = safeGet(rs, "writer");
                    r.wdate  = rs.getString("wdate");
                    if (hasStatus) r.status = safeGet(rs, "status");
                    list.add(r);
                }
            }
        } catch (Exception e) { throw new RuntimeException(e); }
        return list;
    }

    private String safeGet(ResultSet rs, String col) {
        try { return rs.getString(col); } catch (SQLException e) { return ""; }
    }

    @FunctionalInterface
    interface SQLConsumer<T> { void accept(T t) throws Exception; }
}
