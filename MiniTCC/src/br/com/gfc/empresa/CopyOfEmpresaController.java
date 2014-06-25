package br.com.gfc.empresa;

import java.util.ArrayList;
import java.util.List;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

import br.com.gfc.empresa.Empresa;

@ManagedBean
@SessionScoped
public class CopyOfEmpresaController {
	

	private Empresa empresa;
	private EmpresaDao empresaDao;
	private List<Empresa> empresas;

	public CopyOfEmpresaController() {
		empresa = new Empresa();
		empresaDao = new EmpresaDao();
		empresas = new ArrayList<Empresa>();
	}
	private DataModel<Empresa> empresaDM;

	public String incluir() {
		this.empresaDao.inserir(this.empresa);
		this.empresa = new Empresa();
		return "atualizar";
	}
	
	public String alterar() {
		this.empresaDao.alterar(this.empresa);
		this.empresa = new Empresa();
		return "";
	}

	public String remover() {
		this.empresa = empresaDM.getRowData();
		this.empresaDao.remover(this.empresa);
		this.empresa = new Empresa();
		return "";
	}

	public String exibirFormularioIncluir() {
		this.empresa = new Empresa();
		return "exibirFormularioIncluir";
	}

	public String exibirFormularioEditar() {
		this.empresa = empresaDM.getRowData();
		return "exibirFormularioEditar";
	}
	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	public List<Empresa> getEmpresas() {
		this.listar();
		return empresas;
	}

	public void setEmpresas(List<Empresa> empresas) {
		this.empresas = empresas;
	}
	
	public DataModel<Empresa> getEmpresaDM() {
		this.listar();
		empresaDM = new ListDataModel<Empresa>(listar());
		return empresaDM;
	}

	public void setEmpresaDM(DataModel<Empresa> empresaDM) {
		this.empresaDM = empresaDM;
	}

	public List<Empresa> listar() {
		this.empresas = this.empresaDao.listaTudo();
		return this.empresas;
	}
	

}
