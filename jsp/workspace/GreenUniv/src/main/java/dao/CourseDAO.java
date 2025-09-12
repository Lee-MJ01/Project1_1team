package dao;

import dto.CourseDTO;
import dto.OperationOverviewDTO;
import util.DBHelper;
import util.Sql;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO extends DBHelper {

    // 싱글톤 패턴
    private static CourseDAO instance = new CourseDAO();
    public static CourseDAO getInstance() {
        return instance;
    }
    private CourseDAO() {}

    /** 강의 등록 */
    public int insert(CourseDTO dto) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.INSERT_COURSE);
            psmt.setInt(1,dto.getCrs_cd());
            psmt.setInt(2, dto.getDept_id());
            psmt.setInt(3, dto.getYear());
            psmt.setInt(4, dto.getSemester());
            psmt.setString(5, dto.getDivision());
            psmt.setString(6, dto.getCrs_name());
            psmt.setInt(7, dto.getP_code());
            psmt.setInt(8, dto.getCredit());
            psmt.setString(9, dto.getCrs_desc());
            psmt.setString(10, dto.getPeriod_start());
            psmt.setString(11, dto.getPeriod_end());
            psmt.setString(12, dto.getTime_start());
            psmt.setString(13, dto.getTime_end());
            psmt.setString(14, dto.getDays());
            psmt.setString(15, dto.getEval_method());
            psmt.setString(16, dto.getTextbook());
            psmt.setString(17, dto.getCrs_room());
            psmt.setInt(18, dto.getCapacity());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return result;
    }

    /** 강의 목록 조회 */
    public List<CourseDTO> selectAll() {
        List<CourseDTO> list = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT c.crs_cd, d.dept_name, c.year, c.division, c.crs_name, "
                  + "       p.name_ko, c.credit, c.days, c.time_start, c.time_end, "
                  + "       c.crs_room, c.capacity "
                  + "FROM course c "
                  + "JOIN professor p ON c.p_code = p.p_code "
                  + "JOIN department d ON c.dept_id = d.dept_id "
                  + "ORDER BY c.crs_cd DESC ");

            while (rs.next()) {
                CourseDTO dto = new CourseDTO();
                dto.setCrs_cd(rs.getInt("crs_cd"));
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setYear(rs.getInt("year"));
                dto.setSemester(rs.getInt("semester"));
                dto.setDivision(rs.getString("division"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setP_code(rs.getInt("p_code"));
                dto.setCredit(rs.getInt("credit"));
                dto.setCrs_desc(rs.getString("crs_desc"));
                dto.setPeriod_start(rs.getString("period_start"));
                dto.setPeriod_end(rs.getString("period_end"));
                dto.setTime_start(rs.getString("time_start"));
                dto.setTime_end(rs.getString("time_end"));
                dto.setDays(rs.getString("days"));
                dto.setEval_method(rs.getString("eval_method"));
                dto.setTextbook(rs.getString("textbook"));
                dto.setCrs_room(rs.getString("crs_room"));
                dto.setCapacity(rs.getInt("capacity"));
                dto.setDept_name(rs.getString("dept_name")); // 추가 필드
                dto.setName_ko(rs.getString("name_ko"));  // 추가 필드

                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        
        return list;
    }
    
    public List<CourseDTO> selectForLectureList() {
        List<CourseDTO> list = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT c.crs_cd, d.dept_name, c.year, c.division, c.crs_name, "
                  + "       p.name_ko, c.credit, c.days, c.time_start, c.time_end, "
                  + "       c.crs_room, c.capacity "
                  + "FROM course c "
                  + "JOIN professor p ON c.p_code = p.p_code "
                  + "JOIN department d ON c.dept_id = d.dept_id "
                  + "ORDER BY c.crs_cd DESC ");

            while (rs.next()) {
                CourseDTO dto = new CourseDTO();
                dto.setCrs_cd(rs.getInt("crs_cd"));
                dto.setDept_name(rs.getString("dept_name")); // JOIN 결과
                dto.setYear(rs.getInt("year"));
                dto.setDivision(rs.getString("division"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setName_ko(rs.getString("name_ko"));   // JOIN 결과
                dto.setCredit(rs.getInt("credit"));
                dto.setDays(rs.getString("days"));
                dto.setTime_start(rs.getString("time_start"));
                dto.setTime_end(rs.getString("time_end"));
                dto.setCrs_room(rs.getString("crs_room"));
                dto.setCapacity(rs.getInt("capacity"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        System.out.println(list);
        return list;
    }

    /** 단일 강의 조회 */
    public CourseDTO selectOne(int crs_cd) {
        CourseDTO dto = null;
        try {
            conn = getConnection();
            String sql = "SELECT * FROM course WHERE crs_cd = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, crs_cd);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto = new CourseDTO();
                dto.setCrs_cd(rs.getInt("crs_cd"));
                dto.setDept_id(rs.getInt("dept_id"));
                dto.setYear(rs.getInt("year"));
                dto.setSemester(rs.getInt("semester"));
                dto.setDivision(rs.getString("division"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setP_code(rs.getInt("p_code"));
                dto.setCredit(rs.getInt("credit"));
                dto.setCrs_desc(rs.getString("crs_desc"));
                dto.setPeriod_start(rs.getString("period_start"));
                dto.setPeriod_end(rs.getString("period_end"));
                dto.setTime_start(rs.getString("time_start"));
                dto.setTime_end(rs.getString("time_end"));
                dto.setDays(rs.getString("days"));
                dto.setEval_method(rs.getString("eval_method"));
                dto.setTextbook(rs.getString("textbook"));
                dto.setCrs_room(rs.getString("crs_room"));
                dto.setCapacity(rs.getInt("capacity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return dto;
    }

    /** 강의 수정 */
    public int update(CourseDTO dto) {

        return 0;
    }

    /** 강의 삭제 */
    public int delete(int crs_cd) {
        int result = 0;
        try {
            conn = getConnection();
            String sql = "DELETE FROM course WHERE crs_cd = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, crs_cd);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return result;
    }
    
    
    public int getNextSeq(int deptId, int year, int semester) {
        int seq = 1;
        String sql = "SELECT COUNT(*)+1 AS seq FROM course WHERE dept_id=? AND year=? AND semester=?";
        try {
           conn = getConnection();
           psmt = conn.prepareStatement(sql);
           psmt.setInt(1, deptId);
            psmt.setInt(2, year);
            psmt.setInt(3, semester);
            rs = psmt.executeQuery();
            if (rs.next()) {
                seq = rs.getInt("seq");
            }
        }
        catch (Exception e) {
           e.printStackTrace();
        }
        
        return seq;
    }
    
    
    
    ///페이지네이션
 // CourseDAO.java
    public List<CourseDTO> selectPaged(int offset, int pageSize) {
        List<CourseDTO> list = new ArrayList<>();
        String sql = "SELECT c.crs_cd, d.dept_name, c.year, c.division, c.crs_name, " +
                     "       p.name_ko, c.credit, c.days, c.time_start, c.time_end, " +
                     "       c.crs_room, c.capacity " +
                     "FROM course c " +
                     "JOIN professor p ON c.p_code = p.p_code " +
                     "JOIN department d ON c.dept_id = d.dept_id " +
                     "ORDER BY c.crs_cd DESC " +
                     "LIMIT ? OFFSET ?";

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, pageSize);
            psmt.setInt(2, offset);
            rs = psmt.executeQuery();

            while (rs.next()) {
                CourseDTO dto = new CourseDTO();
                dto.setCrs_cd(rs.getInt("crs_cd"));
                dto.setDept_name(rs.getString("dept_name"));
                dto.setYear(rs.getInt("year"));
                dto.setDivision(rs.getString("division"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setName_ko(rs.getString("name_ko"));
                dto.setCredit(rs.getInt("credit"));
                dto.setDays(rs.getString("days"));
                dto.setTime_start(rs.getString("time_start"));
                dto.setTime_end(rs.getString("time_end"));
                dto.setCrs_room(rs.getString("crs_room"));
                dto.setCapacity(rs.getInt("capacity"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return list;
    }

    // 전체 데이터 개수 조회
    public int countAll() {
        int total = 0;
        String sql = "SELECT COUNT(*) AS cnt FROM course";
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                total = rs.getInt("cnt");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return total;
    }

    //overview용 메서드
    public List<OperationOverviewDTO> selectOverviewPaged(int offset, int pageSize) {
        List<OperationOverviewDTO> list = new ArrayList<>();

        String sql = """
            SELECT d.dept_name,
                   c.crs_cd,
                   c.crs_name,
                   c.year,
                   p.name_ko AS professor,
                   c.division,
                   c.credit,
                   c.crs_room,
                   COUNT(e.std_id) AS enrolled,
                   c.capacity
            FROM course c
            JOIN department d ON c.dept_id = d.dept_id
            JOIN professor p ON c.p_code = p.p_code
            LEFT JOIN enrollment e ON c.crs_cd = e.crs_cd
            GROUP BY d.dept_name, c.crs_cd, c.crs_name, c.year,
                     p.name_ko, c.division, c.credit, c.crs_room, c.capacity
            ORDER BY d.dept_name, c.crs_cd
            LIMIT ? OFFSET ?
            """;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, pageSize);
            psmt.setInt(2, offset);
            rs = psmt.executeQuery();

            while (rs.next()) {
                OperationOverviewDTO dto = new OperationOverviewDTO();
                dto.setDeptName(rs.getString("dept_name"));
                dto.setCrsCd(rs.getInt("crs_cd"));
                dto.setCrsName(rs.getString("crs_name"));
                dto.setYear(rs.getInt("year"));
                dto.setProfessor(rs.getString("professor"));
                dto.setDivision(rs.getString("division"));
                dto.setCredit(rs.getInt("credit"));
                dto.setCrsRoom(rs.getString("crs_room"));
                dto.setEnrolled(rs.getInt("enrolled"));
                dto.setCapacity(rs.getInt("capacity"));

                int cap = dto.getCapacity();
                int enr = dto.getEnrolled();
                int rate = (cap > 0) ? (enr * 100 / cap) : 0;
                dto.setEnrollRate(rate);

                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return list;
    }


    
 // 총 강의 수
    public int countOverview() {
        String sql = "SELECT COUNT(DISTINCT c.crs_cd) AS total " +
                     "FROM course c";
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
        return 0;
    }



}
