<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>THOMAS - Admin</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/icons/favicon.svg" type="image/x-icon"/>

    <!-- Custom fonts for this template-->
    <link
            href="${pageContext.request.contextPath}/css/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.min.css"
            rel="stylesheet"
            type="text/css"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/adminGeneral.css" rel="stylesheet"/>
</head>

<body id="page-top">
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul
            class="navbar-nav sidebar sidebar-dark accordion"
            style="background-color: black"
            id="accordionSidebar"
    >
        <!-- Sidebar - Brand -->
        <a
                class="sidebar-brand d-flex align-items-center justify-content-center"
                href="${pageContext.request.contextPath}/"
        >
            <div class="sidebar-brand-icon rotate-n-15">
            </div>
            <div class="sidebar-brand-text mx-3">THOMAS Admin</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0"/>

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/admin">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a
            >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider"/>

        <!-- Heading -->
        <div class="sidebar-heading">Interface</div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item active">
            <a
                    class="nav-link collapsed"
                    href="#"
                    data-toggle="collapse"
                    data-target="#collapseTwo"
                    aria-expanded="true"
                    aria-controls="collapseTwo"
            >
                <i class="fas fa-fw fa-list-check"></i>
                <span>Quản lý</span>
            </a>
            <div
                    id="collapseTwo"
                    class="collapse"
                    aria-labelledby="headingTwo"
                    data-parent="#accordionSidebar"
            >
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Các đối tượng:</h6>
                    <a
                            class="collapse-item active"
                            href="${pageContext.request.contextPath}/admin/table/users"
                    >Người dùng</a
                    >
                    <a
                            class="collapse-item"
                            href="${pageContext.request.contextPath}/frontend/AdminPage/productManagement/productManagement.jsp"
                    >Sản phẩm</a
                    >
                    <a
                            class="collapse-item"
                            href="${pageContext.request.contextPath}/frontend/AdminPage/reviewManagement/reviewManagement.jsp"
                    >Đánh giá</a
                    >
                    <a
                            class="collapse-item"
                            href="${pageContext.request.contextPath}/frontend/AdminPage/couponManagement/couponManagement.jsp"
                    >Coupon</a
                    >
                    <a
                            class="collapse-item"
                            href="${pageContext.request.contextPath}/frontend/AdminPage/orderManagement/orderManagement.jsp"
                    >Đơn hàng</a
                    >
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a
                    class="nav-link collapsed"
                    href="#"
                    data-toggle="collapse"
                    data-target="#collapseUtilities"
                    aria-expanded="true"
                    aria-controls="collapseUtilities"
            >
                <i class="fas fa-fw fa-table"></i>
                <span>Bảng</span>
            </a>
            <div
                    id="collapseUtilities"
                    class="collapse"
                    aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar"
            >
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item"
                       href="${pageContext.request.contextPath}/frontend/AdminPage/allUser/allUser.jsp"
                    >Người dùng</a
                    >
                    <a class="collapse-item"
                       href="${pageContext.request.contextPath}/admin/table/belts">Sản
                        phẩm</a>
                    <a class="collapse-item"
                       href="${pageContext.request.contextPath}/admin/table/reviews"
                    >Đánh giá</a
                    >
                    <a class="collapse-item"
                       href="${pageContext.request.contextPath}/admin/table/coupons"
                    >Coupon</a
                    >
                    <a class="collapse-item"
                       href="${pageContext.request.contextPath}/frontend/AdminPage/allOrder/allOrder.jsp"
                    >Đơn hàng</a
                    >
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block"/>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav
                    class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
            >
                <!-- Sidebar Toggle (Topbar) -->
                <button
                        id="sidebarToggleTop"
                        class="btn btn-link d-md-none rounded-circle mr-3"
                >
                    <i class="fa fa-bars"></i>
                </button>

                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <div
                                class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown"
                        >
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input
                                            type="text"
                                            class="form-control bg-light border-0 small"
                                            placeholder="Search for..."
                                            aria-label="Search"
                                            aria-describedby="basic-addon2"
                                    />
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <!-- Nav Item - Alerts -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <div
                                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown"
                        >
                            <h6 class="dropdown-header">Alerts Center</h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 12, 2019</div>
                                    <span class="font-weight-bold"
                                    >A new monthly report is ready to download!</span
                                    >
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-success">
                                        <i class="fas fa-donate text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 7, 2019</div>
                                    $290.29 has been deposited into your account!
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="mr-3">
                                    <div class="icon-circle bg-warning">
                                        <i class="fas fa-exclamation-triangle text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">December 2, 2019</div>
                                    Spending Alert: We've noticed unusually high spending for
                                    your account.
                                </div>
                            </a>
                            <a
                                    class="dropdown-item text-center small text-gray-500"
                                    href="#"
                            >Show All Alerts</a
                            >
                        </div>
                    </li>

                    <!-- Nav Item - Messages -->
                    <li class="nav-item dropdown no-arrow mx-1">
                        <!-- Dropdown - Messages -->
                        <div
                                class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown"
                        >
                            <h6 class="dropdown-header">Message Center</h6>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img
                                            class="rounded-circle"
                                            src="img/undraw_profile_1.svg"
                                            alt="..."
                                    />
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div class="font-weight-bold">
                                    <div class="text-truncate">
                                        Hi there! I am wondering if you can help me with a
                                        problem I've been having.
                                    </div>
                                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img
                                            class="rounded-circle"
                                            src="img/undraw_profile_2.svg"
                                            alt="..."
                                    />
                                    <div class="status-indicator"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">
                                        I have the photos that you ordered last month, how would
                                        you like them sent to you?
                                    </div>
                                    <div class="small text-gray-500">Jae Chun · 1d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img
                                            class="rounded-circle"
                                            src="img/undraw_profile_3.svg"
                                            alt="..."
                                    />
                                    <div class="status-indicator bg-warning"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">
                                        Last month's report looks great, I am very happy with
                                        the progress so far, keep up the good work!
                                    </div>
                                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                </div>
                            </a>
                            <a class="dropdown-item d-flex align-items-center" href="#">
                                <div class="dropdown-list-image mr-3">
                                    <img
                                            class="rounded-circle"
                                            src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="..."
                                    />
                                    <div class="status-indicator bg-success"></div>
                                </div>
                                <div>
                                    <div class="text-truncate">
                                        Am I a good boy? The reason I ask is because someone
                                        told me that people say this to all dogs, even if they
                                        aren't good...
                                    </div>
                                    <div class="small text-gray-500">
                                        Chicken the Dog · 2w
                                    </div>
                                </div>
                            </a>
                            <a
                                    class="dropdown-item text-center small text-gray-500"
                                    href="#"
                            >Read More Messages</a
                            >
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="userDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                        >
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                  >${sessionScope.auth.name}</span
                  >
                            <img
                                    class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg"
                            />
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-4 text-gray-800">Người dùng</h1>

                <div class="row">
                    <div class="col-lg-6">
                        <!-- Circle Buttons -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: black">
                                <h6 class="m-0 font-weight-bold" style="color: white">
                                    Người dùng mua nhiều nhất
                                </h6>
                            </div>
                            <div class="card-body">
                                <p>
                                    Use Font Awesome Icons (included with this theme package)
                                    along with the circle buttons as shown in the examples
                                    below!
                                </p>
                                <!-- Circle Buttons (Default) -->
                                <div class="mb-2">
                                    <code>.btn-circle</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle">
                                    <i class="fab fa-facebook-f"></i>
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
                                <!-- Circle Buttons (Small) -->
                                <div class="mt-4 mb-2">
                                    <code>.btn-circle .btn-sm</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle btn-sm">
                                    <i class="fab fa-facebook-f"></i>
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
                                <!-- Circle Buttons (Large) -->
                                <div class="mt-4 mb-2">
                                    <code>.btn-circle .btn-lg</code>
                                </div>
                                <a href="#" class="btn btn-primary btn-circle btn-lg">
                                    <i class="fab fa-facebook-f"></i>
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

                        <!-- Brand Buttons -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: black">
                                <h6 class="m-0 font-weight-bold" style="color: white">
                                    Người dùng reviews nhiều nhất
                                </h6>
                            </div>
                            <div class="card-body">
                                <p>
                                    Google and Facebook buttons are available featuring each
                                    company's respective brand color. They are used on the
                                    user login and registration pages.
                                </p>
                                <p>
                                    You can create more custom buttons by adding a new color
                                    variable in the <code>_variables.scss</code> file and then
                                    using the Bootstrap button variant mixin to create a new
                                    style, as demonstrated in the
                                    <code>_buttons.scss</code> file.
                                </p>
                                <a href="#" class="btn btn-google btn-block"
                                ><i class="fab fa-google fa-fw"></i> .btn-google</a
                                >
                                <a href="#" class="btn btn-facebook btn-block"
                                ><i class="fab fa-facebook-f fa-fw"></i> .btn-facebook</a
                                >
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3" style="background-color: black">
                                <h6 class="m-0 font-weight-bold" style="color: white">
                                    Người dùng bị xóa
                                </h6>
                            </div>
                            <div class="card-body">
                                <p>
                                    Works with any button colors, just use the
                                    <code>.btn-icon-split</code> class and the markup in the
                                    examples below. The examples below also use the
                                    <code>.text-white-50</code> helper class on the icons for
                                    additional styling, but it is not required.
                                </p>
                                <a href="#" class="btn btn-primary btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-flag"></i>
                      </span>
                                    <span class="text">Split Button Primary</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-success btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-check"></i>
                      </span>
                                    <span class="text">Split Button Success</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-info btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-info-circle"></i>
                      </span>
                                    <span class="text">Split Button Info</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-warning btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-exclamation-triangle"></i>
                      </span>
                                    <span class="text">Split Button Warning</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-danger btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-trash"></i>
                      </span>
                                    <span class="text">Split Button Danger</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-secondary btn-icon-split">
                      <span class="icon text-white-50">
                        <i class="fas fa-arrow-right"></i>
                      </span>
                                    <span class="text">Split Button Secondary</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-light btn-icon-split">
                      <span class="icon text-gray-600">
                        <i class="fas fa-arrow-right"></i>
                      </span>
                                    <span class="text">Split Button Light</span>
                                </a>
                                <div class="mb-4"></div>
                                <p>Also works with small and large button classes!</p>
                                <a href="#" class="btn btn-primary btn-icon-split btn-sm">
                      <span class="icon text-white-50">
                        <i class="fas fa-flag"></i>
                      </span>
                                    <span class="text">Split Button Small</span>
                                </a>
                                <div class="my-2"></div>
                                <a href="#" class="btn btn-primary btn-icon-split btn-lg">
                      <span class="icon text-white-50">
                        <i class="fas fa-flag"></i>
                      </span>
                                    <span class="text">Split Button Large</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; THOMAS 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div
            class="modal fade"
            id="logoutModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true"
    >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                        Ready to Leave?
                    </h5>
                    <button
                            class="close"
                            type="button"
                            data-dismiss="modal"
                            aria-label="Close"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    Select "Logout" below if you are ready to end your current
                    session.
                </div>
                <div class="modal-footer">
                    <button
                            class="btn btn-secondary"
                            type="button"
                            data-dismiss="modal"
                    >
                        Cancel
                    </button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
</div>
</body>
</html>
