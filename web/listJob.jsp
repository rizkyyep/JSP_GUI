<%-- 
    Document   : testJSP
    Ceeated on : 11 Des 19, 8:43:05
    Author     : ASUS
--%>

<%@page import="models.Job"%>
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
                <div class="flash-data" data-flashdata="<%= request.getAttribute("flash")%>"> 
                <script>
                    const flashdata = $('.flash-data').data('flashdata');
                    if (flashdata) {
                        swal({
                            title: 'Information',
                            text: 'Success ' + flashdata,
                            type: 'success'
                        });
                    }
                </script>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="overview-wrap">
                        <h2 class="title-1">Job Data </h2>
                        <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                            <i class="zmdi zmdi-plus"></i>add item</button>
                    </div>
                </div>
            </div>
            <div class="row m-t-25">
                <div class="col-12">
                    <table id="listItem" class="table table-borderless table-striped table-earning">
                        <% List<Job> jobs = (ArrayList<Job>) request.getAttribute("jobs"); %>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Min Salary</th>
                                <th>Max Salary</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Job job : jobs) {%>
                            <tr>
                                <td><%=job.getJobId()%></td>
                                <td><%= job.getJobTitle()%></td>
                                <td><%=job.getMinSalary()%></td>
                                <td><%= job.getMaxSalary()%></td>
                                <td class="text-right">
                                    <a href="<%=job.getJobId()%>" class="view_data"
                                       data-toggle="modal" data-placement="top" id="<%=job.getJobId()%>" data-target="#editModal"
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>                                     
                                    </a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="jobServlet?action=delete&jobId=<%= job.getJobId()%>&jobTitle=<%=job.getJobTitle()%>" 
                                       class="delete-btn" data-toogle="modal" title="Delete">
                                        <i class="fas fa-trash fa-lg" style="color:#f03434;"></i>
                                    </a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="copyright">
                        <p>Copyright © 2018 Color-lib. All rights reserved. Template by <a href="https://colorlib.com">Color-lib</a>.</p>
                        <h1>Halaman Utama</h1>
                        <a href="jobServlet?action=list">Job</a>
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
                <h5 class="fas fa-briefcase" id="smallmodalLabel"> Create New Job Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="jobServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="input-group col-12 col-md-8 m-b-10">
                            <span class="input-group-addon"><i class="fas fa-briefcase"></i></span>
                            <input id="jobTitle" type="text" class="form-control" name="jobTitle" placeholder="Title" required>
                        </div>
                        <div class="input-group col-12 col-md-8 m-b-10">
                            <span class="input-group-addon"><i class="fas fa-dollar-sign"></i></span>
                            <input id="minSalary" min="0" type="number" class="form-control" name="minSalary" placeholder="Minimal Salary" required>
                        </div>
                        <div class="input-group col-12 col-md-8 m-b-10">
                            <span class="input-group-addon"><i class="fas fa-dollar-sign"></i></span>
                            <input id="maxSalary" min="0" type="number" class="form-control" name="maxSalary" placeholder="Maximal Salary" required>
                        </div>
                    </div>
                    <div class="m-b-10">
                        <center>
                            <input type="submit" name="submit" value="Save" class="btn btn-primary"/>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button> 
                        </center>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end modal add item -->

<!-- modal edit item -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Edit Form Job</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body" id="data">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- End modal edit item -->

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

<script type="text/javascript">
    function success() {
        swal({
            title: "Success Saved!",
            text: "You Success Saved New Data!",
            type: "success",
            timer: 2500
        });
    }
</script>

<script type="text/javascript">
    $('.delete-btn').on('click', function () {
        event.preventDefault();

        const href = $(this).attr("href");
        swal({
            title: 'Are you sure?',
            text: "Delete Data",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.value) {
                window.location.href = href;
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("body").on('click', '.view_data', function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "jobServlet?action=byId&id=" + id,
                type: "GET",
                data: {id: id},
                success: function (data) {
                    $("#data").html(data);
                    $("#editModal").modal('show', {backdrop: 'true'});
                }
            });
        });
    });
</script>

<jsp:include page="templates/footer.jsp"></jsp:include>
