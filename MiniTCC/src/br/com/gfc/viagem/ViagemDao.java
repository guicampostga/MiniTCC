package br.com.gfc.viagem;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.gfc.generic.BaseDao;
import br.com.gfc.generic.Conexao;

public class ViagemDao extends BaseDao<Viagem> {

	private Statement stmt;
	private Conexao conexao;

	public ViagemDao() {
		conexao = new Conexao();
	}

	public List<Viagem> listaTudo() {
		List<Viagem> viagens = new ArrayList<Viagem>();
		Viagem viagem;
		String sql = "select * from viagem";
		if (super.condicaoFixa != "" && super.condicaoFixa != null) {
			sql += " left join motorista on viagem.motorista_codigo = motorista.motorista_codigo "
					+ " left join cidade c on origem_codigo = c.cidade_codigo"
					+ " left join cidade c2 on destino_codigo = c2.cidade_codigo where "
					+ super.condicaoFixa + " group by cliente_codigo";
		}
		conexao = new Conexao();

		try {
			stmt = conexao.getConn().createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				viagem = new Viagem();
				viagem.setCodigo(rs.getInt("viagem_codigo"));
				viagem.setOrigemId(rs.getInt("origem_codigo"));
				viagem.setDestinoId(rs.getInt("destino_codigo"));
				if (super.condicaoFixa != "" && super.condicaoFixa != null) {
					viagem.setOrigem(rs.getString("c.cidade_descricao"));
					viagem.setDestino(rs.getString("c2.cidade_descricao"));
				}
				viagem.setMotoristaId(rs.getInt("motorista_codigo"));
				viagem.setVeiculoId(rs.getInt("veiculo_codigo"));
				viagem.setViagemData(rs.getDate("viagem_data_saida"));
				viagem.setEnderecoEntrega(rs
						.getString("viagem_endereco_entrega"));
				viagem.setBairroEntrega(rs.getString("viagem_bairro_entrega"));
				viagem.setNumeroEntrega(rs.getString("viagem_numero_entrega"));
				viagem.setComplementoEntrega(rs
						.getString("viagem_complemento_entrega"));
				viagens.add(viagem);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conexao.fecharConexao();
			super.conexao.fecharConexao();
		}

		return viagens;
	}

}
