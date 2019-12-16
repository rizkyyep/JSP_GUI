package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import models.Region;
import tools.HibernateUtil;

/**
 *
 * @author ASUS
 */
public class RegionServlet extends HttpServlet {

    private GeneralDao dao;

    public RegionServlet() {
        this.dao = new GeneralDao(HibernateUtil.getSessionFactory());
    }

    public RegionServlet(GeneralDao dao) {
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

//            List<Region> regions = this.dao.select("Region");
//            request.setAttribute("regions", regions);
//            RequestDispatcher rd = request.getRequestDispatcher("listRegion.jsp");
//            rd.forward(request, response);
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
        List<Region> regions = this.dao.select("Region");

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
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(new Region(id));
        response.sendRedirect("regionServlet?action=list");
    }

    private void insert(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("nameRegion");
        dao.save(new Region(max(), name));
        response.sendRedirect("regionServlet?action=list");
    }

    private void update(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String id = request.getParameter("idRegion");
        String name = request.getParameter("nameRegion");
        dao.save(new Region(Integer.parseInt(id), name));
        response.sendRedirect("regionServlet?action=list");
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String id = request.getParameter("id");
        Region region = (Region) this.dao.selectByField("Region", "regionId", id);
        String regionId = region.getRegionId().toString();
        String regionName = region.getRegionName();
        request.setAttribute("regionId", regionId);
        request.setAttribute("regionName", regionName);
        RequestDispatcher rd = request.getRequestDispatcher("updateRegion.jsp");
        rd.forward(request, response);
    }

    private void list(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Region> regions = this.dao.select("Region");
        request.setAttribute("regions", regions);
        RequestDispatcher rd = request.getRequestDispatcher("listRegion.jsp");
        rd.forward(request, response);
    }
    
     public int max() {
        if (dao.getNewId("Region", "regionId") == null) {
            int id = 1;
            return id;
        } else {

            String a = "" + dao.getNewId("Region", "regionId") + "";
            int max = Integer.parseInt(a);
            int newId = max + 1;

            return newId;

        }}
        public List<Region> getAll(){
     return this.dao.select("Region");
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
