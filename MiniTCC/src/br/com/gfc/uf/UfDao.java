package br.com.gfc.uf;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.com.gfc.generic.BaseDao;
import br.com.gfc.generic.Conexao;

public class UfDao extends BaseDao<Uf>{

	private Conexao conexao;

	private Statement stmt;

	public UfDao(){
		conexao = new Conexao();
	}

	public void inserir(Uf categoria) {
		try {

			conexao = new Conexao();
			stmt = (Statement) conexao.getConn().createStatement();
			String sql = "insert into estado(estado_desccricao) ";
			sql += " VALUES (?)";

			PreparedStatement preparedStatement = conexao.getConn()
					.prepareStatement(sql);
			preparedStatement.setString(1, categoria.getUf());
			preparedStatement.executeUpdate();
			System.out.print(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conexao.fecharConexao();
		}
	}
	
	public void alterar(Uf categoria) {
		try {
			conexao = new Conexao();
			String sql = "update estado set estado_descricao = ?"
					+ " where estado_codigo = ?";
			PreparedStatement preparedStatement = conexao.getConn()
					.prepareStatement(sql);
			preparedStatement.setString(1, categoria.getUf());
			preparedStatement.setInt(2, categoria.getCodigo());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conexao.fecharConexao();
		}
	}
	
	public void remover(Uf categoria){
		try {
			conexao = new Conexao();
			String sql = "delete from estado where estado_codigo = ?";
			PreparedStatement preparedStatement = conexao.getConn().
					prepareStatement(sql);
			preparedStatement.setInt(1, categoria.getCodigo());
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conexao.fecharConexao();
		}
	}
	
	public List<Uf> listaTudo(){
		conexao = new Conexao();
		List<Uf> categorias = new ArrayList<Uf>();
		try {
			stmt = (Statement) conexao.getConn().createStatement();
			String sql = "select * from estado";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				Uf categoria = new Uf();
				categoria.setCodigo(rs.getInt("estado_codigo"));
				categoria.setUf(rs.getString("estado_descricao"));
				categorias.add(categoria);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conexao.fecharConexao();
		}
		return categorias;
	}
	
	public Uf listaPorId(Integer codigo){
		conexao = new Conexao();
		Uf categoria = new Uf();
		try {
			String sql = "select * from estado where estado_codigo = ?";
			PreparedStatement preparedStatement = conexao.getConn()
					.prepareStatement(sql);
			preparedStatement.setInt(1, codigo);
			ResultSet rs = preparedStatement.executeQuery();
			
			if(rs.next()){
				categoria.setCodigo(rs.getInt("estado_codigo"));
				categoria.setUf(rs.getString("estado_descricao"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			conexao.fecharConexao();
		}
		return categoria;
	}
	
}