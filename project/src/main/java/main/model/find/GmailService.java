package main.model.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service(value="emailService")
public class GmailService implements EmailService {

	@Autowired
	private JavaMailSenderImpl sender;
	
	@Autowired
	private FindDao findDao;
	
	
	public void send(String id, String name, String email) {
		// 선 DB 후 EMAIL 을 하여야 오류 발생시 메일을 안 보낸다.
		String tempPw = StringUtil.createRandomString(10);
		
		findDao.pwFind(id, name, email, tempPw);
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("DJWorld 임시 비밀번호 메일입니다." );
		StringBuffer buffer = new StringBuffer();
		buffer.append("임시 비밀번호는 "+tempPw+"입니다.");
//		buffer.append(인증토큰이 들어간 링크)
		message.setText(buffer.toString()); // 내용
		sender.send(message);
	}

}
