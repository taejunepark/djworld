package mini.model.upload;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface UploadDao {
	void insert(List<String> list, String type, int no, String separate);
}
