package br.edu.catalogo.model;

public class User {
	public String username;
	public String password;

	public User() {
	}

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUser() {
		return username;
	}

	public String getPassword() {
		return password;
	}

	public void setUser(String user) {
		this.username = user;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
