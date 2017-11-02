package mini.model.photo;

import java.util.List;

import org.springframework.stereotype.Repository;

import mini.bean.Photo;

@Repository
public interface PhotoDao {
	List<Photo> list(String type, String separate);
}
