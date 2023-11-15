package br.edu.catalogo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.edu.catalogo.model.Category;
import br.edu.catalogo.util.ConnectionFactory;

public class CategoryDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public CategoryDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("Erro: \n" + e.getMessage());
		}
	}

	public List<Category> searchCategory() throws Exception {
		try {
			ps = conn.prepareStatement("SELECT * FROM categoria");
			rs = ps.executeQuery();
			List<Category> listCateg = new ArrayList<Category>();
			while (rs.next()) {
				String nameCateg = rs.getString("nome");
				String imageCateg = rs.getString("imagem");
				listCateg.add(new Category(nameCateg, imageCateg));
			}
			return listCateg;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}