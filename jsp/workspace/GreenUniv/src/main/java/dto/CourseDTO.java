package dto;

public class CourseDTO {
	
    private int crs_cd;          // 과목 코드
    private int dept_id;         // 학과 번호
    private int year;           // 학년
    private int semester;        // 학기
    private String division;     // 구분 (전공/교양 등)
    private String crs_name;     // 강의명
    private int p_code;          // 교수 코드
    private int credit;          // 학점
    private String crs_desc;     // 강의 설명
    private String period_start; // 수업 시작일 (yyyy-MM-dd)
    private String period_end;   // 수업 종료일 (yyyy-MM-dd)
    private String time_start;   // 시작 시간 (HH:mm:ss)
    private String time_end;     // 종료 시간 (HH:mm:ss)
    private String days;         // 요일
    private String eval_method;  // 평가 방식
    private String textbook;     // 교재
    private String crs_room;     // 강의실
    private int capacity;        // 최대 수강 인원
    
    
    
	public int getCrs_cd() {
		return crs_cd;
	}



	public void setCrs_cd(int crs_cd) {
		this.crs_cd = crs_cd;
	}



	public int getDept_id() {
		return dept_id;
	}



	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}



	public int getYear() {
		return year;
	}



	public void setYear(int yaer) {
		this.year = yaer;
	}



	public int getSemester() {
		return semester;
	}



	public void setSemester(int semester) {
		this.semester = semester;
	}



	public String getDivision() {
		return division;
	}



	public void setDivision(String division) {
		this.division = division;
	}



	public String getCrs_name() {
		return crs_name;
	}



	public void setCrs_name(String crs_name) {
		this.crs_name = crs_name;
	}



	public int getP_code() {
		return p_code;
	}



	public void setP_code(int p_code) {
		this.p_code = p_code;
	}



	public int getCredit() {
		return credit;
	}



	public void setCredit(int credit) {
		this.credit = credit;
	}



	public String getCrs_desc() {
		return crs_desc;
	}



	public void setCrs_desc(String crs_desc) {
		this.crs_desc = crs_desc;
	}



	public String getPeriod_start() {
		return period_start;
	}



	public void setPeriod_start(String period_start) {
		this.period_start = period_start;
	}



	public String getPeriod_end() {
		return period_end;
	}



	public void setPeriod_end(String period_end) {
		this.period_end = period_end;
	}



	public String getTime_start() {
		return time_start;
	}



	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}



	public String getTime_end() {
		return time_end;
	}



	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}



	public String getDays() {
		return days;
	}



	public void setDays(String days) {
		this.days = days;
	}



	public String getEval_method() {
		return eval_method;
	}



	public void setEval_method(String eval_method) {
		this.eval_method = eval_method;
	}



	public String getTextbook() {
		return textbook;
	}



	public void setTextbook(String textbook) {
		this.textbook = textbook;
	}



	public String getCrs_room() {
		return crs_room;
	}



	public void setCrs_room(String crs_room) {
		this.crs_room = crs_room;
	}



	public int getCapacity() {
		return capacity;
	}



	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}



	@Override
	public String toString() {
		return "CourseDTO [crs_cd=" + crs_cd + ", dept_id=" + dept_id + ", year=" + year + ", semester=" + semester
				+ ", division=" + division + ", crs_name=" + crs_name + ", p_code=" + p_code + ", credit=" + credit
				+ ", crs_desc=" + crs_desc + ", period_start=" + period_start + ", period_end=" + period_end
				+ ", time_start=" + time_start + ", time_end=" + time_end + ", days=" + days + ", eval_method="
				+ eval_method + ", textbook=" + textbook + ", crs_room=" + crs_room + ", capacity=" + capacity + "]";
	}
	
	
	
	
}
