<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>THOMAS - Check Digital Signatures</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/icons/favicon.svg" type="image/x-icon"/>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/css/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/adminGeneral.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>
    <style>
        #suggestionList {
            border: 1px solid #ccc;
            background: white;
            max-height: 200px;
            overflow-y: auto;
            cursor: pointer;
        }
        #suggestionList .list-group-item:hover {
            background: #f0f0f0;
        }
    </style>
</head>

<body id="page-top">
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/">
            <div class="sidebar-brand-text mx-3">THOMAS Admin</div>
        </a>
        <hr class="sidebar-divider my-0"/>
        <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <hr class="sidebar-divider"/>
        <li class="nav-item active">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-table"></i>
                <span>Bảng</span>
            </a>
            <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Các đối tượng:</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/users">Người dùng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/belts">Sản phẩm</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/reviews">Đánh giá</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/coupons">Coupon</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/orders">Đơn hàng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/collections">Bộ sưu tập</a>
                    <a class="collapse-item active" href="${pageContext.request.contextPath}/admin/table/check-digital-signatures">Check chữ ký điện tử</a>
                </div>
            </div>
        </li>
        <hr class="sidebar-divider"/>
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button class="btn btn-white border border-dark" style="color: black" data-bs-toggle="modal" data-bs-target="#checkSignatureModal">
                    Kiểm tra chữ ký điện tử
                </button>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2"/>
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.auth.name}</span>
                            <c:choose>
                                <c:when test="${sessionScope.auth.image!=null}">
                                    <img src="${pageContext.request.contextPath}${sessionScope.auth.image}" alt="User Avatar" width="35" height="35" class="rounded-circle me-2"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/assets/icons/user.svg" alt="User Avatar" width="35" height="35" class="rounded-circle me-2"/>
                                </c:otherwise>
                            </c:choose>
                        </a>
                    </li>
                </ul>
            </nav>

            <div class="container-fluid">
                <h1 class="h3 mb-2 text-gray-800">Kiểm tra chữ ký điện tử</h1>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Danh sách chữ ký điện tử</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Ngày ký</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>ID</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Ngày ký</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach var="signature" items="${signatures}">
                                    <tr>
                                        <td>${signature.id}</td>
                                        <td>${signature.invoiceCode}</td>
                                        <td>${signature.signedDate}</td>
                                        <td>${signature.status}</td>
                                        <td class="text-center">
                                            <a href="${pageContext.request.contextPath}/admin/table/check-digital-signatures/details?id=${signature.id}" class="btn btn-dark fa-solid fa-eye"></a>
                                            <button class="btn btn-danger fa-solid fa-trash-can" data-bs-toggle="modal" data-bs-target="#removeModal" data-id="${signature.id}"></button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © THOMAS 2021</span>
                    </div>
                </div>
            </footer>
        </div>
    </div>

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="removeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="removeModalLabel">Bạn có muốn xóa chữ ký điện tử này?</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body removeModalBody"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white border border-dark" data-bs-dismiss="modal" style="color: black">Hủy</button>
                    <form class="deleteBtn" method="POST" action="${pageContext.request.contextPath}/admin/table/check-digital-signatures">
                        <input type="hidden" name="id" class="signatureId"/>
                        <button type="submit" class="btn btn-dark" style="color: white; background-color: black">Xóa vĩnh viễn</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="checkSignatureModal" tabindex="-1" aria-labelledby="checkSignatureModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/admin/table/check-digital-signatures" method="POST">
                    <input type="hidden" name="action" value="check">
                    <div class="modal-header">
                        <h5 class="modal-title" id="checkSignatureModalLabel">Kiểm tra chữ ký điện tử</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container mt-2">
                            <div class="mb-3">
                                <label for="invoiceCode" class="form-label">Mã hóa đơn</label>
                                <input type="text" class="form-control" id="invoiceCode" name="invoiceCode" required autocomplete="off"/>
                            </div>
                            <div class="mb-3">
                                <label for="signatureData" class="form-label">Dữ liệu chữ ký</label>
                                <textarea class="form-control" id="signatureData" name="signatureData" rows="4" required></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="submit" class="btn btn-primary">Kiểm tra</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/datatable.js"></script>
    <script>
        $(document).ready(function() {
            $('#removeModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                var signatureId = button.data('id');
                var modal = $(this);
                modal.find('.signatureId').val(signatureId);
                modal.find('.removeModalBody').text('Bạn có chắc muốn xóa chữ ký điện tử với ID ' + signatureId + '?');
            });
        });
    </script>
</div>
</body>
</html>