package br.com.gfc.usuario;

import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import br.com.gfc.generic.BaseDao;
import br.com.gfc.generic.Conexao;


public class UsuarioDao extends BaseDao<Usuario>{
	
	private Conexao conexao;

	private Statement stmt;
	
	public  UsuarioDao() {
		conexao = new Conexao();
	}
	
	public void inserir(Usuario usuario) {
		try {

			super.inserir(usuario);
			StringBuilder sql = new StringBuilder();
			sql.append(" insert into users (");
			sql.append(" username,");
			sql.append(" password,");
			sql.append(" enabled,");
			sql.append(" funcionario_codigo");
			sql.append(") values (");
			sql.append(" ?, ?, ?, ?");
			sql.append(")");

			PreparedStatement preparedStatement = conexao.getConn()
					.prepareStatement(sql.toString());
			preparedStatement.setString(1, usuario.getUsername());
			preparedStatement.setString(2, usuario.getPassword());
			preparedStatement.setString(3, usuario.getEnabled());
			preparedStatement.setInt(4, usuario.getFuncionario());
			preparedStatement.executeUpdate();
			System.out.print(sql);
			
			super.inserir(usuario);
			StringBuilder sql2 = new StringBuilder();
			sql2.append(" insert into authorities (");
			sql2.append(" username,");
			sql2.append(" authority");
			sql2.append(") values (");
			sql2.append(" ?, ?");
			sql2.append(")");

			PreparedStatement preparedStatement2 = conexao.getConn()
					.prepareStatement(sql2.toString());
			preparedStatement2.setString(1, usuario.getUsername());
			preparedStatement2.setString(2, usuario.getAuthority());
			preparedStatement2.executeUpdate();
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage("Salvo com sucesso"));
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			super.conexao.fecharConexao();
		}
	}

}
