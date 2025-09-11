package dao;

import dto.CourseDTO;
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
            rs = stmt.executeQuery("SELECT * FROM course ORDER BY crs_cd DESC");

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
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (SQLException ignore) {}
        }
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

    
}
