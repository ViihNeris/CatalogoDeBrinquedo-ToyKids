package br.edu.catalogo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import br.edu.catalogo.model.User;
import br.edu.catalogo.util.ConnectionFactory;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private User user;

	public UserDAO() throws Exception {
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("Erro: \n" + e.getMessage());
		}
	}

	public User searchUser(User auth) throws Exception {
		try {
			String SQL = "SELECT * FROM users WHERE usernames=? AND passwords=?";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, auth.getUser());
			ps.setString(2, auth.getPassword());

			rs = ps.executeQuery();

			if (rs.next()) {
				String usernameSQL = rs.getString("usernames");
				String passwordSQL = rs.getString("passwords");

				user = new User(usernameSQL, passwordSQL);

				System.out.println("Usuário encontrado: " + user.username);
			} else {
				System.out.println("Usuário não encontrado.");
			}
			System.out.println(user);
			return user;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
