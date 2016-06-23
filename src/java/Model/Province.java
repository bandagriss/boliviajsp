/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author ivan
 */
public class Province {
    private int id;
    private int department_id;
    private String name;
    private String name_department;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the department_id
     */
    public int getDepartment_id() {
        return department_id;
    }

    /**
     * @param department_id the department_id to set
     */
    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the name_department
     */
    public String getName_department() {
        return name_department;
    }

    /**
     * @param name_department the name_department to set
     */
    public void setName_department(String name_department) {
        this.name_department = name_department;
    }
    
   
    
}
