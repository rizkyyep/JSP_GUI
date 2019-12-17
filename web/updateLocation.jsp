<%-- 
    Document   : updateLocation
    Created on : Dec 16, 2019, 4:29:29 AM
    Author     : Rizky
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Country"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<jsp:include page="templates/head.html"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
    <!--     MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Add Location Data</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Location</strong> Form
                            </div>
                            <div class="card-body card-block">
                                <form action="locationServlet?action=update" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="locationId" class=" form-control-label">Location Id</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="number" id="locationId" value="<%= request.getAttribute("locationId") %>" name="locationId" class="form-control" readonly="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="locationAddress" class=" form-control-label">Street Address</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="streetAddress" value="<%= request.getAttribute("streetAddress") %>" name="streetAddress" placeholder="Enter Street Address..." class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="Postal Code" class=" form-control-label">Postal Code</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="postalCode" value="<%= request.getAttribute("postalCode") %>" name="postalCode" placeholder="Enter Postal Code..." class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="City" class=" form-control-label">City</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="city" value="<%= request.getAttribute("city") %>" name="city" placeholder="Enter City..." class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="stateProvince" class=" form-control-label">State Province</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="stateProvince" value="<%= request.getAttribute("stateProvince") %>" name="stateProvince" placeholder="Enter State Province..." class="form-control">
                                        </div>
                                    </div>
                                <% List<Country> countries = (ArrayList<Country>) request.getAttribute("countryAll"); %>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="countryId" class=" form-control-label">Country</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <select name="countryId" class="form-control" required>
                                            <option value="<%= request.getAttribute("countryId") %>">
                                                <%= request.getAttribute("countryId") %> - <%= request.getAttribute("countryName") %>
                                            </option>
                                            
                                            
                                            <option value="<%= request.getAttribute("countryId") %>">----------------</option>
                                            
                                            
                                            <% for (Country coun : countries) {%>
                                            <option value="<%= coun.getCountryId()%>"><%= coun.getCountryId()%> - <%= coun.getCountryName()%></option>
                                            <% }%>
                                        </select>
                                    </div>
                                </div>
                                <center>
                                    <button class="btn btn-primary" type="submit" name="submit"><i class="fas fa-save"></i> Save</button>
                                    <!--<input type="submit" name="submit" value="Save" class="btn btn-primary"/>-->
                                    <a href="locationServlet?action=list" class="btn btn-secondary" data-dismiss="modal">Cancel</a>
                                </center>
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
                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                        <h1>Halaman Utama!</h1>
                        <a href="locationServlet?action=list">Location</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="templates/footer.jsp"></jsp:include>
