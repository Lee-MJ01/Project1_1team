package dto;

public class BoardDTO {
	private int Number;
	private String comm_cd;
	private String title;
	private String writer;
	private String w_date;
	private int view_count;
	private String stat_1;
	private String division;
	private String stat_2;
	private String pass_yn;
	private String pwd;
	private String file_yn;
	public int getNumber() {
		return Number;
	}
	public void setNumber(int number) {
		Number = number;
	}
	public String getComm_cd() {
		return comm_cd;
	}
	public void setComm_cd(String comm_cd) {
		this.comm_cd = comm_cd;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public String getStat_1() {
		return stat_1;
	}
	public void setStat_1(String stat_1) {
		this.stat_1 = stat_1;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getStat_2() {
		return stat_2;
	}
	public void setStat_2(String stat_2) {
		this.stat_2 = stat_2;
	}
	public String getPass_yn() {
		return pass_yn;
	}
	public void setPass_yn(String pass_yn) {
		this.pass_yn = pass_yn;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getFile_yn() {
		return file_yn;
	}
	public void setFile_yn(String file_yn) {
		this.file_yn = file_yn;
	}
	@Override
	public String toString() {
		return "BoardDTO [Number=" + Number + ", comm_cd=" + comm_cd + ", title=" + title + ", writer=" + writer
				+ ", w_date=" + w_date + ", view_count=" + view_count + ", stat_1=" + stat_1 + ", division=" + division
				+ ", stat_2=" + stat_2 + ", pass_yn=" + pass_yn + ", pwd=" + pwd + ", file_yn=" + file_yn + "]";
	}
	
	

}
