package dto;

public class CourseDTO {
	
	private int crs_cd;
	private int dept_id;
	private int grade;
	private String div;
	private String crs_name;
	private int p_code;
	private int credit;
	private String crs_time;
	private String crs_room;
	private int capacity;
	
	
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getDiv() {
		return div;
	}
	public void setDiv(String div) {
		this.div = div;
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
	public String getCrs_time() {
		return crs_time;
	}
	public void setCrs_time(String crs_time) {
		this.crs_time = crs_time;
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
		return "CourseDTO [crs_cd=" + crs_cd + ", dept_id=" + dept_id + ", grade=" + grade + ", div=" + div
				+ ", crs_name=" + crs_name + ", p_code=" + p_code + ", credit=" + credit + ", crs_time=" + crs_time
				+ ", crs_room=" + crs_room + ", capacity=" + capacity + "]";
	}
	
}
