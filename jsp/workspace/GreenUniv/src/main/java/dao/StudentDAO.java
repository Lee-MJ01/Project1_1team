package dao;

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
            psmt.setString(i++, d.getPhone());
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
            e.printStackTrace();
        }
        return result;
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
                d.setPhone(rs.getString(i++));
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
            e.printStackTrace();
        }
        return d;
    }

    // 목록 – 페이지네이션 없이 전체
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
            e.printStackTrace();
        }
        return list;
    }
}
