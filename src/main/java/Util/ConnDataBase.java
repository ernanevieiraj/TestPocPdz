package Util;

import io.restassured.config.Config;
import org.json.JSONObject;

import javax.swing.*;
import java.io.IOException;
import java.io.ObjectInputFilter;
import java.sql.*;

public class ConnDataBase {
    /** Usada para a conexao com o banco de dados */
    private Connection con = null;

    /** Usada para realizar as instrucoes SQL */
    public Statement stmt;

    /** Retorna os dados das tabelas do banco */
    public ResultSet rs;

    private String endereco;

    private String usuario;

    private String senha;


    public void Conectar() throws IOException {

        endereco = "jdbc:postgresql://localhost:5432/PocPdz";
        usuario = "postgres";
        senha = "juninho22";

        try {
            /** Pasando o nome do Driver do PostgreSQL */
            Class.forName("org.postgresql.Driver");

            /** Obtendo a conexao com o banco de dados*/
            con = DriverManager.getConnection(endereco, usuario, senha);

            /** Criando o Statement */
            stmt = con.createStatement();

            /** Retorna um erro caso nao encontre o driver, ou alguma informacao sobre o mesmo
             * esteja errada */
        } catch (ClassNotFoundException cnfe) {
            JOptionPane.showMessageDialog(null, "Erro ao conectar o driver");
            cnfe.printStackTrace();

            /** Retorna um erro caso exista erro de query SQL */
        } catch (SQLException sqlex) {
            JOptionPane.showMessageDialog(null, "erro na query");
            sqlex.printStackTrace();

        }
    }

    /** Esse metodo quando invocado, realiza a desconexao com o banco */
    public void Desconectar() {

        try {
            con.close();

            /** Retorna um erro caso nao consiga desconectar */
        } catch (SQLException onConClose) {
            JOptionPane.showMessageDialog(null, "Erro ao desconectar o banco");
            onConClose.printStackTrace();
        }
    }

}
