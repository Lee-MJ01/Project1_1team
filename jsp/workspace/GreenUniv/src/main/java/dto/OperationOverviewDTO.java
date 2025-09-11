package dto;

public class OperationOverviewDTO {
	
    private String deptName;   // 학과명
    private int crsCd;         // 과목코드
    private String crsName;    // 강의명
    private int year;          // 학년
    private String professor;  // 담당교수
    private String division;   // 구분 (전공/교양 등)
    private int credit;        // 학점
    private String crsRoom;    // 강의실
    private int enrolled;      // 수강 인원
    private int capacity;      // 정원
    private int enrollRate; // 0~100%

    // 파생필드: 수강률
    public double getRate() {
        if (capacity == 0) return 0;
        return (enrolled * 100.0) / capacity;
    }

	@Override
	public String toString() {
		return "OperationOverviewDTO [deptName=" + deptName + ", crsCd=" + crsCd + ", crsName=" + crsName + ", year="
				+ year + ", professor=" + professor + ", division=" + division + ", credit=" + credit + ", crsRoom="
				+ crsRoom + ", enrolled=" + enrolled + ", capacity=" + capacity + "]";
	}

	public int getEnrollRate() {
		return enrollRate;
	}
	public void setEnrollRate(int enrollRate) {
		this.enrollRate = enrollRate;
	}
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public int getCrsCd() {
		return crsCd;
	}

	public void setCrsCd(int crsCd) {
		this.crsCd = crsCd;
	}

	public String getCrsName() {
		return crsName;
	}

	public void setCrsName(String crsName) {
		this.crsName = crsName;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getProfessor() {
		return professor;
	}

	public void setProfessor(String professor) {
		this.professor = professor;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public String getCrsRoom() {
		return crsRoom;
	}

	public void setCrsRoom(String crsRoom) {
		this.crsRoom = crsRoom;
	}

	public int getEnrolled() {
		return enrolled;
	}

	public void setEnrolled(int enrolled) {
		this.enrolled = enrolled;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

    
    
    
}
