package util;

public enum ResultCode {

	REGISTER_SUCCESS(100, "회원가입이 완료 되었습니다."),
	LOGIN_FAIL(101, "로그인에 실패했습니다. 아이디/비번을 다시 확인하십시요."),
	LOGOUT_SUCCESS(102, "로그아웃 했습니다. 안녕히 가십시요."),
	ROLE_NOT_ENOUGH(103, "권한이 없습니다. 관리자에게 문의하세요."),
	LOGIN_REQUIRE(104, "로그인을 하셔야 합니다."),
	WRITE_SUCCESS(200, "글 작성 완료 했습니다."),
	COMMENT_SUCCESS(300, "댓글 작성 완료 했습니다.");
	
	
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












