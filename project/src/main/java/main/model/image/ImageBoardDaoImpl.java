package main.model.image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import main.bean.Content;

@Repository("imageBoardDao")
public class ImageBoardDaoImpl implements ImageBoardDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public boolean insert(String id, String savename) {
		String sql = "update member set profile = ? where id = ? ";
		return jdbcTemplate.update(sql, savename, id) > 0;
	}

	@Override
	public List<Content> list() {
		String sql = "select * from imageboard order by reg desc";
		RowMapper<Content> mapper = (rs, index) -> {
			return new Content(rs);
		};
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public Content get(String savename) {
		String sql = "select * from imageboard where savename=?";
		ResultSetExtractor<Content> extractor = rs -> {
			if (rs.next())
				return new Content(rs);
			else
				return null;
		};
		return jdbcTemplate.query(sql, extractor, savename);
	}
}
