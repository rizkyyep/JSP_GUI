<%-- 
    Document   : sidebar
    Created on : Dec 12, 2019, 2:53:03 PM
    Author     : Rizky
--%>

<%
//    @page contentType="text/html" pageEncoding="UTF-8"
%>

<div class="page-wrapper">


    <!-- MENU SIDEBAR-->
    <aside class="menu-sidebar d-none d-lg-block">
        <div class="logo">
            <a href="#">
                <img src="assets/images/icon.png" alt="Metrodata Group" width="60px" height="60px" />
                <font style="color: #007bff; font-size: 13pt" >Metrodata Group</font>
            </a>
        </div>
        <div class="menu-sidebar__content js-scrollbar1">
            <nav class="navbar-sidebar">
                <ul class="list-unstyled navbar__list">
                    <li>
                        <a href="mainView.jsp"><i class="fas fa-home"></i> Dashboard </a>
                    </li>
                    <li class="has-sub">
                        <a class="js-arrow" href="#">
                            <i class="fas fa-folder-open"></i>Manage Data</a>
                        <ul class="list-unstyled navbar__sub-list js-sub-list">
                            <li>
                                <a href="regionServlet?action=list">
                                    <i class="fas fa-map"></i>Region</a> 
                            </li>
                            <li>
                                <a href="employeeServlet?action=list">
                                    <i class="fas fa-users"></i>Employee</a>
                            </li>
                            <li>
                                <a href="departmentServlet?action=list">
                                    <i class="fas fa-building"></i>Department</a>
                            </li>
                            <li>
                                <a href="jobServlet?action=list">
                                    <i class="fas fa-briefcase"></i>Job</a>
                            </li>
                            <li>
                                <a href="countryServlet?action=list">
                                    <i class="fas fa-globe"></i>Country</a>
                            </li>
                            <li>
                                <a href="locationServlet?action=list">
                                    <i class="fas fa-map-marker-alt"></i>Location</a>
                            </li>
                          
                        </ul>
                    </li>
                    <li class="has-sub">

                    <li>
                        <a href="login.jsp">Logout</a>
                    </li>
                </ul>

            </nav>
        </div>
    </aside>
    <!-- END MENU SIDEBAR-->
