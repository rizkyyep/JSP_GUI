<%-- 
    Document   : listDepartment
    Created on : Dec 16, 2019, 10:15:51 AM
    Author     : Rizky
--%>

<%@page import="models.Location"%>
<%@page import="models.Employee"%>
<%@page import="models.Department"%>
<%@page import="java.util.ArrayList"%>
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
                            <h2 class="title-1">Department Data</h2>

                            <!--                            <button data-toggle="modal" data-target="#addItem" class="au-btn au-btn-icon au-btn--blue">
                                                            <i class="zmdi zmdi-plus"></i>add item</button>-->
                            <a href="departmentServlet?action=addForm" class="au-btn au-btn-icon au-btn--blue"><i class="zmdi zmdi-plus"></i>add item</a>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <!--<div class="table-responsive table--no-card m-b-30">-->
                        <table id="listItem" class="table table-responsive table-borderless table-striped table-earning">
                            <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                        <% List<Department> departments = (ArrayList<Department>) request.getAttribute("departments"); %>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Manager</th>
                                <th>City</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Department department : departments) {%>
                            <tr>
                                <td><%= department.getDepartmentId()%></td>
                                <td><%= department.getDepartmentName()%></td>
                                <td><%= department.getManagerId().getFirstName()%></td>
                                <td><%= department.getLocationId().getCity()%></td>
                                <td class="text-right">
                                    <a href="departmentServlet?action=edit&id=<%= department.getDepartmentId()%>" 
                                       data-toggle="tooltip" data-placement="top"<%= department.getDepartmentId()%>"
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>                                       
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="departmentServlet?action=delete&id=<%=department.getDepartmentId()%> " 
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

<!-- modal add item -->
<div class="modal fade" id="addItem" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Small Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="departmentServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-email" class=" form-control-label">Id</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="hf-email" name="hf-email" placeholder="Enter Department Id" class="form-control">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="nameDepartment" name="nameDepartment" placeholder="Enter Department Name" class="form-control">
                        </div>
                    </div>
                    <center>
                        <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </center>
                </form>
            </div>
            <!--            <div class="modal-footer">
            
                            <button type="button" class="btn btn-primary">Confirm</button>
                        </div>-->
        </div>
    </div>
</div>
<!-- end modal add item -->


<!-- Declaration of Datatables -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable();
//                {
//                    "columnDefs": [
//                        {"orderable": false, "targets": 4}
//                    ]
//                }
//        );

    });
</script>

<jsp:include page="templates/footer.jsp"></jsp:include>