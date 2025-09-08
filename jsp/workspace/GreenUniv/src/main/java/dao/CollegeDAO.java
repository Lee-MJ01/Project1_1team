package dao;

import java.util.ArrayList;
import java.util.List;

import dto.CollegeDTO;
import util.DBHelper;
import util.Sql;

public class CollegeDAO extends DBHelper {

    private static final CollegeDAO INSTANCE = new CollegeDAO();
    public static CollegeDAO getInstance() { return INSTANCE; }
    private CollegeDAO() {}

    public int insert(CollegeDTO dto) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.INSERT_COLLEGE);
            psmt.setString(1, dto.getCollege_name());
            psmt.setString(2, dto.getCollege_name_en());
            psmt.setString(3, dto.getIntro_title());
            psmt.setString(4, dto.getIntro_body());
            psmt.setString(5, dto.getImage_path());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }

    public CollegeDTO selectOne(String college_name) {
        CollegeDTO dto = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_COLLEGE);
            psmt.setString(1, college_name);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto = new CollegeDTO();
                dto.setCollege_name(rs.getString(1));
                dto.setCollege_name_en(rs.getString(2));
                dto.setIntro_title(rs.getString(3));
                dto.setIntro_body(rs.getString(4));
                dto.setImage_path(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return dto;
    }

    public List<CollegeDTO> selectAll(int start) {
        List<CollegeDTO> list = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_COLLEGE_ALL);
            psmt.setInt(1, start);
            rs = psmt.executeQuery();
            while (rs.next()) {
                CollegeDTO dto = new CollegeDTO();
                dto.setCollege_name(rs.getString(1));
                dto.setCollege_name_en(rs.getString(2));
                dto.setIntro_title(rs.getString(3));
                dto.setIntro_body(rs.getString(4));
                dto.setImage_path(rs.getString(5));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return list;
    }

    public int update(CollegeDTO dto) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.UPDATE_COLLEGE);
            psmt.setString(1, dto.getCollege_name_en());
            psmt.setString(2, dto.getIntro_title());
            psmt.setString(3, dto.getIntro_body());
            psmt.setString(4, dto.getImage_path());
            psmt.setString(5, dto.getCollege_name());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }

    public int delete(String college_name) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.DELETE_COLLEGE);
            psmt.setString(1, college_name);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }
}
