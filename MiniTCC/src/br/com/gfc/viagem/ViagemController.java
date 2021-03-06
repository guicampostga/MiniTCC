package br.com.gfc.viagem;


import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import br.com.gfc.generic.BaseController;
import br.com.gfc.generic.LibUtils;

@SessionScoped
@ManagedBean
public class ViagemController extends BaseController<Viagem> {

	
	
	public ViagemController() {
		super(Viagem.class);
		this.dao = new ViagemDao();
	}

	@Override
	public void limpar() {
		this.objeto = new Viagem();
	}

	public String incluir() {
		super.incluir();
		return "listar";
	}

	public String alterar() {
		super.alterar();
		return "listar";
	}
	
	protected Integer clienteId;
	public List<Viagem> listar() {
		String parametro = LibUtils.getParameter("clienteId");
		if (parametro != null)
			this.clienteId = Integer.valueOf(parametro);
		if (this.clienteId != null) {
			dao.setCondicaoFixa(" cliente_codigo = " + this.clienteId);
		}
		return super.listar();
	}
	
}
