<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>THOMAS - Check Digital Signatures Management</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/icons/favicon.svg" type="image/x-icon"/>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/css/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"/>

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/adminGeneral.css" rel="stylesheet"/>
</head>

<body id="page-top">
<div id="wrapper">
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/">
            <div class="sidebar-brand-text mx-3">THOMAS Admin</div>
        </a>
        <hr class="sidebar-divider my-0"/>
        <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <hr class="sidebar-divider"/>
        <div class="sidebar-heading">Interface</div>
        <li class="nav-item active">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-list-check"></i>
                <span>Quản lý</span>
            </a>
            <div id="collapseTwo" class="collapse show" aria-labelledby="headingTwo" data-parent-child="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Các đối tượng:</h6>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/frontend/AdminPage/userManagement/userManagement.jsp">Người dùng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/frontend/AdminPage/productManagement/productManagement.jsp">Sản phẩm</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/frontend/AdminPage/reviewManagement/reviewManagement.jsp">Đánh giá</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/frontend/AdminPage/couponManagement/couponManagement.jsp">Coupon</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/frontend/AdminPage/orderManagement/orderManagement.jsp">Đơn hàng</a>
                    <a class="collapse-item active" href="${pageContext.request.contextPath}/frontend/AdminPage/checkDigitalSignaturesManagement/checkDigitalSignaturesManagement.jsp">Chữ ký điện tử</a>
                </div>
            </div>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-table"></i>
                <span>Bảng</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/users">Người dùng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/belts">Sản phẩm</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/reviews">Đánh giá</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/coupons">Coupon</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/orders">Đơn hàng</a>
                    <a class="collapse-item" href="${pageContext.request.contextPath}/admin/table/check-digital-signatures">Check chữ ký điện tử</a>
                </div>
            </div>
        </li>
        <hr class="sidebar-divider d-none d-md-block"/>
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
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
                <h1 class="h3 mb-4 text-gray-800">Quản lý chữ ký điện tử</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Chữ ký mới nhất</h6>
                            </div>
                            <div class="card-body">
                                <p>Danh sách các nút hành động để quản lý chữ ký điện tử mới nhất, sử dụng các biểu tượng Font Awesome.</p>
                                <div class="mb-2">
                                    <code>.btn-circle</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="#" class="btn btn-success btn-circle">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-info btn-circle">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                                <a href="#" class="btn btn-warning btn-circle">
                                    <i class="fas fa-exclamation-triangle"></i>
                                </a>
                                <a href="#" class="btn btn-danger btn-circle">
                                    <i class="fas fa-trash"></i>
                                </a>
                                <div class="mt-4 mb-2">
                                    <code>.btn-circle .btn-sm</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle btn-sm">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="#" class="btn btn-success btn-circle btn-sm">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-info btn-circle btn-sm">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                                <a href="#" class="btn btn-warning btn-circle btn-sm">
                                    <i class="fas fa-exclamation-triangle"></i>
                                </a>
                                <a href="#" class="btn btn-danger btn-circle btn-sm">
                                    <i class="fas fa-trash"></i>
                                </a>
                                <div class="mt-4 mb-2">
                                    <code>.btn-circle .btn-lg</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle btn-lg">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="#" class="btn btn-success btn-circle btn-lg">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-info btn-circle btn-lg">
                                    <i class="fas fa-info-circle"></i>
                                </a>
                                <a href="#" class="btn btn-warning btn-circle btn-lg">
                                    <i class="fas fa-exclamation-triangle"></i>
                                </a>
                                <a href="#" class="btn btn-danger btn-circle btn-lg">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </div>

                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Chữ ký không hợp lệ</h6>
                            </div>
                            <div class="card-body">
                                <p>Các nút hành động để xử lý chữ ký điện tử không hợp lệ, có thể tùy chỉnh thêm trong <code>_variables.scss</code>.</p>
                                <a href="#" class="btn btn-google btn-block"><i class="fas fa-exclamation-circle fa-fw"></i> Kiểm tra lại</a>
                                <a href="#" class="btn btn-facebook btn-block"><i class="fas fa-trash fa-fw"></i> Xóa chữ ký</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Chữ ký đã xóa</h6>
                            </div>
                            <div class="card-body">
                                <p>Danh sách các nút phân tách biểu tượng để quản lý chữ ký đã xóa, sử dụng <code>.btn-icon-split</code>.</p>
                                <a href="#" class="btn btn-primary btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-eye"></i></span>
                                    <span class="text">Xem chi tiết</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-success btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-check"></i></span>
                                    <span class="text">Khôi phục</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-info btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-info-circle"></i></span>
                                    <span class="text">Thông tin</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-warning btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span>
                                    <span class="text">Cảnh báo</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-danger btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-trash"></i></span>
                                    <span class="text">Xóa vĩnh viễn</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-secondary btn-icon-split">
                                    <span class="icon text-white-50"><i class="fas fa-arrow-right"></i></span>
                                    <span class="text">Chuyển tiếp</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-light btn-icon-split">
                                    <span class="icon text-gray-600"><i class="fas fa-arrow-right"></i></span>
                                    <span class="text">Xem thêm</span>
                                </a>
                                <div class="mb-4"></div>
                                <p>Cũng hỗ trợ các kích thước nút nhỏ và lớn!</p>
                                <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                                    <span class="icon text-white-50"><i class="fas fa-eye"></i></span>
                                    <span class="text">Xem chi tiết</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-primary btn-icon-split btn-lg">
                                    <span class="icon text-white-50"><i class="fas fa-eye"></i></span>
                                    <span class="text">Xem chi tiết</span>
                                </a>
                            </div>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
</div>
</body>
</html>