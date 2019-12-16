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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Country;
import models.Region;
import tools.HibernateUtil;

/**
 *
 * @author Rizky
 */
public class CountryServlet extends HttpServlet {

    private GeneralDao dao;

    public CountryServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public CountryServlet(GeneralDao dao) {
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
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CountryServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CountryServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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
//        processRequest(request, response);

        List<Country> countries = this.dao.select("Country");
        String redirect = "";
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "insert":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
//                    insert(request, response);
                    break;
//            case "/insert":
//                insertBook(request, response);
//                break;
                case "delete":
//                    redirect = "listRegion.jsp";
//                    request.setAttribute("regions", regions);
//                    delete(request, response);
                    break;
                case "edit":
//                    showForm(request, response);
                    break;
                case "update":
//                    update(request, response);
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

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Country> countries = this.dao.select("Country");
        request.setAttribute("countries", countries);
        List<Region> regions = this.dao.select("Region");
        request.setAttribute("regions", regions);

        RequestDispatcher rd = request.getRequestDispatcher("listCountry.jsp");
        rd.forward(request, response);
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
