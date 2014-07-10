package br.com.gfc.funcionario;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.com.gfc.generic.BaseController;
import br.com.gfc.generic.LibUtils;

@ManagedBean
@SessionScoped
public class FuncionarioController extends BaseController<Funcionario>{

	public FuncionarioController() {
		super(Funcionario.class);
		this.dao = new FuncionarioDao();
	}

	@Override
	public void limpar() {
		this.objeto = new Funcionario();
	}
	
	@Override
	public String incluir() {
		String CPF1 = this.objeto.getCpf().replace(".", "");
		String CPF2 = CPF1.replace("-", "");
		if (LibUtils.isValidCPF(CPF2)) {
			return super.incluir();
		} else {
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage("CPF Invalido!"));
			return "";
		}
	}

	public String alterar() {
		String CPF1 = this.objeto.getCpf().replace(".", "");
		String CPF2 = CPF1.replace("-", "");
		if (LibUtils.isValidCPF(CPF2)) {
			return super.alterar();
		} else {
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage("CPF Invalido!"));
			return "";
		}
	}

}
