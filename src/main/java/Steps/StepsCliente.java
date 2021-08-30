package Steps;

import Entities.Cliente;
import Massas.MassasCliente;
import Util.ConnDataBase;
import Util.RestUtils;
import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import org.junit.Assert;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;


public class StepsCliente {

    Cliente cliente = new Cliente();
    String endpoint = "http://localhost:8080/clientes/";
    String idCliente;
    ConnDataBase connDataBase = new ConnDataBase();

    @Dado("que eu preencha o nome {string} do cliente")
    public void que_eu_preencha_o_nome_do_cliente(String name) {
        cliente.setCliente("nome", name);
    }

    @Dado("preencha o email {string} do cliente")
    public void preencha_o_email_do_cliente(String email) {

        cliente.setCliente("email", email);
    }

    @Dado("preencha o salario {string} do cliente")
    public void preencha_o_salario_do_cliente(String salary) {

        cliente.setCliente("salario", salary);
    }

    @Dado("que eu tenha clientes cadastrados")
    public void que_eu_tenha_clientes_cadastrados() {
        cliente.setCliente("nome", "nomeExemplo");
        cliente.setCliente("email", "email@exemplo.com");
        cliente.setCliente("salario", "1111.11");
        RestUtils.post(cliente.getCliente(), endpoint);
    }

    @Quando("eu fizer a requisicao Del para delecao de cliente")
    public void eu_fizer_a_requisicao_del_para_delecao_de_cliente() {
       RestUtils.delete(endpoint+idCliente);
    }

    @Quando("eu fizer a requisicao Get para listagem de clientes")
    public void eu_fizer_a_requisicao_get_para_listagem_de_clientes() {
        RestUtils.get(endpoint);
    }

    @Quando("eu fizer a requisicao Post para cadastrar o cliente")
    public void eu_fizer_a_requisicao_post_para_cadastrar_o_cliente() {
        RestUtils.post(cliente.getCliente(), endpoint);
    }

    @Quando("eu fizer a requisicao PUT para delecao de cliente")
    public void eu_fizer_a_requisicao_put_para_delecao_de_cliente() {
        RestUtils.put(cliente.getCliente(), endpoint);
    }

    @Quando("eu alterar os dados do cliente nome {string} email {string} salario {string}")
    public void eu_alterar_os_dados_do_cliente_nome_email_salario(String nome, String email, String salario) {
        cliente.setCliente("nome", nome);
        cliente.setCliente("email", email);
        cliente.setCliente("salario", salario);
        cliente.setCliente("id_cliente", idCliente);
    }

    @Entao("devera retornar o status code {string}")
    public void devera_retornar_o_status_code(String statusEsperado) {
        String statusCode = Integer.toString(RestUtils.response.getStatusCode());
        Assert.assertEquals(statusEsperado, statusCode);
    }

    @Entao("guardar o valor do id do cliente")
    public void guardar_o_valor_do_id_do_cliente() {
        idCliente = RestUtils.response.path("id_cliente").toString();
    }

    @Entao("devera persistir o valor {string} no campo {string} no banco de dados")
    public void devera_persistir_o_valor_no_campo_no_banco_de_dados(String valor, String campo) throws IOException, SQLException {
        connDataBase.Conectar();
        String query = "select " + campo  + " from cliente where id_cliente = " + "'" + idCliente + "'";
        ResultSet rs = connDataBase.stmt.executeQuery(query);
        rs.next();
        Assert.assertEquals(valor, RestUtils.response.path(campo).toString());
        Assert.assertEquals(valor, rs.getString(campo));
        connDataBase.Desconectar();
    }

    @Entao("devera retornar os clientes cadastrados")
    public void devera_retornar_os_clientes_cadastrados()  throws IOException, SQLException {
        connDataBase.Conectar();
        String query = "select count (*) as contagem from cliente";
        ResultSet rs = connDataBase.stmt.executeQuery(query);
        rs.next();
        assert (Integer.parseInt(rs.getString("contagem")) > 0);
        connDataBase.Desconectar();
    }

    @Entao("devera apagar o registro do banco de dados")
    public void devera_apagar_o_registro_do_banco_de_dados() throws IOException, SQLException {
        connDataBase.Conectar();
        String query = "select count (*) as contagem from cliente where id_cliente = " + "'" + idCliente + "'";;
        ResultSet rs = connDataBase.stmt.executeQuery(query);
        rs.next();
        assert (Integer.parseInt(rs.getString("contagem")) == 0);
        connDataBase.Desconectar();
    }


}
