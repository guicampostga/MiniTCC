package br.com.gfc.funcionario;

import java.util.Date;

public class Funcionario {

	private Integer codigo;
	
	private String nome;
	
	private String cpf;
	
	private String rg;
	
	private Date dataNasc;
	
	private String endereco;
	
	private String numeroCasa;
	
	private String complemento;
	
	private String bairro;
	
	private String cidade;
	
	private Integer uf;
	
	private String telefone;
	
	private String email;
	
	private Integer funcao;

	public Integer getCodigo() {
		return codigo;
	}

	public String getNome() {
		return nome;
	}

	public String getCpf() {
		return cpf;
	}

	public String getRg() {
		return rg;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public String getEndereco() {
		return endereco;
	}

	public String getNumeroCasa() {
		return numeroCasa;
	}

	public String getComplemento() {
		return complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public Integer getUf() {
		return uf;
	}

	public String getTelefone() {
		return telefone;
	}

	public String getEmail() {
		return email;
	}

	public Integer getFuncao() {
		return funcao;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public void setNumeroCasa(String numeroCasa) {
		this.numeroCasa = numeroCasa;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public void setUf(Integer uf) {
		this.uf = uf;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setFuncao(Integer funcao) {
		this.funcao = funcao;
	}
}