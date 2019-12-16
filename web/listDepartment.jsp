<%-- 
    Document   : listDepartment
    Created on : Dec 16, 2019, 10:15:51 AM
    Author     : Rizky
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Department"%>
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
                        <% List<Department> department = (ArrayList<Department>) request.getAttribute("departments"); %>
                        <thead>
                            <tr>
                                <th>Department Id</th>
                                <th>Name</th>
                                <th>Manager</th>
                                <th>City</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Department loc : department) {%>
                            <tr>
                                <td><%= loc.getDepartmentId()%></td>
                                <td><%= loc.getDepartmentName()%></td>
                                <td><%= loc.getManagerId().getFirstName() %></td>
                                <td><%= loc.getLocationId().getCity() %></td>
                                <td class="text-right">


                                    <a href="locationServlet?action=edit&idLoc=<%= loc.getLocationId()%>" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="locationServlet?action=delete&idLoc=<%= loc.getLocationId()%> " 
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


<!-- modal add item -->
<div class="modal fade" id="additem" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Small Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">

                <!--<button type="button" class="btn btn-primary">Confirm</button>-->
            </div>
        </div>
    </div>
</div>
<!-- end modal add item -->


<!-- Declaration of Datatables -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 6}
                    ]
                }
        );
    });
</script>




<jsp:include page="templates/footer.jsp"></jsp:include>