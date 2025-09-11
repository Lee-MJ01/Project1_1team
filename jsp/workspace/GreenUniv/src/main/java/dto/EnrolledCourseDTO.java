package dto;

public class EnrolledCourseDTO {
    // enrollment, course, professor 테이블에서 가져올 정보들
    private String crs_cd;      // 과목코드
    private String crs_name;    // 과목명
    private String division;    // 구분 (전공/교양 등)
    private int credit;         // 학점
    private String professorName; // 담당교수 이름

    // Getters and Setters
    public String getCrs_cd() { return crs_cd; }
    public void setCrs_cd(String crs_cd) { this.crs_cd = crs_cd; }
    public String getCrs_name() { return crs_name; }
    public void setCrs_name(String crs_name) { this.crs_name = crs_name; }
    public String getDivision() { return division; }
    public void setDivision(String division) { this.division = division; }
    public int getCredit() { return credit; }
    public void setCredit(int credit) { this.credit = credit; }
    public String getProfessorName() { return professorName; }
    public void setProfessorName(String professorName) { this.professorName = professorName; }
}