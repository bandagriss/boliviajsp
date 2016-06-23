/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Crud.DepartmentCrud;
import Model.Department;
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
public class DepartmentController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/CEdepartments.jsp";
    private static String LIST_DEPARTMENT = "/departments.jsp";
    private DepartmentCrud cru;
    
    public DepartmentController(){
        super();
        cru = new DepartmentCrud();
    }
    
    //protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
    //    response.setContentType("text/html;charset=UTF-8");
    //    PrintWriter out = response.getWriter();
    //}
    
    

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
            cru.deleteDepartment(id);
            forward = LIST_DEPARTMENT;
            request.setAttribute("departments", cru.getAllDepartments());
        } else if(action.equalsIgnoreCase("edit")){
            System.out.println("quiere editar");
            forward = INSERT_OR_EDIT;
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println(id);
            Department department = cru.getDepartmentById(id);
            request.setAttribute("department", department);
        } else if(action.equalsIgnoreCase("listDepartment")){
            forward = LIST_DEPARTMENT;
            request.setAttribute("departments", cru.getAllDepartments());
        }else{
            forward = INSERT_OR_EDIT;
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
        
        Department department = new Department();
        System.out.println("Aqui viene do post name");
        department.setName(request.getParameter("name"));
        if(request.getParameter("id")!= ""){
            department.setId(Integer.parseInt(request.getParameter("id")));
        }
        cru.checkDepartment(department);
        RequestDispatcher view = request.getRequestDispatcher(LIST_DEPARTMENT);
        request.setAttribute("departments", cru.getAllDepartments());
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
