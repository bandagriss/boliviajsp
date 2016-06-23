/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Crud.DepartmentCrud;
import Crud.ProviceCrud;
import Model.Province;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ivan
 */
public class ProvinceController extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/CEprovince.jsp";
    private static String LIST_PROVINCE = "/provinces.jsp";
    private ProviceCrud pro;
    private DepartmentCrud dep;
    
    public ProvinceController(){
        super();
        pro = new ProviceCrud();
        dep = new DepartmentCrud();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
        if(action.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(request.getParameter("id"));
            pro.deleteProvince(id);
            forward = LIST_PROVINCE;
            request.setAttribute("provinces", pro.getAllProvinces());
        }else if(action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT;
            int id = Integer.parseInt(request.getParameter("id"));
            Province province = pro.getProvinceById(id);
            System.out.println(province.getDepartment_id());
            request.setAttribute("province", province);
            request.setAttribute("departments", dep.getAllDepartments());
        }else if(action.equalsIgnoreCase("listProvince")){
            forward = LIST_PROVINCE;
            request.setAttribute("provinces", pro.getAllProvinces());
        }else{
            forward = INSERT_OR_EDIT;
            request.setAttribute("departments", dep.getAllDepartments());
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Province province = new Province();
        if(request.getParameter("id")!= ""){
            province.setId(Integer.parseInt(request.getParameter("id")));
        }
        province.setDepartment_id(Integer.parseInt(request.getParameter("department_id")));
        province.setName(request.getParameter("name"));
        pro.ckeckProvince(province);
        RequestDispatcher view = request.getRequestDispatcher(LIST_PROVINCE);
        request.setAttribute("provinces", pro.getAllProvinces());
        view.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
