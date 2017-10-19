package main.model.find;

import org.springframework.stereotype.Repository;

@Repository
public interface FindDao {
	String idFind(String name, String email);
	String pwFind(String id, String name, String email);
}
