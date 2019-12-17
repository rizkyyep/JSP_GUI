/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Department;
import models.Employee;
import models.Job;
import tools.HibernateUtil;

/**
 *
 * @author Elsa
 */
public class EmployeeServlet extends HttpServlet {

    private GeneralDao dao;

    public EmployeeServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public EmployeeServlet(GeneralDao dao) {
        this.dao = dao;
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

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
        // processRequest(request, response);
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
                    insert(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "edit":
                    showForm(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                default:
                    list(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ParseException ex) {
            Logger.getLogger(EmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        doGet(request, response);
    }

    public List<Employee> getAll() {
        return this.dao.select("Employee");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(new Employee(id));
        response.sendRedirect("employeeServlet?action=list");
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
       // String employeeId = request.getParameter("employeeId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String salary = request.getParameter("salary");
        String hireDate = request.getParameter("hireDate");
        String commissionPct =request.getParameter("commissionPct");
        String jobId = request.getParameter("jobId");
        String managerId = request.getParameter("managerId");
        String departmentId = request.getParameter("departmentId");

        String startDate = hireDate;
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = sdf1.parse(startDate);
        java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());

dao.save(new Employee(max(), firstName,
                lastName, email, phoneNumber, sqlStartDate, Integer.parseInt(salary),
               Integer.parseInt(commissionPct), new Employee(Integer.parseInt(managerId)),
                new Job(jobId), new Department(Short.parseShort(departmentId))))   ;     
        response.sendRedirect("employeeServlet?action=list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String employeeId = request.getParameter("employeeId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String salary = request.getParameter("salary");
        String jobId = request.getParameter("jobId");
        String managerId = request.getParameter("managerId");
        String departmentId = request.getParameter("departmentId");

        dao.save(new Employee(Integer.parseInt(employeeId), firstName, lastName, email, Integer.parseInt(salary), new Job(jobId), new Employee(Integer.parseInt(managerId)), new Department(departmentId)));
        response.sendRedirect("employeeServlet?action=list");
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Employee employee = (Employee) this.dao.selectByField("Employee", "employeeId", id);
        String employeeId = employee.getEmployeeId().toString();
        String employeeFName = employee.getFirstName();
        String employeeLName = employee.getLastName();
        String email = employee.getEmail();
        String salary = employee.getSalary().toString();

        request.setAttribute("employeeId", employeeId);
        request.setAttribute("firstName", employeeFName);
        request.setAttribute("lastName", employeeLName);
        request.setAttribute("email", email);
        request.setAttribute("salary", salary);

        RequestDispatcher rd = request.getRequestDispatcher("updateEmployee.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Employee> employee = this.dao.select("Employee");
        request.setAttribute("employee", employee);

        List<Job> jobId = this.dao.select("Job");
        request.setAttribute("jobId", jobId);

        List<Department> departmentId = this.dao.select("Department");
        request.setAttribute("departmentId", departmentId);

        List<Employee> managerId = this.dao.select("Employee");
        request.setAttribute("managerId", managerId);

        RequestDispatcher rd = request.getRequestDispatcher("listEmployee.jsp");
        rd.forward(request, response);
    }

    public int max() {
        if (dao.getNewId("Employee", "employeeId") == null) {
            int id = 1;
            return id;
        } else {

            String a = "" + dao.getNewId("Employee", "employeeId") + "";
            int max = Integer.parseInt(a);
            int newId = max + 1;

            return newId;

        }
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
