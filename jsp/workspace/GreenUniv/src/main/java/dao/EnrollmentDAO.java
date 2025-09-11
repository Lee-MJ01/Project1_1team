package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CourseDTO;
import dto.EnrolledCourseDTO;
import util.DBHelper;

public class EnrollmentDAO extends DBHelper {

    private static final EnrollmentDAO INSTANCE = new EnrollmentDAO();
    public static EnrollmentDAO getInstance() { return INSTANCE; }
    private EnrollmentDAO() {}
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 특정 학생의 특정 학기 수강신청 목록을 조회합니다.
     * @param stdId 학번
     * @param year 년도
     * @param semester 학기
     * @return 수강신청한 과목 DTO 리스트
     */
    public List<EnrolledCourseDTO> selectEnrolledCourses(int stdId, int year, int semester) {
        List<EnrolledCourseDTO> enrolledCourses = new ArrayList<>();
        
        // enrollment, course, professor 테이블을 조인하는 SQL
        String sql = "SELECT c.crs_cd, c.crs_name, c.division, c.credit, p.name_ko AS professor_name " +
                     "FROM enrollment e " +
                     "JOIN course c ON e.crs_cd = c.crs_cd " +
                     "LEFT JOIN professor p ON c.p_code = p.p_code " + // 담당교수가 없을 수도 있으므로 LEFT JOIN
                     "WHERE e.std_id = ? AND e.year = ? AND e.semester = ? " +
                     "ORDER BY c.crs_cd";

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, stdId);
            psmt.setInt(2, year);
            psmt.setInt(3, semester);
            rs = psmt.executeQuery();
            
            while(rs.next()) {
                EnrolledCourseDTO dto = new EnrolledCourseDTO();
                dto.setCrs_cd(rs.getString("crs_cd"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setDivision(rs.getString("division"));
                dto.setCredit(rs.getInt("credit"));
                dto.setProfessorName(rs.getString("professor_name"));
                enrolledCourses.add(dto);
            }
        } catch (Exception e) {
            logger.error("selectEnrolledCourses 오류: " + e.getMessage());
        } finally {
            try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return enrolledCourses;
    }
    
 // [추가] 전체 개설강좌 수 조회 (페이지네이션용)
    public int selectCountAllCourses(int year, int semester) {
        int total = 0;
        try {
            conn = getConnection();
            String sql = "SELECT COUNT(*) FROM course WHERE year = ? AND semester = ?";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, year);
            psmt.setInt(2, semester);
            rs = psmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (Exception e) {
            logger.error("selectCountAllCourses 오류: " + e.getMessage());
        } finally {
        	try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return total;
    }

    // [추가] 전체 개설강좌 목록 페이지별 조회
    public List<CourseDTO> selectAvailableCourses(int year, int semester, int offset) {
        List<CourseDTO> courses = new ArrayList<>();
        
        String sql = "SELECT c.crs_cd, c.crs_name, c.division, c.credit, c.year, c.capacity, " +
                     "d.dept_name, p.name_ko AS professor_name, " +
                     "(SELECT COUNT(*) FROM enrollment e WHERE e.crs_cd = c.crs_cd AND e.year = c.year AND e.semester = c.semester) AS enrolled_count " +
                     "FROM course c " +
                     "JOIN department d ON c.dept_id = d.dept_id " +
                     "LEFT JOIN professor p ON c.p_code = p.p_code " +
                     "WHERE c.year = ? AND c.semester = ? " +
                     "ORDER BY c.crs_cd LIMIT ?, 10";
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, year);
            psmt.setInt(2, semester);
            psmt.setInt(3, offset);
            rs = psmt.executeQuery();
            while(rs.next()) {
                CourseDTO dto = new CourseDTO();
                dto.setDept_name(rs.getString("dept_name"));
                dto.setDivision(rs.getString("division"));
                dto.setYear(rs.getInt("year"));
                dto.setCrs_cd(rs.getInt("crs_cd"));
                dto.setCrs_name(rs.getString("crs_name"));
                dto.setCredit(rs.getInt("credit"));
                dto.setProfessorName(rs.getString("professor_name"));
                dto.setEnrolledCount(rs.getInt("enrolled_count"));
                dto.setCapacity(rs.getInt("capacity"));
                courses.add(dto);
            }
        } catch (Exception e) {
            logger.error("selectAvailableCourses 오류: " + e.getMessage());
        } finally {
        	try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return courses;
    }

    // [추가] 수강신청 데이터 INSERT
    public int insertEnrollment(int stdId, int crsCd, int year, int semester) {
        int result = 0;
        try {
            conn = getConnection();
            String sql = "INSERT INTO enrollment (std_id, crs_cd, year, semester, r_date) VALUES (?, ?, ?, ?, NOW())";
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, stdId);
            psmt.setInt(2, crsCd);
            psmt.setInt(3, year);
            psmt.setInt(4, semester);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            logger.error("insertEnrollment 오류: " + e.getMessage());
        } finally {
        	try {
				closeAll();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
        return result;
    }
    

}