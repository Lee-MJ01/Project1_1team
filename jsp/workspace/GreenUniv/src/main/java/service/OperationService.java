package service;

import dao.OperationDAO;
import dto.*;

import java.util.List;

public enum OperationService {
    INSTANCE;

    private final OperationDAO dao = OperationDAO.getInstance();

    public OverviewStatsDTO getStats(int year, String semester){ return dao.fetchOverviewStats(year, semester); }
    public List<CourseOverviewDTO> getCourses(int year, String semester){ return dao.fetchCourseOverview(year, semester); }
    public List<ByGradeDTO> getByGrade(int year, String term){ return dao.fetchByGrade(year, term); }
    public List<ByDeptDTO> getByDept(){ return dao.fetchByDept(); }
    public List<BoardRowDTO> getNotices(){ return dao.fetchAcademicNotices(10); }
    public List<BoardRowDTO> getQna(){ return dao.fetchAdmissionQna(10); }
}
