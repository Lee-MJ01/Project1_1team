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
	
	private final String SENDER = System.getenv("MAIL_USER");
	private final String SECRET = System.getenv("MAIL_APP_PASS");
	
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

    int n = dao.insert(dto);
    return (n == 1) ? ResultCode.REGISTER_SUCCESS : ResultCode.FAIL;
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
	      Session session = Session.getInstance(props, new Authenticator(){
	        @Override protected PasswordAuthentication getPasswordAuthentication(){
	          return new PasswordAuthentication(SENDER, SECRET);
	        }
	    });
	
	   	Message msg = new MimeMessage(session);
	   	
	  	msg.setFrom(new InternetAddress(SENDER, "greendae1", "UTF-8"));
		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	 	msg.setSubject("[greendae1] 이메일 인증코드");
		msg.setContent("인증코드는 <b>"+code+"</b> 입니다.", "text/html; charset=UTF-8");
		
		Transport.send(msg);
	    } catch(Exception e){
	      throw new RuntimeException("메일 발송 실패", e);
	    }
	    return code;
	  }
	
	private boolean isBlank(String s) { 
		return s==null || s.trim().isEmpty(); 
	}
}
