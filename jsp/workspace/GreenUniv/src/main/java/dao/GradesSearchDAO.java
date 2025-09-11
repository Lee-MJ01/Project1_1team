package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.GradesSearchDTO;
import util.DBHelper;

public class GradesSearchDAO extends DBHelper {

    private static final GradesSearchDAO INSTANCE = new GradesSearchDAO();
    public static GradesSearchDAO getInstance() { return INSTANCE; }
    private GradesSearchDAO() {}

    public List<GradesSearchDTO> selectAll() {
        List<GradesSearchDTO> list = new ArrayList<>();
        try {
            Connection conn = getConnection();
            PreparedStatement psmt = conn.prepareStatement("SELECT * FROM grades");
            ResultSet rs = psmt.executeQuery();

            while(rs.next()) {
                GradesSearchDTO dto = new GradesSearchDTO();
                dto.setCrsCd(rs.getInt("crs_cd"));
                dto.setCrsName(rs.getString("crs_name"));
                dto.setYear(rs.getInt("year"));
                dto.setAdvisor(rs.getString("advisor"));
                dto.setDivision(rs.getString("division"));
                dto.setGrade(rs.getInt("grade"));
                dto.setCredit(rs.getInt("credit"));
                dto.setAlpa(rs.getString("Alpa"));
                list.add(dto);
            }

            rs.close();
            psmt.close();
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}