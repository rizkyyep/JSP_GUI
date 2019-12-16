<%-- 
    Document   : testJSP
    Created on : 11 Des 19, 8:43:05
    Author     : ASUS
--%>

<%@page import="models.Region"%>
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
                            <h2 class="title-1">Region Data</h2>
                            <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                                <i class="zmdi zmdi-plus"></i>add item</button>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <!--<div class="table-responsive table--no-card m-b-30">-->
                        <table id="listItem" class="table table-borderless table-striped table-earning">
                            <!--<table id="myTable" class="table table-borderless table-striped table-earning">-->
                        <% List<Region> regions = (ArrayList<Region>) request.getAttribute("regions"); %>
                        <thead>
                            <tr>
                                <th>Region ID</th>
                                <th>Region Name</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Region region : regions) {%>
                            <tr>
                                <td><%=region.getRegionId()%></td>
                                <td><%= region.getRegionName()%></td>
                                <td class="text-right">
<!--
                                    <a data-toggle="modal" data-target="editmodal" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" data="<%= region.getRegionId()%>" style="color:#26a65b;"></i></a>
                                       
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="regionServlet?action=delete&id=<%=region.getRegionId()%> " 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Delete"><i class="fas fa-trash fa-lg" style="color:#f03434;"></i></a>-->
                                    <a href="regionServlet?action=edit&id=<%= region.getRegionId()%>" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="regionServlet?action=delete&id=<%=region.getRegionId()%> " 
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

            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">


                        <button class="btn btn-primary" onclick="coba()">coba nih</button>


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
                <form action="regionServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Region Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="nameRegion" name="nameRegion" placeholder="Enter Region Name..." class="form-control">
                        </div>
                    </div>
                    <center>
                        <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <!--<button type="button" class="btn btn-primary">Confirm</button>-->
            </div>
        </div>
    </div>
</div>
<!-- end modal add item -->

<!-- modal add item -->
<div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="smallmodalLabel">Small Modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="regionServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="hf-password" class=" form-control-label">Region Name</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="nameRegion" name="nameRegion" placeholder="Enter Region Name..." class="form-control">
                        </div>
                    </div>
                    <center>
                        <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                    </center>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
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
                        {"orderable": false, "targets": 2}
                    ]
                }
        );

    });
    
    
    
    
    
    
    
    function coba() {
        swal({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {
                swal(
                        'Deleted!',
                        'Your file has been deleted.',
                        'success'
                        )
            }
        })
    }
</script>



<jsp:include page="templates/footer.jsp"></jsp:include>
