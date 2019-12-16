<%-- 
    Document   : listCountry
    Created on : Dec 16, 2019, 10:28:42 AM
    Author     : Rizky
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Country"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="templates/header.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>

    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Location Data</h2>
                            <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                                <i class="zmdi zmdi-plus"></i>add item
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <table id="listItem" class="table table-responsive table-borderless table-striped table-earning">
                        <% List<Country> countries = (ArrayList<Country>) request.getAttribute("countries"); %>
                        <thead>
                            <tr>
                                <th>Country Id</th>
                                <th>Country Name</th>
                                <th>Region</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Country loc : countries) {%>
                            <tr>
                                <td><%= loc.getCountryId()%></td>
                                <td><%= loc.getCountryName()%></td>
                                <td><%= loc.getRegionId().getRegionName() %></td>
                                <td class="text-right">
                                    <a href="locationServlet?action=edit&idLoc=<%= loc.getCountryId()%>" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="locationServlet?action=delete&idLoc=<%= loc.getCountryId()%> " 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Delete"><i class="fas fa-trash fa-lg" style="color:#f03434;"></i></a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <button class="btn btn-primary" onclick="coba()">coba nih</button>
                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MAIN CONTENT-->


<!-- Declaration of Datatables -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                     "columnDefs": [
                        {"orderable": false, "targets": 3}
                    ]
                });
    });
</script>



<jsp:include page="templates/footer.jsp"></jsp:include>