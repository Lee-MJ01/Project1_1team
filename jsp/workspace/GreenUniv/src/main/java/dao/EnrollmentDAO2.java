package dao;

import java.sql.*;
import java.util.*;
import dto.EnrollmentDTO2;
import util.DBHelper;

public class EnrollmentDAO2 extends DBHelper {

    // 전체 수강신청 건수
    public int selectCountTotal() {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM enrollment";
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            if(rs.next()) total = rs.getInt(1);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
				closeAll();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        return total;
    }

    // 페이지네이션 적용 수강현황 조회
    public List<EnrollmentDTO2> selectEnrollments(int start, int size) {
        List<EnrollmentDTO2> list = new ArrayList<>();

        String sql = """
            SELECT c.year, c.semester,
                   s.std_id, s.name, s.entry_grade AS grade, d.dept_name,
                   c.crs_cd, c.crs_name, c.division, p.name_ko AS professor,
                   c.credit, e.r_date AS enroll_date
            FROM enrollment e
            JOIN student s   ON e.std_id = s.std_id
            JOIN course c    ON e.crs_cd = c.crs_cd
            JOIN professor p ON c.p_code = p.p_code
            JOIN department d ON s.dept_id = d.dept_id
            ORDER BY c.year DESC, c.semester DESC, s.std_id
            LIMIT ?, ?
        """;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, start);
            psmt.setInt(2, size);
            System.out.println(">>> 실행 SQL: " + psmt);  // ★ LIMIT 값 확인용
            rs = psmt.executeQuery();

            int rowCount = 0;
            while(rs.next()){
                EnrollmentDTO2 dto = new EnrollmentDTO2();
                dto.setYear(rs.getInt("year"));
                dto.setSemester(rs.getInt("semester"));
                dto.setStdId(rs.getString("std_id"));
                dto.setName(rs.getString("name"));
                dto.setGrade(rs.getInt("grade"));      
                dto.setDeptName(rs.getString("dept_name"));
                dto.setCrsCd(rs.getString("crs_cd"));
                dto.setCrsName(rs.getString("crs_name"));
                dto.setDivision(rs.getString("division"));
                dto.setProfessor(rs.getString("professor"));
                dto.setCredit(rs.getInt("credit"));    
                dto.setEnrollDate(rs.getString("enroll_date"));
                list.add(dto);

                // ★ 각 row 확인 로그
                System.out.printf("Row %d: %s / %s / %s%n", 
                                  ++rowCount, dto.getStdId(), dto.getCrsName(), dto.getEnrollDate());
            }

            System.out.println(">>> selectEnrollments 결과 row 수 = " + rowCount);

        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                closeAll();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

}
