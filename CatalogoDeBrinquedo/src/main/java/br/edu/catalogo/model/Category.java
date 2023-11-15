package br.edu.catalogo.model;

public class Category {
	public String name;
	public String image;
	
	public Category() {}
	
	public Category(String name, String image) {
		super();
		this.name = name;
		this.image = image;
	}
	
	public String getNameCategory() {
		return name;
	}

	public String getImageCategory() {
		return image;
	}
	
	public void setNameCategory(String name) {
		this.name = name;
	}

	public void setImageCategory(String image) {
		this.image = image;
	}
}
