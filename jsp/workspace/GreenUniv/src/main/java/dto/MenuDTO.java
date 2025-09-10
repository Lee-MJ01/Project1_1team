package dto;

public class MenuDTO {
	private String comm_cd; 
	private String up_comm_cd; 
	private String comm_nm;
	public String getComm_cd() {
		return comm_cd;
	}
	public void setComm_cd(String comm_cd) {
		this.comm_cd = comm_cd;
	}
	public String getUp_comm_cd() {
		return up_comm_cd;
	}
	public void setUp_comm_cd(String up_comm_cd) {
		this.up_comm_cd = up_comm_cd;
	}
	public String getComm_nm() {
		return comm_nm;
	}
	public void setComm_nm(String comm_nm) {
		this.comm_nm = comm_nm;
	}
	@Override
	public String toString() {
		return "MenuDTO [comm_cd=" + comm_cd + ", up_comm_cd=" + up_comm_cd + ", comm_nm=" + comm_nm + "]";
	}
	
	
}
