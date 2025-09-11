package service;

import java.util.Optional;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.UserDAO;
import dto.UserDTO;
import util.ResultCode;

public enum UserService {
	
	INSTANCE;
	
	private UserDAO dao = UserDAO.getInstance();
	
	private static final String SENDER = System.getenv("MAIL_SENDER");
	private static final String SECRET = System.getenv("MAIL_SECRET");
	
	// 로그인 성공
	public Optional<UserDTO> login(String user_id, String pass) {
		return dao.selectForLogin(user_id, pass)
				.map(u -> {u.setPass(null); return u;});
	}
	
	// 회원가입
	public ResultCode register(UserDTO dto){
	    if (dto == null || isBlank(dto.getUser_id()) || isBlank(dto.getPass())
	        || isBlank(dto.getUser_name()) || isBlank(dto.getEmail())) {
	      return ResultCode.INVALID_INPUT;
	    }

	    // 역할 검증(ENUM): UNDERGRAD/STAFF/VISITOR/ADMIN
	    if (isBlank(dto.getUser_role())) dto.setUser_role("VISITOR");

	    if (dao.existsById(dto.getUser_id()))  return ResultCode.REGISTER_DUP_USER_ID;
	    if (dao.existsByEmail(dto.getEmail())) return ResultCode.REGISTER_DUP_EMAIL;
	    if (!isBlank(dto.getHp()) && dao.existsByHp(dto.getHp()))
	      return ResultCode.REGISTER_DUP_HP;

	    dao.insert(dto);
	    return ResultCode.REGISTER_SUCCESS;
	}

	// 아이디 중복 확인 (👈 register 밖으로 뺌)
	public boolean existsById(String userId) {
	    return dao.existsById(userId);
	}

	// 이메일 인증코드 발송
	public String sendEmailCode(String to) {
		if (isBlank(SENDER) || isBlank(SECRET)) {
			throw new IllegalStateException("메일 계정 또는 앱 비밀번호가 설정되지 않았습니다.");
	    }
		
		// g-mail SMTP 서버 설정
		Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.ssl.enable", "true");
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	    String code = String.valueOf(ThreadLocalRandom.current().nextInt(100000, 1000000));
	
	    try {
	    	Session session = Session.getInstance(props, new Authenticator() {
	    		@Override
	    		protected PasswordAuthentication getPasswordAuthentication() {
	    			return new PasswordAuthentication(SENDER, SECRET);
	    		}
	    	});
	
	    	Message msg = new MimeMessage(session);
	        msg.setFrom(new InternetAddress(SENDER, "그린대", "UTF-8"));
	        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	        msg.setSubject("[그린대] 이메일 인증코드");
	        msg.setContent("인증코드는 <b>" + code + "</b> 입니다. (5분간 유효)", "text/html; charset=UTF-8");
		
	        Transport.send(msg);
	        return code;  // 성공 시 인증번호 반환
	    
	    } catch (Exception e) {
	    	e.printStackTrace();   // 콘솔에 로그
	    	return null;           // 실패 시 null 반환
	    }
	}
	
	private boolean isBlank(String s) { 
		return s==null || s.trim().isEmpty(); 
	}
	
	// 아이디, 비밀번호 찾기
	
	// 아이디 찾기
	public Optional<String> findUserId(String name, String email){
	    return dao.findUserIdByNameEmail(name, email)
	              .map(id -> id.replaceAll("(..).*(.)", "$1***$2")); // a1234 -> a1***4 식 마스킹
	}

	// 비밀번호 초기화 (인증코드 검증은 컨트롤러에서 세션으로)
	public boolean resetPassword(String userId, String email){
	    if (!dao.existsByIdAndEmail(userId, email)) return false;
	    String temp = String.valueOf(ThreadLocalRandom.current().nextInt(100000, 1000000)); // 6자리 임시비번
	    // 해시 없이 쓰는 중이면 그냥 temp, 해시 쓸 거면 BCrypt 등으로 인코딩
	    int updated = dao.updatePassword(userId, temp);
	    if (updated > 0) {
	        // 임시비번 메일 발송
	        try {
	            Properties props = new Properties();
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "465");
	            props.put("mail.smtp.auth", "true");
	            props.put("mail.smtp.ssl.enable", "true");
	            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(SENDER, SECRET);
	                }
	            });
	            Message msg = new MimeMessage(session);
	            msg.setFrom(new InternetAddress(SENDER, "그린대", "UTF-8"));
	            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	            msg.setSubject("[그린대] 임시 비밀번호 안내");
	            msg.setContent("임시 비밀번호는 <b>" + temp + "</b> 입니다. 로그인 후 반드시 변경하세요.", "text/html; charset=UTF-8");
	            Transport.send(msg);
	            return true;
	        } catch(Exception e){ e.printStackTrace(); }
	    }
	    return false;
	}
}