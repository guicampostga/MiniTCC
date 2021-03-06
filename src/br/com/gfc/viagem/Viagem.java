package br.com.gfc.viagem;

import java.util.Date;

public class Viagem {
	private Integer codigo;
	private Integer passageiroId;
	private Integer destinoId;
	private Integer origemId;
	private Integer motoristaId;
	private Integer veiculoId;
	private Date viagemData;
	private String enderecoEntrega;
	private String bairroEntrega;
	private String numeroEntrega;
	private String complementoEntrega;
	private String origem;
	private String destino;
	
	
	public String getOrigem() {
		return origem;
	}
	public void setOrigem(String origem) {
		this.origem = origem;
	}
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	
	
	public Integer getCodigo() {
		return codigo;
	}
	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}
	public Integer getPassageiroId() {
		return passageiroId;
	}
	public void setPassageiroId(Integer passageiroId) {
		this.passageiroId = passageiroId;
	}
	public Integer getDestinoId() {
		return destinoId;
	}
	public void setDestinoId(Integer destinoId) {
		this.destinoId = destinoId;
	}
	public Integer getOrigemId() {
		return origemId;
	}
	public void setOrigemId(Integer origemId) {
		this.origemId = origemId;
	}
	public Integer getMotoristaId() {
		return motoristaId;
	}
	public void setMotoristaId(Integer motoristaId) {
		this.motoristaId = motoristaId;
	}
	public Integer getVeiculoId() {
		return veiculoId;
	}
	public void setVeiculoId(Integer veiculoId) {
		this.veiculoId = veiculoId;
	}
	public Date getViagemData() {
		return viagemData;
	}
	public void setViagemData(Date viagemData) {
		this.viagemData = viagemData;
	}
	public String getEnderecoEntrega() {
		return enderecoEntrega;
	}
	public void setEnderecoEntrega(String enderecoEntrega) {
		this.enderecoEntrega = enderecoEntrega;
	}
	public String getBairroEntrega() {
		return bairroEntrega;
	}
	public void setBairroEntrega(String bairroEntrega) {
		this.bairroEntrega = bairroEntrega;
	}
	public String getNumeroEntrega() {
		return numeroEntrega;
	}
	public void setNumeroEntrega(String numeroEntrega) {
		this.numeroEntrega = numeroEntrega;
	}
	public String getComplementoEntrega() {
		return complementoEntrega;
	}
	public void setComplementoEntrega(String complementoEntrega) {
		this.complementoEntrega = complementoEntrega;
	}
}
