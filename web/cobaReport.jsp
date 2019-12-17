<%-- 
    Document   : cobaReport
    Created on : Dec 17, 2019, 4:50:41 PM
    Author     : Elsa
--%>

<%@ page contentType="application/pdf" %>
 
<%@ page trimDirectiveWhitespaces="true"%>
 
<%@ page import="net.sf.jasperreports.engine.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>

<%
    Connection conn=null;
     try {
        //Connecting to the MySQL database
 
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = (Connection) DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sys");

 
        //Loading Jasper Report File from Local file system
 
        String jrxmlFile = session.getServletContext().getRealPath(request.getContextPath())+"report/ReportRegion.jrxml";
        InputStream input = new FileInputStream(new File(jrxmlFile));
 
        //Generating the report
 
        JasperReport jasperReport = JasperCompileManager.compileReport(input);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, null, conn);
 
        //Exporting the report as a PDF
 
        JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
 
    } catch (FileNotFoundException e) {
        e.printStackTrace();
    } catch (JRException e) {
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    finally {
        if(conn!=null){
            conn.close();
        }
    }
%>
