/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author ivan
 */
public class Consultas extends Conexion {

	public boolean autentication(String usuario, String contraseña)
	{
		PreparedStatement pst = null;
		ResultSet rs = null;

		try{
			String consulta = "select * from usuarios where usuario = ? and pass = ?";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, usuario);
			pst.setString(2, contraseña);
		        rs = pst.executeQuery();	

			if(rs.next())
			{
				return true;
			}


		}catch(Exception e){
			System.err.println("Error "+e);
		}finally{
			try{
				if(getConexion() != null) getConexion().close();
				if(pst != null) pst.close();
				if(rs != null) rs.close();
			}catch(Exception e){
				System.err.println("Error "+e);
			}
				
		}
		
		return false;
	}

	public boolean registrar(String nombre,  String apellido,  String usuario, String password)
	{
		PreparedStatement pst = null;

		try{
			String consulta = "insert into usuarios (nombre, apellido, usuario, pass) values (?,?,?,?)";
			pst = getConexion().prepareStatement(consulta);
			pst.setString(1, nombre);
			pst.setString(2, apellido);
			pst.setString(3, usuario);
			pst.setString(4, password);
                        System.out.println(pst);
			if(pst.executeUpdate() == 1)
			{
				return true; 
			}

		}catch(Exception e){
			
		}finally{
			try{
			if(getConexion() != null) getConexion().close();
			if(pst != null) pst.close();
			}catch(Exception e){
				System.err.println("Error "+e);
			}
		}
		return false;

	}
	
}
