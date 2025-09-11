package dao;

import java.util.ArrayList;
import java.util.List;

import dto.counselDTO;
import util.DBHelper;
import util.Sql;

public class counselDAO extends DBHelper {

    private static final counselDAO INSTANCE = new counselDAO();
    public static counselDAO getInstance() { return INSTANCE; }
    private counselDAO() {}

    //insert
    public int insert(counselDTO dto) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.INSERT_counsel);
            psmt.setInt(1, dto.getNumber());
            psmt.setString(2, dto.getDivision());
            psmt.setString(3, dto.getTitle());
            psmt.setString(4, dto.getWriter());
            psmt.setString(5, dto.getWdate());
            psmt.setString(6, dto.getStat_1());
            psmt.setString(7, dto.getPassyn());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }
    
    
    //select
    public counselDTO selectOne(int n_no) {
    	counselDTO dto = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_counsel);
            psmt.setInt(1, n_no);
            rs = psmt.executeQuery();
            if (rs.next()) {
                dto = new counselDTO();
                dto.setNumber(rs.getInt(1));
                dto.setDivision(rs.getString(2));
                dto.setTitle(rs.getNString(3));
                dto.setWriter(rs.getString(4));
                dto.setWdate(rs.getString(5));
                dto.setStat_1(rs.getString(6));
                dto.setPassyn(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return dto;
    }
    
    
    //select all
    public List<counselDTO> selectAll(int start) {
        List<counselDTO> list = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.SELECT_counsel_ALL);
            psmt.setInt(1, start);
            rs = psmt.executeQuery();
            while (rs.next()) {
            	counselDTO dto = new counselDTO();
                dto.setNumber(rs.getInt(1));
                dto.setDivision(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setWriter(rs.getString(4));
                dto.setWdate(rs.getString(5));
                dto.setStat_1(rs.getString(6));
                dto.setPassyn(rs.getString(7));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return list;
    }
    
    //update
    public int update(counselDTO dto) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.UPDATE_counsel);
            psmt.setInt(1, dto.getNumber());
            psmt.setString(2, dto.getDivision());
            psmt.setString(4, dto.getTitle());
            psmt.setString(5, dto.getWriter());
            psmt.setString(6, dto.getWdate());
            psmt.setString(7, dto.getStat_1());
            psmt.setString(7, dto.getPassyn());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }

    
    //delete
    public int delete(int n_no) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(Sql.DELETE_counsel);
            psmt.setInt(1, n_no);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { closeAll(); } catch (Exception ignore) {}
        }
        return result;
    }
}
