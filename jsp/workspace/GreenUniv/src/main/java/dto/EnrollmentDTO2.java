package dto;

public class EnrollmentDTO2 {
    private int year;
    private int semester;
    private String stdId;
    private String name;
    private int grade;
    private String deptName;
    private String crsCd;
    private String crsName;
    private String division;
    private String professor;
    private int credit;
    private String enrollDate;
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getStdId() {
		return stdId;
	}
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getCrsCd() {
		return crsCd;
	}
	public void setCrsCd(String crsCd) {
		this.crsCd = crsCd;
	}
	public String getCrsName() {
		return crsName;
	}
	public void setCrsName(String crsName) {
		this.crsName = crsName;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	@Override
	public String toString() {
		return "EnrollmentDTO2 [year=" + year + ", semester=" + semester + ", stdId=" + stdId + ", name=" + name
				+ ", grade=" + grade + ", deptName=" + deptName + ", crsCd=" + crsCd + ", crsName=" + crsName
				+ ", division=" + division + ", professor=" + professor + ", credit=" + credit + ", enrollDate="
				+ enrollDate + "]";
	}
    
    
}
