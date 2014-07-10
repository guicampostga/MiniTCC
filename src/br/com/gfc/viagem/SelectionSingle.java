package br.com.gfc.viagem;

import javax.annotation.PostConstruct;

import org.primefaces.model.LazyDataModel;

public class SelectionSingle {
	
	private LazyDataModel<Viagem> viagemDM;
	private Viagem viagemSelecionada;
	
   
	public LazyDataModel<Viagem> getViagemDM() {
		return viagemDM;
	}

	public void setViagemDM(LazyDataModel<Viagem> viagemDM) {
		this.viagemDM = viagemDM;
	}

	@PostConstruct
    public void init() {
        viagemDM = (LazyDataModel<Viagem>) new ViagemController().getListaDM();
    }
	
	 public Viagem getViagemSelecionada() {
			return viagemSelecionada;
		}

		public void setViagemSelecionada(Viagem viagemSelecionada) {
			this.viagemSelecionada = viagemSelecionada;
		}
}
