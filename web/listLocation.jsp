<%-- 
    Document   : listLocation
    Created on : Dec 15, 2019, 1:55:51 PM
    Author     : Rizky
--%>

<%@page import="models.Department"%>
<%@page import="models.Employee"%>
<%@page import="models.Country"%>
<%@page import="models.Location"%>
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
                            <h2 class="title-1">Location Data</h2>
                            <button data-toggle="modal" data-target="#additem" class="au-btn au-btn-icon au-btn--blue">
                                <i class="zmdi zmdi-plus"></i>add item
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-12">
                        <table id="listItem" class="table table-responsive table-borderless table-striped table-earning">
                        <% List<Location> locations = (ArrayList<Location>) request.getAttribute("locations"); %>
                        <thead>
                            <tr>
                                <th>Location Id</th>
                                <th>Street Address</th>
                                <th>Postal Code</th>
                                <th>City</th>
                                <th>State Province</th>
                                <th>Country Name</th>
                                <th class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (Location loc : locations) {%>
                            <tr>
                                <td><%= loc.getLocationId()%></td>
                                <td><%= loc.getStreetAddress()%></td>
                                <td><%= loc.getPostalCode()%></td>
                                <td><%= loc.getCity()%></td>
                                <td><%= loc.getStateProvince()%></td>
                                <td><%= loc.getCountryId().getCountryName()%></td>
                                <td class="text-right">

                                    <a href="<%= loc.getLocationId()%>" class="view_data" 
                                       data-toggle="modal" id="<%= loc.getLocationId()%>" data-target="#editModal">
                                        <i class="fas fa-edit fa-lg" style="color:#26a65b;"></i>
                                    </a>


<!--                                    <a href="locationServlet?action=edit&idLoc=<%= loc.getLocationId()%>" 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Edit"><i class="fas fa-edit fa-lg" style="color:#26a65b;"></i></a>-->
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="locationServlet?action=delete&idLoc=<%= loc.getLocationId()%> " 
                                       data-toggle="tooltip" data-placement="top" 
                                       title="Delete"><i class="fas fa-trash fa-lg" style="color:#f03434;"></i></a>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">

                        <p>Copyright © 2018 Colorlib. All rights reserved. Template by <a href="https://colorlib.com">Colorlib</a>.</p>
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
                <h5 class="modal-title" id="smallmodalLabel">Add Location</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="locationServlet?action=insert" method="post" class="form-horizontal">
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="locationAddress" class=" form-control-label">Street Address</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="streetAddress" name="streetAddress" placeholder="Enter Street Address..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="Postal Code" class=" form-control-label">Postal Code</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="postalCode" name="postalCode" placeholder="Enter Postal Code..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="City" class=" form-control-label">City</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="city" name="city" placeholder="Enter City..." class="form-control" required="">
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="stateProvince" class=" form-control-label">State Province</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <input type="text" id="stateProvince" name="stateProvince" placeholder="Enter State Province..." class="form-control">
                        </div>
                    </div>
                    <% List<Country> countries = (ArrayList<Country>) request.getAttribute("countries"); %>
                    <div class="row form-group">
                        <div class="col col-md-3">
                            <label for="countryId" class=" form-control-label">Country</label>
                        </div>
                        <div class="col-12 col-md-9">
                            <select name="countryId" class="form-control" required>
                                <option value="">Choose A Country</option>
                                <% for (Country coun : countries) {%>
                                <option value="<%= coun.getCountryId()%>"><%= coun.getCountryId()%> - <%= coun.getCountryName()%></option>
                                <% }%>
                            </select>
                        </div>
                    </div>

                    <center>
                        <button class="btn btn-primary" type="submit" name="submit"><i class="fas fa-save"></i> Save</button>
                        <!--<input type="submit" name="submit" value="Save" class="btn btn-primary"/>-->
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    </center>
                </form>
            </div>
            <div class="modal-footer">

                <!--<button type="button" class="btn btn-primary">Confirm</button>-->
            </div>
        </div>
    </div>
</div>
<!-- end modal add item -->



<!-- memulai modal nya. pada id="$myModal" harus sama dengan data-target="#myModal" pada tombol di atas -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel">Edit Location</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!-- memulai untuk konten dinamis -->
            <!-- lihat id="data_siswa", ini yang di pangging pada ajax di bawah -->
            <div class="modal-body" id="data">

            </div>
            <!-- selesai konten dinamis -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>



<!-- Declaration of Datatables -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#listItem').DataTable(
                {
                    "columnDefs": [
                        {"orderable": false, "targets": 6}
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
            icon: "success",
            timer: 2500
        });
    }


//    function coba() {
//        swal({
//            title: 'Are you sure?',
//            text: "You won't be able to revert this!",
//            type: 'warning',
//            showCancelButton: true,
//            confirmButtonColor: '#3085d6',
//            cancelButtonColor: '#d33',
//            confirmButtonText: 'Yes, delete it!'
//        }).then((result) => {
//            if (result.value) {
//                swal(
//                        'Deleted!',
//                        'Your file has been deleted.',
//                        'success'
//                        )
//            }
//        })
//    }
</script>


<script type="text/javascript">
    $(document).ready(function () {
        $("body").on('click', '.view_data', function () {
            var id = $(this).attr("id");
            $.ajax({
                url: "locationServlet?action=byId&id="+id,
                type: "GET",
                data: {id: id },
                success: function (data) {
                    $("#data").html(data);
                    $("#editModal").modal('show', {backdrop: 'true'});
                }
            });
        });
    });


//    // ini menyiapkan dokumen agar siap grak :)
//    $(document).ready(function () {
//        // yang bawah ini bekerja jika tombol lihat data (class="view_data") di klik
//        $('.view_data').click(function (e) {
//            // membuat variabel id, nilainya dari attribut id pada button
//            // id="'.$row['id'].'" -> data id dari database ya sob, jadi dinamis nanti id nya
//            var id = $(this).attr("id");
//            // memulai ajax
//            $.ajax({
//                url: 'locationServlet?action=byId&id='+id, // set url -> ini file yang menyimpan query tampil detail data siswa
//                method: 'post', // method -> metodenya pakai post. Tahu kan post? gak tahu? browsing aja :)
//                data: {id: id}, // nah ini datanya -> {id:id} = berarti menyimpan data post id yang nilainya dari = var id = $(this).attr("id");
//                success: function (data) {		// kode dibawah ini jalan kalau sukses
//                    $('#data').html(data);	// mengisi konten dari -> <div class="modal-body" id="data_siswa">
//                    $('#editModal').modal("show");	// menampilkan dialog modal nya
//                }
//            });
//        });
//    });
</script>



<jsp:include page="templates/footer.jsp"></jsp:include>