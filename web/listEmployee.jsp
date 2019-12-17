<%-- 
    Document   : listEmployee
    Created on : Dec 16, 2019, 2:29:28 AM
    Author     : Elsa
--%>

<%@page import="models.Job"%>
<%@page import="models.Department"%>
<%@page import="models.Department"%>
<%@page import="models.Employee"%>
<%@page import="models.Region"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="templates/head.html"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>

    <!-- MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Employee Data</h2>
                            <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                        </div>
                                                <button class="btn btn-primary" onclick="window.print()"><i class="fa fa-book">&nbsp;&nbsp;Print</i></button>

                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <!--<div class="table-responsive table--no-card m-b-30">-->
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                        <% List<Employee> employee = (ArrayList<Employee>) request.getAttribute("employee"); %>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>EMAIL</th>
                                <th>SALARY</th>
                                <th class="text-right">ACTION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Employee em : employee) {%>
                            <tr>
                                <td><%=em.getEmployeeId()%></td>
                                <td><%= em.getFirstName()%> <%= em.getLastName()%></td>

                                <td><%= em.getEmail()%></td>
                                <td><%= em.getSalary()%></td>

                                <td class="text-right">
                                    <a href="employeeServlet?action=detail&id=<%=em.getEmployeeId()%> "
                                       class="btn btn-outline-primary" data-toggle="tooltip" data-placement="top" title="Details"><i class="fas fa-list-alt"></i></a>

                                    <a href="employeeServlet?action=edit&id=<%= em.getEmployeeId()%>"
                                       class="btn btn-outline-success" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fas fa-edit"></i></a>

                                    <a href="employeeServlet?action=delete&id=<%=em.getEmployeeId()%> "
                                       class="btn btn-outline-danger" data-toggle="tooltip" data-placement="top" title="Delete" onclick=""><i class="fas fa-trash"></i></a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    <!--</div>-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
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
                <h5 class="modal-title" id="smallmodalLabel">Add New Employee</h5>

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body card-block">
                        <form action="employeeServlet?action=insert" method="post" class="form-horizontal">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">First Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="firstName" name="firstName" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Last Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="lastName" name="lastName" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="email-input" class=" form-control-label">Email</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="email" id="email" name="email" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Phone Number</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Salary</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="salary" name="salary" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Commission Pct</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="text" id="commissionPct" name="commissionPct" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="text-input" class=" form-control-label">Hire Date</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <input type="date" id="hireDate" name="hireDate" class="form-control">
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Job</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="jobId" id="jobId" class="form-control-sm form-control">
                                        <% List<Job> jobId = (ArrayList<Job>) request.getAttribute("jobId"); %>

                                        <option value="0">Please select</option>
                                        <%for (Job em : jobId) {%>
                                        <option value="<%= em.getJobId()%>"><%= em.getJobTitle()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Manager</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="managerId" id="managerId" class="form-control-sm form-control">
                                        <% List<Employee> managerId = (ArrayList<Employee>) request.getAttribute("managerId"); %>

                                        <option value="0">Please select</option>
                                        <%for (Employee mn : managerId) {%>
                                        <option value="<%= mn.getEmployeeId()%>"><%= mn.getFirstName()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label for="selectSm" class=" form-control-label">Department</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <select name="departmentId" id="departmentId" class="form-control-sm form-control">
                                        <% List<Department> departmentId = (ArrayList<Department>) request.getAttribute("departmentId"); %>

                                        <option value="0">Please select</option>
                                        <%for (Department dm : departmentId) {%>
                                        <option value="<%= dm.getDepartmentId()%>"><%= dm.getDepartmentName()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> Save
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">
                                    <i class="fa fa-times-circle"></i> Cancel
                                </button>
                            </div>
                        </form>

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
                                    {"orderable": false, "targets": 2}
                                ]
                            }
                    );
                });
            </script>


            <jsp:include page="templates/footer.jsp"></jsp:include>

