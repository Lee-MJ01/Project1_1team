package greenuinv.dto;

public class ProfessorDTO {
	
	private String p_code;
	private String nation;
	private String name_ko;
	private String name_en;
	private String gender;
	private String jumin;
	private String hp;
	private String email;
	private int addr_code;
	private String addr;
	private String addr_detail;
	private int dept_id;
	private String position_code;
	private String position_detail;
	private String hire_date;
	private String status;
	private String univ;
	private String graduate_date;
	private String course;
	private String ing;
	
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getName_ko() {
		return name_ko;
	}
	public void setName_ko(String name_ko) {
		this.name_ko = name_ko;
	}
	public String getName_en() {
		return name_en;
	}
	public void setName_en(String name_en) {
		this.name_en = name_en;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAddr_code() {
		return addr_code;
	}
	public void setAddr_code(int addr_code) {
		this.addr_code = addr_code;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getPosition_code() {
		return position_code;
	}
	public void setPosition_code(String position_code) {
		this.position_code = position_code;
	}
	public String getPosition_detail() {
		return position_detail;
	}
	public void setPosition_detail(String position_detail) {
		this.position_detail = position_detail;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	public String getGraduate_date() {
		return graduate_date;
	}
	public void setGraduate_date(String graduate_date) {
		this.graduate_date = graduate_date;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	
	@Override
	public String toString() {
		return "DepartmentDTO [p_code=" + p_code + ", nation=" + nation + ", name_ko=" + name_ko + ", name_en="
				+ name_en + ", gender=" + gender + ", jumin=" + jumin + ", hp=" + hp + ", email=" + email
				+ ", addr_code=" + addr_code + ", addr=" + addr + ", addr_detail=" + addr_detail + ", dept_id="
				+ dept_id + ", position_code=" + position_code + ", position_detail=" + position_detail + ", hire_date="
				+ hire_date + ", status=" + status + ", univ=" + univ + ", graduate_date=" + graduate_date + ", course="
				+ course + ", ing=" + ing + "]";
	}
}
