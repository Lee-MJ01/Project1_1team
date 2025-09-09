package dto;

public class ProfessorDTO {
    private int    prof_id;           // PK (자동/수동 정책은 화면/서비스에서 결정)
    private String resident_number;
    private String name;
    private String e_name;
    private String gender;            // M/F
    private String division;          // KOR/USA/...
    private String phone;
    private String email;

    // 주소 3필드(화면과 동일 변수명)
    private String zip;
    private String addr1;
    private String addr2;

    // 학력/소속
    private String graduated_univ;
    private String graduation_date;   // 'YYYY-MM-DD' 문자열로 처리
    private String major_field;
    private String degree;            // 학사/석사/박사
    private int    dept_id;
    private String hire_date;         // 'YYYY-MM-DD'

    // 목록 표시용 join 컬럼
    private String dept_name;

    // getter/setter
    public int getProf_id() { return prof_id; }
    public void setProf_id(int prof_id) { this.prof_id = prof_id; }
    public String getResident_number() { return resident_number; }
    public void setResident_number(String resident_number) { this.resident_number = resident_number; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getE_name() { return e_name; }
    public void setE_name(String e_name) { this.e_name = e_name; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public String getDivision() { return division; }
    public void setDivision(String division) { this.division = division; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getZip() { return zip; }
    public void setZip(String zip) { this.zip = zip; }
    public String getAddr1() { return addr1; }
    public void setAddr1(String addr1) { this.addr1 = addr1; }
    public String getAddr2() { return addr2; }
    public void setAddr2(String addr2) { this.addr2 = addr2; }
    public String getGraduated_univ() { return graduated_univ; }
    public void setGraduated_univ(String graduated_univ) { this.graduated_univ = graduated_univ; }
    public String getGraduation_date() { return graduation_date; }
    public void setGraduation_date(String graduation_date) { this.graduation_date = graduation_date; }
    public String getMajor_field() { return major_field; }
    public void setMajor_field(String major_field) { this.major_field = major_field; }
    public String getDegree() { return degree; }
    public void setDegree(String degree) { this.degree = degree; }
    public int getDept_id() { return dept_id; }
    public void setDept_id(int dept_id) { this.dept_id = dept_id; }
    public String getHire_date() { return hire_date; }
    public void setHire_date(String hire_date) { this.hire_date = hire_date; }
    public String getDept_name() { return dept_name; }
    public void setDept_name(String dept_name) { this.dept_name = dept_name; }
}
