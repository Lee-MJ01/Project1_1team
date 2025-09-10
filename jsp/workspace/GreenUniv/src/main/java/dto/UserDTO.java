package dto;

public class UserDTO {

	private String user_id;
	private String pass;
	private String user_name;
	private String hp;
	private String email;
	private String addr1;
	private String addr2;
	private String user_role;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
   public void setUsid(String string) {
      // TODO Auto-generated method stub
      
   }
   public void setNick(String string) {
      // TODO Auto-generated method stub
      
   }
   public void setUs_name(String string) {
      // TODO Auto-generated method stub
      
   }
	
	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", pass=" + pass + ", user_name=" + user_name + ", hp=" + hp + ", email="
				+ email + ", addr1=" + addr1 + ", addr2=" + addr2 + ", user_role=" + user_role + "]";
	}
}
	