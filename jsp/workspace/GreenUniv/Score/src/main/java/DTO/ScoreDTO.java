package DTO;

public class ScoreDTO {
	private int score_no;
	private String std_id;
	private int crs_cd;
	private int mid_score ;
	private int final_score;
	private int total_score;
	private int grade;
	
	public int getScore_no() {
		return score_no;
	}
	public void setScore_no(int score_no) {
		this.score_no = score_no;
	}
	public String getStd_id() {
		return std_id;
	}
	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}
	public int getCrs_cd() {
		return crs_cd;
	}
	public void setCrs_cd(int crs_cd) {
		this.crs_cd = crs_cd;
	}
	public int getMid_score() {
		return mid_score;
	}
	public void setMid_score(int mid_score) {
		this.mid_score = mid_score;
	}
	public int getFinal_score() {
		return final_score;
	}
	public void setFinal_score(int final_score) {
		this.final_score = final_score;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "ScoreDTO [score_no=" + score_no + ", std_id=" + std_id + ", crs_cd=" + crs_cd + ", mid_score="
				+ mid_score + ", final_score=" + final_score + ", total_score=" + total_score + ", grade=" + grade
				+ "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
