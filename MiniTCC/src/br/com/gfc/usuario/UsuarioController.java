package br.com.gfc.usuario;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import br.com.gfc.generic.BaseController;
@ManagedBean
@SessionScoped
public class UsuarioController extends BaseController<Usuario>{

	public UsuarioController() {
		super(Usuario.class);
		this.dao = new UsuarioDao();
	}

	@Override
	public void limpar() {
		this.objeto = new Usuario();
	}
	
	public String lista(){
		limpar();
		return "listar";
	}
	
}
