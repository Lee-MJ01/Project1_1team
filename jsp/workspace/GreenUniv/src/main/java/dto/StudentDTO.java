package dto;

public class StudentDTO {
    private int    std_id;
    private String resident_number;
    private String name;
    private String e_name;
    private String gender;
    private String division;
    private String phone;
    private String email;
    private String address;
    private String entryyear;
    private String graduationyear;
    private int    dept_id;
    private String entryterm;     // "1" / "2"
    private String entrygrade;    // "1".."4"
    private String advisor;
    private String status;

    // 목록 표시용
    private String dept_name;

    public int getStd_id() { return std_id; }
    public void setStd_id(int std_id) { this.std_id = std_id; }
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
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getEntryyear() { return entryyear; }
    public void setEntryyear(String entryyear) { this.entryyear = entryyear; }
    public String getGraduationyear() { return graduationyear; }
    public void setGraduationyear(String graduationyear) { this.graduationyear = graduationyear; }
    public int getDept_id() { return dept_id; }
    public void setDept_id(int dept_id) { this.dept_id = dept_id; }
    public String getEntryterm() { return entryterm; }
    public void setEntryterm(String entryterm) { this.entryterm = entryterm; }
    public String getEntrygrade() { return entrygrade; }
    public void setEntrygrade(String entrygrade) { this.entrygrade = entrygrade; }
    public String getAdvisor() { return advisor; }
    public void setAdvisor(String advisor) { this.advisor = advisor; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDept_name() { return dept_name; }
    public void setDept_name(String dept_name) { this.dept_name = dept_name; }
}
