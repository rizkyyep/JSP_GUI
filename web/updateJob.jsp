<%-- 
    Document   : createRegion
    Created on : 11 Des 19, 16:38:58
    Author     : ASUS
--%>

<jsp:include page="templates/header.jsp"></jsp:include>
<jsp:include page="templates/sidebar.jsp"></jsp:include>
<jsp:include page="templates/topbar.jsp"></jsp:include>
    <!--     MAIN CONTENT-->
    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Add Job Data</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <strong>Job</strong> Form
                            </div>
                            <div class="card-body card-block">
                                <form action="jobServlet?action=update" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="hf-email" class=" form-control-label">Job Id</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" value="<%= request.getAttribute("jobId")%>" id="idRegion" name="jobId" placeholder="Enter Id..." class="form-control" readonly>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="hf-password" class=" form-control-label">Job Title</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="titleJob" value="<%= request.getAttribute("jobTitle")%>" name="jobTitle" placeholder="Enter Title..." class="form-control" required>
                                    </div>
                                </div>
                                     <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="hf-password" class=" form-control-label">Min Salary</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="minSalary" value="<%= request.getAttribute("minSalary")%>" name="minSalary" placeholder="Enter Min Salary..." class="form-control" required>
                                    </div>
                                </div>
                                     <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="hf-password" class=" form-control-label">Max Salary</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="maxSalary" value="<%= request.getAttribute("maxSalary")%>" name="maxSalary" placeholder="Enter Max Salary..." class="form-control" required>
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
                        <p>Copyright � 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
                        <h1>Halaman Utama!</h1>
                        <a href="jobServlet?action=list"></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!--     END MAIN CONTENT-->

<!-- modal update item -->
<!--<div class="modal fade" id="edit<%%>" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Small Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                lorem
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary">Confirm</button>
            </div>
        </div>
    </div>
</div>-->

<!--                        
<script type="text/javascript">
    function openModal() {
        $('#editItem').modal('show');
    }
</script>-->
<!-- end modal update item -->





<jsp:include page="templates/footer.jsp"></jsp:include>