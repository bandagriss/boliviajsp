/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Crud;

import Controlador.Conexion;
import Model.Department;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ivan
 */
public class DepartmentCrud extends Conexion {
    
    public void checkDepartment(Department department){
        try {
            PreparedStatement ps = getConexion().prepareStatement("select name from department where id =?");
            ps.setInt(1, department.getId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                updateDepartment(department);
            }
            else {
                addDepartment(department);
            }
        } catch (Exception ex) {
            System.out.println("Error en checkDepartment ==> "+ex);
        }    
    }
    
    public void addDepartment(Department department){
        try {
            PreparedStatement preparedStatement = getConexion().prepareStatement("insert into department (name) values (?)");
            preparedStatement.setString(1, department.getName());
            preparedStatement.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void deleteDepartment(int id){
        try {
            PreparedStatement preparedStatement = getConexion().prepareStatement("delete from department where id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void updateDepartment(Department department){
        try {
            PreparedStatement preparedStatement = getConexion().prepareStatement("update department set name=? where id =?");
            preparedStatement.setString(1, department.getName());
            preparedStatement.setInt(2, department.getId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Department> getAllDepartments(){
        List<Department> departments = new ArrayList<Department>();
        try {
            Statement statement = getConexion().createStatement();
            ResultSet rs = statement.executeQuery("select * from department");
            while(rs.next()){
                Department department = new Department();
                department.setId(rs.getInt("id"));
                department.setName(rs.getString("name"));
                departments.add(department);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return departments;
    }
    
    public Department getDepartmentById(int id){
        Department department = new Department();
        try {
            PreparedStatement preparedStatement = getConexion().prepareStatement("select * from department where id = ?");
            
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()){
                department.setId(rs.getInt("id"));
                department.setName(rs.getString("name"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return department;
    }
}
