package com.newsport.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import com.newsport.model.Sig_article;
import com.newsport.model.Sig_image;
import com.newsport.utils.EscapeChars;

public class SigDAOImpl implements SigDAO {
	private JdbcTemplate jdbcTemplate;
	private DataSource dataSource;

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public List<Sig_article> list(int limit) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,cover_url,published,meta FROM sig_article ORDER BY crawled DESC limit "
				+ limit;
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Sig_article>(Sig_article.class));
	}

	@Override
	public List<Sig_article> find(int start, int limit) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,cover_url FROM sig_article ORDER BY crawled DESC limit " + start + ","
				+ limit;
		List<Sig_article> listSigs = jdbcTemplate.query(sql, new RowMapper<Sig_article>() {

			@Override
			public Sig_article mapRow(ResultSet rs, int rowNum) throws SQLException {
				Sig_article aSig = new Sig_article();

				aSig.setId(rs.getInt("id"));
				aSig.setTitle(rs.getString("title"));
				aSig.setAbstract_content(rs.getString("abstract"));
				aSig.setCover_url(rs.getString("cover_url"));

				return aSig;
			}

		});
		return listSigs;
	}

	@Override
	public Sig_article findID(int sigId) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,text_content,extracted_content,cover_url,published,meta FROM sig_article WHERE id="
				+ sigId;
		return jdbcTemplate.query(sql, new ResultSetExtractor<Sig_article>() {

			@Override
			public Sig_article extractData(ResultSet rs) throws SQLException, DataAccessException {
				if (rs.next()) {

					Sig_article p = new Sig_article();
					p.setId(rs.getInt("id"));
					p.setTitle(rs.getString("title"));
					p.setAbstract_content(rs.getString("abstract"));
					p.setText_content(rs.getString("text_content"));
					p.setExtracted_content(rs.getString("extracted_content"));
					p.setCover_url(rs.getString("cover_url"));
					p.setPublished(rs.getDate("published"));
					p.setMeta(rs.getString("meta"));

					return p;
				}

				return null;
			}

		});
	}

	@Override
	public void delete(int sigId) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "DELETE FROM sig_article WHERE id=" + sigId;
		jdbcTemplate.update(sql);
	}

	@Override
	public void Update(Sig_article sigs) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		if (sigs.getId() > 0) {

			String sql = " UPDATE sig_article" + " SET title=" + "'" + EscapeChars.forXML(sigs.getTitle()) + "'" + ","
					+ "abstract=" + "'" + EscapeChars.forXML(sigs.getAbstract_content()) + "'" + "," + "text_content="
					+ "'" + EscapeChars.forXML(sigs.getText_content()) + "'" + "," + "published=" + "'"
					+ sigs.getPublished() + "'" + "," + "meta=" + "'" + sigs.getMeta() + "'" + " WHERE id=" + "'"
					+ sigs.getId() + "'";

			jdbcTemplate.update(sql);
		}
	}

	@Override
	public List<Sig_image> getImage(int sigId, final String coverUrl) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT url,des FROM sig_image WHERE sig_id=" + sigId;
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Sig_image>(Sig_image.class));
	}

	@Override
	public List<Sig_article> listPagination() {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,cover_url,published,meta FROM sig_article ORDER BY crawled DESC limit 500";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Sig_article>(Sig_article.class));
	}

	@Override
	public List<Sig_article> getRelatedNew(List<String> meta) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,cover_url,published,meta FROM sig_article WHERE";
		for(int i=0; i < meta.size(); i++){
			if(i!= meta.size() -1){
				sql = sql + " meta LIKE'%" + meta.get(i) + "%'" + " OR";
			}else{
				sql = sql + " meta LIKE'%" + meta.get(i) + "%'";
			}
		}
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Sig_article>(Sig_article.class));
	}

	@Override
	public List<Sig_article> getRandomSig(int number) {
		jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "SELECT id,title,abstract,cover_url,published,meta FROM sig_article ORDER BY RAND() limit 4";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Sig_article>(Sig_article.class));
	}
}
