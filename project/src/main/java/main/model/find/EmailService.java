package main.model.find;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	void send(String id, String name, String email);
}
