<%-- 
    Document   : createRegion
    Created on : 11 Des 19, 16:38:58
    Author     : ASUS
--%>

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
                            <h2 class="title-1">Add Region Data</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Region</strong> Form
                            </div>
                            <div class="card-body card-block">
                                <form action="regionServlet?action=insert" method="post" class="form-horizontal">
                                    <!--                                    <div class="row form-group">
                                                                            <div class="col col-md-3">
                                                                                <label for="hf-email" class=" form-control-label">Region Id</label>
                                                                            </div>
                                                                            <div class="col-12 col-md-9">
                                                                                <input type="text" id="hf-email" name="hf-email" placeholder="Enter Id..." class="form-control">
                                                                            </div>
                                                                        </div>-->
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="hf-password" class=" form-control-label">Region Name</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="nameRegion" name="nameRegion" placeholder="Enter Region Name..." class="form-control">
                                        </div>
                                    </div>
                                    <input type="submit" name="submit" value="Save" class="btn btn-primary btn-sm"/>
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
                            <a href="regionServlet?action=list">Region</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END MAIN CONTENT-->


<jsp:include page="templates/footer.jsp"></jsp:include>