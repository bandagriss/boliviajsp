/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Crud;

import Controlador.Conexion;
import Model.Province;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ivan
 */
public class ProviceCrud extends Conexion {
    
    public void ckeckProvince(Province province){
        try {
            PreparedStatement ps = getConexion().prepareStatement("select * from province where id = ?");
            ps.setInt(1, province.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                updateProvince(province);
            }
            else{
                addProvince(province);
            }
        } catch (Exception ex) {
            System.out.println("Error en CheckProvince verificar ==>" +ex);
        }
    }
    
    public void addProvince(Province province){
        try {
            PreparedStatement ps = getConexion().prepareStatement("insert into province (department_id, name) values (?,?)");
            ps.setInt(1, province.getDepartment_id());
            ps.setString(2, province.getName());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteProvince(int id){
        try {
            PreparedStatement ps = getConexion().prepareStatement("delete from province where id=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateProvince(Province province){
        try {
            PreparedStatement ps = getConexion().prepareStatement("update province set department_id = ?, name=? where id = ?");
            ps.setInt(1, province.getDepartment_id());
            ps.setString(2, province.getName());
            ps.setInt(3, province.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Province> getAllProvinces(){
        List<Province> provinces = new ArrayList<Province>();
        try {
            Statement st = getConexion().createStatement();
            ResultSet rs = st.executeQuery("select * from province");
            while(rs.next()){
                Province province = new Province();
                province.setId(rs.getInt("id"));
                province.setDepartment_id(rs.getInt("department_id"));
                province.setName(rs.getString("name"));
                provinces.add(province);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return provinces;
    }
    
    public Province getProvinceById(int id){
        Province province = new Province();
        try {
            PreparedStatement ps = getConexion().prepareStatement("select * from province where id=?");
            ps.setInt(1, id);
            ResultSet rs =  ps.executeQuery();
            if(rs.next()){
                province.setId(rs.getInt("id"));
                province.setDepartment_id(rs.getInt("department_id"));
                province.setName(rs.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("provinceid ====>");
        return province;
    }
    
    public List<Province> findProvincesById(int id){
        List<Province> provinces = new ArrayList<Province>();
        try {
            PreparedStatement ps = getConexion().prepareStatement("select * from province where department_id = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            PreparedStatement ps2 = getConexion().prepareStatement("select * from department where id = ?");
            ps2.setInt(1, id);
            ResultSet rs2 = ps2.executeQuery();
            String nameDepartment = "No encontrado xD";
            if(rs2.next()){
                nameDepartment = rs2.getString("name");
            }
            
            while(rs.next()){
                Province province = new Province();
                province.setId(rs.getInt("id"));
                province.setDepartment_id(rs.getInt("department_id"));
                province.setName_department(nameDepartment);
                province.setName(rs.getString("name"));
                provinces.add(province);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return provinces;
    }
    
    
    
}
