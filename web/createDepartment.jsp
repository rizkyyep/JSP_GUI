<%-- 
    Document   : createDepartment
    Created on : Dec 16, 2019, 8:42:57 PM
    Author     : HP
--%>

<%@page import="models.Location"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Employee"%>
<%@page import="java.util.List"%>
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
                            <h2 class="title-1">Add Department Data</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Department</strong> Form
                            </div>
                            <div class="card-body card-block">
                                <form action="departmentServlet?action=insert" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="hf-email" class=" form-control-label">Id</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="idDepartment" name="idDepartment" placeholder="Enter Department Id" class="form-control">
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

                                <% List<Employee> employees = (ArrayList<Employee>) request.getAttribute("employees"); %>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="managerId" class=" form-control-label">Manager</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="manager" class="form-control" required>
                                            <option value="">Choose Manager</option>
                                            <% for (Employee employee : employees) {%>
                                            <option value="<%= employee.getEmployeeId() %>"> <%= employee.getEmployeeId()%> - <%= employee.getFirstName()%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <% List<Location> locations = (ArrayList<Location>) request.getAttribute("locations"); %>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="locationId" class=" form-control-label">Manager</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="city" class="form-control" required>
                                            <option value="">Choose City</option>
                                            <% for (Location location : locations) {%>
                                            <option value="<%= location.getLocationId() %>"> <%= location.getLocationId() %> - <%= location.getCity() %></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>

                                <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                            </form>
                        </div>
                        <div class="card-footer">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <p>Copyright © 2019 Java Bootcamp 32. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MAIN CONTENT-->


<jsp:include page="templates/footer.jsp"></jsp:include>s