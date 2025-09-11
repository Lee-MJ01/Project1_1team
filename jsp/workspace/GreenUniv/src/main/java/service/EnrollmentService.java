package service;

import java.time.LocalDate;
import java.util.List;
import dao.EnrollmentDAO;
import dto.CourseDTO;
import dto.EnrolledCourseDTO;
import dto.PagenationDTO;

public enum EnrollmentService {
    INSTANCE;
    
    private final EnrollmentDAO dao = EnrollmentDAO.getInstance();

    /**
     * 특정 학생의 '현재 학기' 수강신청 목록을 조회합니다.
     * @param stdId 학번
     * @return 수강신청한 과목 DTO 리스트
     */
    public List<EnrolledCourseDTO> findEnrolledCourses(int stdId) {
        
        // 현재 년도와 학기 계산
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        
        // 3월~8월은 1학기, 그 외에는 2학기로 간주 (정책에 따라 변경 가능)
        int semester = (month >= 3 && month <= 8) ? 1 : 2;
        
        return dao.selectEnrolledCourses(stdId, year, semester);
    }
    
    /**
     * 현재 학기에 개설된 모든 강좌의 수를 조회합니다. (페이지네이션용)
     * @return 전체 강좌 수
     */
    public int countAllAvailableCourses() {
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int semester = (month >= 3 && month <= 8) ? 1 : 2;

        return dao.selectCountAllCourses(year, semester);
    }
    
    /**
     * 현재 학기 개설 강좌 목록을 페이지에 맞춰 조회합니다.
     * @param offset 페이지 시작점 (건너뛸 개수)
     * @return 한 페이지 분량의 CourseDTO 리스트
     */
    public List<CourseDTO> findAvailableCoursesByPage(int offset) {
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int semester = (month >= 3 && month <= 8) ? 1 : 2;
        
        return dao.selectAvailableCourses(year, semester, offset);
    }

 // [추가] 페이지네이션 정보 계산 서비스
    public PagenationDTO getPagenationInfo(String pg) {
        int currentPage = (pg != null && !pg.isEmpty()) ? Integer.parseInt(pg) : 1;
        int total = countAllAvailableCourses();
        
        int lastPageNum = (int)Math.ceil(total / 10.0);
        int pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
        int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
        int pageGroupEnd = pageGroupCurrent * 10;
        
        if (pageGroupEnd > lastPageNum) {
            pageGroupEnd = lastPageNum;
        }
        
        int limitStart = (currentPage - 1) * 10;
        
        PagenationDTO dto = new PagenationDTO();
        dto.setLastPageNum(lastPageNum);
        dto.setPageGroupStart(pageGroupStart);
        dto.setPageGroupEnd(pageGroupEnd);
        dto.setCurrentPage(currentPage);
        dto.setLimitStart(limitStart); // Controller가 DAO에 전달할 값
        
        return dto;
    }

    
    /**
     * 수강신청을 처리합니다.
     * @param stdId 신청한 학생의 학번
     * @param crsCd 신청할 과목의 코드
     * @return INSERT 성공 시 1, 실패 시 0
     */
    public int enrollCourse(int stdId, int crsCd) {
        int year = LocalDate.now().getYear();
        int month = LocalDate.now().getMonthValue();
        int semester = (month >= 3 && month <= 8) ? 1 : 2;
        
        return dao.insertEnrollment(stdId, crsCd, year, semester);
    }
}