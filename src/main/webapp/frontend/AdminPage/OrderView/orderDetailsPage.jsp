<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.0.0/ckeditor5.css">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet"/>
    <script src="https://cdn.ckeditor.com/ckeditor5/44.0.0/ckeditor5.umd.js"></script>
    <link href="${pageContext.request.contextPath}/css/adminGeneral.css" rel="stylesheet"/>


</head>

<body id="page-top">
<div id="wrapper">
    <ul
            class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar"
    >
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
        <li class="nav-item">
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
                            class="collapse-item"
                            href="${pageContext.request.contextPath}/frontend/AdminPage/userManagement/userManagement.jsp"
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
                            class="collapse-itema"
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
        <li class="nav-item active">
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
                       href="${pageContext.request.contextPath}/admin/table/users"
                    >Người dùng</a
                    >
                    <a class="collapse-item active"
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
                       href="${pageContext.request.contextPath}/admin/table/orders"
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

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">

            <div class="container-fluid px-0">
                <h1 class="title-create-edit mb-2 mt-5 ml-5">Xem chi tiết đơn hàng</h1>
                <div class="d-flex w-100 ml-5">
                    <div class="col-11 bg-light">
                        <div class="d-flex flex-column">
                            <div class="ms-5 mt-5 ml-5">
                                <h1 class="fw-bold">Đơn hàng id ${order.id}</h1>
                                <h3 class="fs-4">Xem chi tiết</h3>
                            </div>
                        </div>
                        <div
                                class="d-flex flex-column"
                        >
                            <div
                                    class="px-5 ps-0"
                            >
                                <div class="d-flex flex-column mt-5 ms-5">
                                    <div
                                            class="d-flex flex-column border border-dark rounded p-3 fs-5 w-50"
                                    >
                                        <div class="d-flex justify-content-between">
                                            <p class="text-end fw-bold">Anh / Chị:</p>
                                            <p class="ms-2">${order.userName}</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-end fw-bold">Địa chỉ:</p>
                                            <p>${order.addresse}</p>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <p class="text-end fw-bold">Phương thức thanh toán:</p>
                                            <p>${order.paymentMethod}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-5 w-100">
                                    <table class="table text-center">
                                        <thead>
                                        <tr>
                                            <th scope="col">Mã sản phẩm</th>
                                            <th scope="col">Tên sản phẩm</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <jsp:useBean id="orderDetailsList" scope="request" type="java.util.List"/>
                                        <c:forEach var="orderItem" items="${orderDetailsList}">
                                            <tr>
                                                <th class="p-4 fs-5 orderItemId" scope="row">${orderItem.id}</th>
                                                <td class="p-4 fs-5">${orderItem.beltName}</td>
                                                <td class="p-4 fs-5">${orderItem.quantity}</td>
                                                <td class="p-4 fs-5">${orderItem.price}</td>
                                                <td class="p-4 fs-5">
                                                    <button class="custom_button custom_click"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#deleteModal">
                                                        <img src="../../../assets/icons/delete.svg" width="24px"/>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <form id="addOrderForm">
                                                <input type="hidden" name="orderId" id="orderId" value="${param.id}"/>
                                                <td></td>
                                                <td><input type="text" name="productName" id="productName"
                                                           placeholder="Tên sản phẩm" required/></td>
                                                <td><input type="number" name="quantity" id="quantity"
                                                           placeholder="Số lượng" required min="1"/></td>
                                                <td><input type="number" name="price" id="price" placeholder="Giá"
                                                           required min="0" step="0.01"/></td>
                                                <td>
                                                    <button type="submit" class="btn btn-success">Thêm</button>
                                                </td>
                                            </form>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    </div>
</div>

<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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

<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa mục đơn hàng này</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body removeModalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary " data-bs-dismiss="modal">Hủy</button>
                <form class="deleteBtn" action="${pageContext.request.contextPath}/admin/table/orders/details"
                      method="post">
                    <c:if test="${orderDetailsList.size()==1}"><input type="hidden" name="oneItem"
                                                                      value="1"></c:if>
                    <input type="hidden" name="orderId" value="${param.id}">
                    <button type="submit" class="btn btn-dark">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/orderDetails.js"></script>
</body>
</html>
