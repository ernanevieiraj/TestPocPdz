package Entities;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cliente {

    LinkedHashMap<String, Object> cliente = new LinkedHashMap<>();

    public Cliente() {
    }

    public Cliente (Object id, Object name, Object email, Object salary){
        cliente.put("nome", name);
        cliente.put("email", email);
        cliente.put("salario", salary);
        cliente.put("id", id);
    }

    public LinkedHashMap<String, Object> getCliente(){
        return cliente;
    }

    public void setCliente(Map <String, Object> map){
        this.cliente.putAll(map);
    }

    public void setCliente(String key, Object value){
        this.cliente.put(key, value);
    }

}
