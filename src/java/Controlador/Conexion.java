/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ivan
 */
public class Conexion {
    private String username = "roy";
    private String password = "bandagriss";
    private String host = "localhost";
    private String port = "5432";
    private String database = "bolivia";
    private String classname = "org.postgresql.Driver";
    private String url = "jdbc:postgresql://"+host+":"+port+"/"+database;
    private Connection con;
    
    public Conexion(){
        try {
            Class.forName(classname);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e){
            System.err.println("Error "+e);
        } catch (SQLException e){
            System.err.println("Error "+e);
        }
        
    }
    
    public Connection getConexion(){
        return con;
    }
    
    public static void main(String[] args){
        Conexion con = new Conexion();
    }
    
}
