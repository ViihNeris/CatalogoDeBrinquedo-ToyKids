package br.edu.catalogo.model;

public class Brinquedo {
	private int codigo;
	private String descricao;
	private String categoria;
	private String marca;
	private String imagem;
	private double valor;
	private String detalhes;

	public Brinquedo() {
	}

	public Brinquedo(int codigo, String descricao, String categoria, String marca, String imagem, double valor,
			String detalhes) {
		super();
		this.codigo = codigo;
		this.descricao = descricao;
		this.categoria = categoria;
		this.marca = marca;
		this.imagem = imagem;
		this.valor = valor;
		this.detalhes = detalhes;
	}

	public Brinquedo(String categoria) {
		super();
		this.categoria = categoria;
	}
	
    public Brinquedo(int codigo, String descricao, String imagem, double valor) {
    	this.codigo = codigo;
        this.descricao = descricao;
        this.imagem = imagem;
        this.valor = valor;
    }

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getValor() {
	    return String.format("%.2f", valor);
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public String getDetalhes() {
		return detalhes;
	}

	public void setDetalhes(String detalhes) {
		this.detalhes = detalhes;
	}
}
