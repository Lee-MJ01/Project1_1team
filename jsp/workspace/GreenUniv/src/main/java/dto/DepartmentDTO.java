package dto;

public class DepartmentDTO {
	
	private int dept_id;
	private String college_name;
	private String dept_name;
	private String dept_name_en;
	private String established;
	private String chair_name;
	private String dept_phone;
	private String dept_office;
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String college_name) {
		this.college_name = college_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getDept_name_en() {
		return dept_name_en;
	}
	public void setDept_name_en(String dept_name_en) {
		this.dept_name_en = dept_name_en;
	}
	public String getEstablished() {
		return established;
	}
	public void setEstablished(String established) {
		this.established = established;
	}
	public String getChair_name() {
		return chair_name;
	}
	public void setChair_name(String chair_name) {
		this.chair_name = chair_name;
	}
	public String getDept_phone() {
		return dept_phone;
	}
	public void setDept_phone(String dept_phone) {
		this.dept_phone = dept_phone;
	}
	public String getDept_office() {
		return dept_office;
	}
	public void setDept_office(String dept_office) {
		this.dept_office = dept_office;
	}
	@Override
	public String toString() {
		return "DepartmentDTO [dept_id=" + dept_id + ", college_name=" + college_name + ", dept_name=" + dept_name
				+ ", dept_name_en=" + dept_name_en + ", established=" + established + ", chair_name=" + chair_name
				+ ", dept_phone=" + dept_phone + ", dept_office=" + dept_office + "]";
	}
	
	
	
}
