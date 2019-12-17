<%@page import="models.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <link rel="shortcut icon" href="assets/images/icon/icon_metrodata.ico" type="image/x-icon" />

        <!-- Fontfaces CSS-->
        <link href="assets/css/font-face.css" rel="stylesheet" media="all">
        <link href="assets/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="assets/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="assets/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="assets/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="assets/vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="assets/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="assets/css/theme.css" rel="stylesheet" media="all">
        
        <!-- Datatables CSS-->
        <link href="assets/vendor/datatables/datatables.css" rel="stylesheet" type="text/css"/>
        
        <!-- sweetalert css-->
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'>
        
        <!-- Jquery JS-->
        <script src="assets/vendor/jquery-3.2.1.min.js" type="text/javascript"></script>
        
        <!-- Datatables JS-->
        <script src="assets/vendor/datatables/datatables.js" type="text/javascript"></script>
        
        <!-- sweetalert js-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
    </head>
    <body>
       <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Region Data</h2>
                            <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                               
                        </div>
                        <button class="btn btn-primary" onclick="window.print()"><i class="fa fa-book">&nbsp;&nbsp;Print</i></button>
                        <a href="regionServlet?action=getReport">Print Ireport</a>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <!--<div class="table-responsive table--no-card m-b-30">-->
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions"); %>
                        <thead>
                            <tr>
                                <th>Region ID</th>
                                <th>Region Name</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Region region : regions) {%>
                            <tr>
                                <td><%=region.getRegionId()%></td>
                                <td><%= region.getRegionName()%></td>
                                <td class="text-right">
                                    <a href="regionServlet?action=edit&id=<%= region.getRegionId()%>" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="regionServlet?action=delete&id=<%=region.getRegionId()%> " 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Delete"><i class="fas fa-trash fa-lg" style="color:#f03434;"></i></a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <!--</div>-->
                </div>
            </div>

        </div>
    </div>
</div>
<!-- END MAIN CONTENT-->
    </body>
</html>