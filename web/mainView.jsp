<%-- 
    Document   : mainView
    Created on : 11 Des 19, 14:20:14
    Author     : ASUS
--%> 

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="daos.GeneralDao"%>
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
                            <h2 class="title-1">Dashboard</h2>
                           
                                <div><%
                                    Date now = new Date();
                                    SimpleDateFormat sf = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
                                    out.println(sf.format(now));
                                %></div>
                    </div>
                </div>
            </div>
            <div class="row m-t-25">
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c1">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-account-o"></i>
                                </div>
                                <div class="text">
                                    <h2>11</h2>
                                    <span>Region</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c2">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-shopping-cart"></i>
                                </div>
                                <div class="text">
                                    <h2>388,688</h2>
                                    <span>Department</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c3">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-calendar-note"></i>
                                </div>
                                <div class="text">
                                    <h2>1,086</h2>
                                    <span>Countries</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="overview-item overview-item--c4">
                        <div class="overview__inner">
                            <div class="overview-box clearfix">
                                <div class="icon">
                                    <i class="zmdi zmdi-money"></i>
                                </div>
                                <div class="text">
                                    <h2>
                                        <!--<%= request.getAttribute("countRows")%>-->
                                    </h2>
                                    <span>Job</span>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>



            <jsp:include page="templates/footer.jsp"></jsp:include>
