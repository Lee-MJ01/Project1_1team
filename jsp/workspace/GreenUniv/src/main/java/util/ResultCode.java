package util;

public enum ResultCode {

    
    
    
	// 1** : 인증/세션
	LOGIN_SUCESS (100, "로그인에 성공했습니다."),
	LOGIN_FAIL(101, "로그인에 실패하였습니다. 아이디/비밀번호를 확인해 주십시오."),
	LOGOUT_SUCCESS(102, "로그아웃 하였습니다. 안녕히 가십시오."),
	LOGIN_REQUIRE(103, "로그인이 필요합니다."),
	ROLE_NOT_ENOUGH(104, "접근 권한이 없습니다."),
	
	// 2** : 사용자 성공 처리
	REGISTER_SUCCESS(200, "회원가입이 완료되었습니다."),
	PROFILE_UPDATE_SUCCESS(201, "프로필을 수정했습니다."),
	PASSWORD_CHANGE_SUCCESS(202, "비밀번호를 변경했습니다."),
	USER_DELETE_SUCCESS(203, "회원 정보를 삭제했습니다."),
	WRITE_SUCCESS(210, "작성을 완료했습니다."),
	WRITE_FAIL(211, "글 작성에 실패했습니다."),
	COMMENT_SUCCESS(212, "댓글 작성 완료 했습니다."),
	
	// 4** : 유효성/중복/권한 입력 오류
	INVALID_INPUT(400, "입력값을 확인해 주십시오."),
	REGISTER_DUP_USER_ID(401, "이미 사용 중인 아이디입니다."),
	REGISTER_DUP_EMAIL(402, "이미 등록된 이메일입니다."),
	REGISTER_DUP_HP(403, "이미 등록된 휴대폰 번호입니다."),
	INVALID_ROLE(404, "권한 값이 올바르지 않습니다."),
	
	// 5** : 일반 실패
	FAIL(500, "요청을 처리하지 못했습니다.");
		
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
