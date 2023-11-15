package br.edu.catalogo.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.edu.catalogo.model.Brinquedo;
import br.edu.catalogo.util.ConnectionFactory;

public class BrinquedoDAO {
	private Connection conn;
	private PreparedStatement ps; // permite que scripts SQL sejam executados a partir do Java
	private ResultSet rs; // representa as tabelas
	private Brinquedo brinquedo;

	public BrinquedoDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	public void salvarAll(Brinquedo brinquedo) throws Exception {
		if (brinquedo == null)
			throw new Exception("O valor passado não pode ser nulo");
		String imagemStream = null;
		try {
			imagemStream = brinquedo.getImagem();
			System.out.println("Imagem Stream: " + imagemStream);
			String valor = brinquedo.getValor().replace(',', '.');
			BigDecimal valorDecimal = (valor != null) ? new BigDecimal(valor) : new BigDecimal(0);
			String SQL = "INSERT INTO brinquedo (codigo, descricao, categoria, marca, imagem, valor, detalhes) values "
					+ "(?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, brinquedo.getCodigo());
			ps.setString(2, brinquedo.getDescricao());
			ps.setString(3, brinquedo.getCategoria());
			ps.setString(4, brinquedo.getMarca());
			ps.setString(5, brinquedo.getImagem());
			ps.setBigDecimal(6, valorDecimal);
			ps.setString(7, brinquedo.getDetalhes());
			ps.executeUpdate();
			mapCategories();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public void updateAll(Brinquedo brinquedo) throws Exception {
		if (brinquedo == null)
			throw new Exception("O valor passado não pode ser nulo");

		String imagemStream = null;
		try {
			imagemStream = brinquedo.getImagem();
			System.out.println("Imagem Stream: " + imagemStream);
			String valor = brinquedo.getValor().replace(',', '.');
			BigDecimal valorDecimal = (valor != null) ? new BigDecimal(valor) : new BigDecimal(0);

			String SQL = "UPDATE brinquedo SET descricao=?, categoria=?, marca=?, imagem=?, valor=?, detalhes=? WHERE codigo=?";
			ps = conn.prepareStatement(SQL);

			ps.setString(1, brinquedo.getDescricao());
			ps.setString(2, brinquedo.getCategoria());
			ps.setString(3, brinquedo.getMarca());
			ps.setString(4, brinquedo.getImagem());
			ps.setBigDecimal(5, valorDecimal);
			ps.setString(6, brinquedo.getDetalhes());
			ps.setInt(7, brinquedo.getCodigo());

			int linhasAfetadas = ps.executeUpdate();

			if (linhasAfetadas == 0) {
				throw new Exception("Nenhum registro atualizado. Código não encontrado: " + brinquedo.getCodigo());
			}
			mapCategories();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao atualizar dados: " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public void mapCategories() throws Exception {
		try {
			// Inserir novas categorias na tabela 'categoria'
			String insertSQL = "INSERT INTO categoria (nome, imagem) " + "SELECT DISTINCT b.categoria, " + "CASE "
					+ "WHEN b.categoria = 'Bonecos' THEN 'https://catracalivre.com.br/wp-content/uploads/2021/12/gi-1.png' "
					+ "WHEN b.categoria = 'Esportes' THEN 'https://imageswscdn.wslojas.com.br/files/7103/bicicleta-infantil-aro-12-black-com-freio-tambor-e-rodas-de-treinamento-nathor-13420221810.png' "
					+ "WHEN b.categoria = 'Carrinho' THEN 'https://down-br.img.susercontent.com/file/br-11134211-7qukw-lgmg9o0sndvv1c' "
					+ "WHEN b.categoria = 'Jogo' THEN 'https://static3.tcdn.com.br/img/img_prod/841504/brinquedo_educativo_de_madeira_jogo_4_em_1_247151_1_20201208175408.png' "
					+ "ELSE 'https://bathfoodbank.org/wp-content/uploads/2020/03/NEW.png' " + "END as imagem "
					+ "FROM brinquedo b " + "WHERE NOT EXISTS (SELECT 1 FROM categoria c WHERE c.nome = b.categoria)";

			ps = conn.prepareStatement(insertSQL);
			ps.executeUpdate();

			// Comparando com a tabela brinquedos e atualizando os dados ...
			updateCategories();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao atualizar dados da tabela categorias: " + sqle);
		}
	}

	public void updateCategories() throws Exception {
		// Desativar o modo de atualização segura
		String disableSafeUpdateSQL = "SET SQL_SAFE_UPDATES = 0";
		ps = conn.prepareStatement(disableSafeUpdateSQL);
		ps.executeUpdate();

		String deleteSQL = "DELETE c FROM categoria c " + "LEFT JOIN brinquedo b ON c.nome = b.categoria "
				+ "WHERE b.categoria IS NULL";

		ps = conn.prepareStatement(deleteSQL);
		ps.executeUpdate();

		// Ativar novamente o modo de atualização segura
		String enableSafeUpdateSQL = "SET SQL_SAFE_UPDATES = 1";
		ps = conn.prepareStatement(enableSafeUpdateSQL);
		ps.executeUpdate();
	}

	public void excluir(Brinquedo brinquedo) throws Exception {
		if (brinquedo == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "DELETE FROM brinquedo WHERE codigo = ?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, brinquedo.getCodigo());
			ps.executeUpdate();
			updateCategories();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	public Brinquedo procurarBrinquedo(int codigoBrinquedo) throws Exception {
		try {
			String SQL = "SELECT * FROM brinquedo WHERE codigo=?";
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, codigoBrinquedo);
			rs = ps.executeQuery();
			if (rs.next()) {
				int codigo = rs.getInt("codigo");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				String imagem = rs.getString("imagem");
				Double valor = rs.getDouble("valor");
				String detalhes = rs.getString("detalhes");

				brinquedo = new Brinquedo(codigo, descricao, categoria, marca, imagem, valor, detalhes);
			}
			return brinquedo;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<Brinquedo> procurarCategoria(String categoriaBrinquedo) throws Exception {
		try {
			String SQL = ("SELECT * FROM brinquedo WHERE categoria=?");
			ps = conn.prepareStatement(SQL);
			ps.setString(1, categoriaBrinquedo);
			rs = ps.executeQuery();
			List<Brinquedo> list = new ArrayList<Brinquedo>();
			while (rs.next()) {
				int codigo = rs.getInt("codigo");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				String imagem = rs.getString("imagem");
				Double valor = rs.getDouble("valor");
				String detalhes = rs.getString("detalhes");
				list.add(new Brinquedo(codigo, descricao, categoria, marca, imagem, valor, detalhes));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<Brinquedo> todosBrinquedos() throws Exception {
		try {
			ps = conn.prepareStatement("SELECT * FROM brinquedo");
			rs = ps.executeQuery();
			List<Brinquedo> list = new ArrayList<Brinquedo>();
			while (rs.next()) {
				int codigo = rs.getInt("codigo");
				String descricao = rs.getString("descricao");
				String categoria = rs.getString("categoria");
				String marca = rs.getString("marca");
				String imagem = rs.getString("imagem");
				Double valor = rs.getDouble("valor");
				String detalhes = rs.getString("detalhes");
				list.add(new Brinquedo(codigo, descricao, categoria, marca, imagem, valor, detalhes));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<String> getAllCategories() throws Exception {
		List<String> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement("SELECT DISTINCT categoria FROM brinquedo");
			rs = ps.executeQuery();

			while (rs.next()) {
				String categoria = rs.getString("categoria");
				list.add(categoria);
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	public List<Brinquedo> getBrinquedosDestaque() throws Exception {
		List<Brinquedo> brinquedosDestaque = new ArrayList<>();
		try {
			conn = ConnectionFactory.getConnection();
			String sql = "SELECT codigo, descricao, imagem, valor FROM brinquedo WHERE codigo IN (2, 3, 7, 8, 9, 14, 23, 24, 25)";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				int codigo = rs.getInt("codigo");
				String descricao = rs.getString("descricao");
				String imagem = rs.getString("imagem");
				double valor = rs.getDouble("valor");

				Brinquedo brinquedo = new Brinquedo(codigo, descricao, imagem, valor);
				brinquedosDestaque.add(brinquedo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
		return brinquedosDestaque;
	}

	public boolean codigoExists(int codigo) throws Exception {
		try (Connection connection = ConnectionFactory.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT COUNT(*) FROM brinquedo WHERE codigo = ?")) {
			preparedStatement.setInt(1, codigo);
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet.next() && resultSet.getInt(1) > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
