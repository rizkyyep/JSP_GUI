/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Job;
import tools.HibernateUtil;

/**
 *
 * @author USER
 */
public class JobServlet extends HttpServlet {

    private GeneralDao dao;

    public JobServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public JobServlet(GeneralDao dao) {
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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet JobServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JobServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        List<Job> jobs = this.dao.select("Job");
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
                case "byId":
                    byId(request, response);
                    break;
                default:
                    list(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
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

    private void delete(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String jobId = request.getParameter("jobId");
        String jobTitle = request.getParameter("jobTitle");
        dao.delete(new Job(jobId, jobTitle));
        response.sendRedirect("jobServlet?action=list");
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String jobId = request.getParameter("jobId");
        String jobTitle = request.getParameter("jobTitle");
        String minSalary = request.getParameter("minSalary");
        String maxSalary = request.getParameter("maxSalary");
        dao.save(new Job(jobId, jobTitle, Integer.parseInt(minSalary), Integer.parseInt(maxSalary)));
        response.sendRedirect("jobServlet?action=list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String jobId = request.getParameter("jobId");
        String jobTitle = request.getParameter("jobTitle");
        String minSalary = request.getParameter("minSalary");
        String maxSalary = request.getParameter("maxSalary");
        dao.save(new Job(jobId, jobTitle, Integer.parseInt(minSalary), Integer.parseInt(maxSalary)));
        response.sendRedirect("jobServlet?action=list");
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String jobId = request.getParameter("id");
        Job job = (Job) this.dao.selectByField("Job", "jobId", jobId);
        String id = job.getJobId();
        String title = job.getJobTitle();
        String min = job.getMinSalary().toString();
        String max = job.getMaxSalary().toString();
        request.setAttribute("jobId", id);
        request.setAttribute("jobTitle", title);
        request.setAttribute("minSalary", min);
        request.setAttribute("maxSalary", max);
        RequestDispatcher rd = request.getRequestDispatcher("editJob.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Job> jobs = this.dao.select("Job");
        request.setAttribute("jobs", jobs);
        RequestDispatcher rd = request.getRequestDispatcher("listJob.jsp");
        rd.forward(request, response);
    }

    public List<Job> getAll() {
        return this.dao.select("Job");
    }

    private void byId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Job job = (Job) this.dao.selectByField("Job", "jobId", id);
        List<Job> jobAll = this.dao.select("Job");
        
        request.setAttribute("jobId", job.getJobId());
        request.setAttribute("jobTitle", job.getJobTitle());
        request.setAttribute("minSalary", job.getMinSalary());
        request.setAttribute("maxSalary", job.getMaxSalary());
        request.setAttribute("jobAll", jobAll);
        
        RequestDispatcher rd = request.getRequestDispatcher("editJob.jsp");
        rd.forward(request, response);//To change body of generated methods, choose Tools | Templates.
    }
    /**
     * /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}