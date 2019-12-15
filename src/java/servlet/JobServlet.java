/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import daos.GeneralDao;
import java.io.IOException;
import java.io.PrintWriter;
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

        String redirect = "";
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
                    insert(request, response);
                    break;
//            case "/insert":
//                insertBook(request, response);
//                break;
                case "delete":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
                    delete(request, response);
                    break;
                case "edit":
                    showForm(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                default:
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
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
        String id = request.getParameter("jobId");
        dao.delete(new Job(id));
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
        String id = request.getParameter("jobId");
//        String name = request.getParameter("nameRegion");
        Job job = (Job) this.dao.selectByField("Job", "jobId", id);
        String jobId = job.getJobId();
        String jobTitle = job.getJobTitle();
        int minSalary = job.getMinSalary();
        int maxSalary = job.getMaxSalary();
        request.setAttribute("jobId", jobId);
        request.setAttribute("jobTitle", jobTitle);
        request.setAttribute("minSalary", minSalary);
        request.setAttribute("maxSalary", maxSalary);
        RequestDispatcher rd = request.getRequestDispatcher("updateJob.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Job> jobs = this.dao.select("Job");
        request.setAttribute("jobs", jobs);
        RequestDispatcher rd = request.getRequestDispatcher("listJob.jsp");
        rd.forward(request, response);
    }

//    public int max() {
//        if (dao.getNewId("Region", "regionId") == null) {
//            int id = 1;
//            return id;
//        } else {
//
//            String a = "" + dao.getNewId("Region", "regionId") + "";
//            int max = Integer.parseInt(a);
//            int newId = max + 1;
//
//            return newId;
//
//        }
//    }
    public List<Job> getAll() {
        return this.dao.select("Job");
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
