package dto;

public class GradesSearchDTO {

    private int crsCd;
    private String crsName;
    private int year;
    private String advisor;
    private String division;
    private int grade;
    private int credit;
    private String Alpa;

    // getter / setter
    public int getCrsCd() { return crsCd; }
    public void setCrsCd(int crsCd) { this.crsCd = crsCd; }

    public String getCrsName() { return crsName; }
    public void setCrsName(String crsName) { this.crsName = crsName; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getAdvisor() { return advisor; }
    public void setAdvisor(String advisor) { this.advisor = advisor; }

    public String getDivision() { return division; }
    public void setDivision(String division) { this.division = division; }

    public int getGrade() { return grade; }
    public void setGrade(int grade) { this.grade = grade; }

    public int getCredit() { return credit; }
    public void setCredit(int credit) { this.credit = credit; }
	public String getAlpa() {
		return Alpa;
	}
	public void setAlpa(String alpa) {
		Alpa = alpa;
	}
    
    
}
