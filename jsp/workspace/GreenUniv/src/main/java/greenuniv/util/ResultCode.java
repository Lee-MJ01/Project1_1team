package greenuniv.util;

public enum ResultCode {

	REGISTER_SUCCESS(100, "회원가입이 완료 되었습니다."),
	LOGIN_FAIL(101, "로그인에 실패하였습니다. 아이디/비밀번호를 확인해 주십시오."),
	LOGOUT_SUCCESS(102, "로그아웃 하였습니다. 안녕히 가십시오."),
	LOGIN_REQUIRE(103, "로그인을 하여야 합니다."),
	WRITER_SUCCESS(200, "글 작성을 완료하였습니다.");
	
	private final int code;
	private final String message;
	
	ResultCode(int code, String message) {
		this.code = code;
		this.message = message;
	}
	
	public int getCode() {
		return code;
	}
	
	public String getMessage() {
		return message;
	}
	
	// 코드값으로 enum 객체 반환
	public static ResultCode fromCode(int code) {
		
		for(ResultCode rc : values()) { // values() : enum 객체의 내장 메서드로 전체 열거상수를 배열로 반환
			
			if(rc.code == code) {
				return rc;
			}			
		}		
		return null;
	}
}