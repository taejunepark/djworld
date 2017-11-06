package mini.model.diary;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import mini.bean.Diary;

@Repository(value="diaryDao")
public class DiaryDaoImpl implements DiaryDao {
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	private RowMapper<Diary> mapper = (rs, index)->{
		return new Diary(rs);
	};
	
	private ResultSetExtractor<Diary> extractor = new ResultSetExtractor<Diary>() {
		@Override
		public Diary extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next())
				return new Diary(rs);
			
			return null;
		}
	};
	
	@Override
	public Diary info(String reg, String owner) {
		String sql = "select * from diary where reg = ? and owner = ?";
		Object[] obj = {
				reg, owner
		};
		return jdbctemplate.query(sql, obj, extractor);
	}

	@Override
	public void insert(Diary d) {
		String sql = "insert into diary values(" + d.getOwner() + ".nextVal,?, ?, 'diary', ?)";
		Object[] obj = {
				d.getReg(), d.getDetail(), d.getOwner() 
		};
		jdbctemplate.update(sql, obj);
	}

	@Override
	public void edit(Diary d) {
		String sql = "update diary set detail = ? where reg = ? and owner = ?";
		Object[] obj = {
				d.getDetail(), d.getReg(), d.getOwner()
		};
		jdbctemplate.update(sql, obj);
	}

	@Override
	public void delete(String reg) {
		String sql = "delete diary where reg = ?";
		jdbctemplate.update(sql,reg);
	}

}
