package greenuinv.dto;

public class UserDTO {

	private String usid;
	private String pass;
	private String us_name;
	private String hp;
	private String email;
	private String addr1;
	private String addr2;
	
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
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
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	@Override
	public String toString() {
		return "UserDTO [usid=" + usid + ", pass=" + pass + ", us_name=" + us_name + ", hp=" + hp + ", email=" + email
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + "]";
	}
}
