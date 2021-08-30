package Util;


import io.restassured.response.Response;

import java.util.LinkedHashMap;

import static io.restassured.RestAssured.given;

public class RestUtils {

    public static Response response;

    public static void post(LinkedHashMap<String, Object> json, String endpoint){
        response = given()
                    .header("Content-Type","application/json")
                    .and()
                    .body(json)
                    .when()
                    .post(endpoint)
                    .then()
                    .extract().response();
    }

    public static void put(LinkedHashMap<String, Object> json, String endpoint){
        response = given()
                .header("Content-Type","application/json")
                .and()
                .body(json)
                .when()
                .put(endpoint)
                .then()
                .extract().response();
    }

    public static void get(String endpoint){
        response = given()
                .header("Content-Type","application/json")
                .and()
                .when()
                .get(endpoint)
                .then()
                .extract().response();
    }

    public static void delete(String endpoint){
        response = given()
                .header("Content-Type","application/json")
                .and()
                .when()
                .delete(endpoint);
    }


}
