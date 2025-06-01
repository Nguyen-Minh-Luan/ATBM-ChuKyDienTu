<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="dimmer" class="dimmer"></div>
<nav class="navbar navbar-expand p-12 bg-white rounded" id="navbar">
    <div class="container-fluid-center"></div>
    <div
            class="col-sm-3 pl-sm-4 pr-sm-0 col-md-4 justify-content-sm-start d-lg-none d-xl-none col header__navbar header__navbar--center d-flex justify-content-center"
    >
        <button id="menuButton" class="btn btn-light h-sm-100 ms-2">
            <img src="${pageContext.request.contextPath}/assets/icons/menu.svg"/>
        </button>
    </div>

    <div id="overlay" class="d-sm-flex overlay" style="width: 45%">
        <div class="overlay__content w-100">
            <div
                    class="overlay__header d-flex w-100 justify-content-center align-items-center mt-2"
            >
                <h3 class="header__title mb-0">THOMAS</h3>
                <button id="closeButton" class="btn ms-5">
                    <img src="${pageContext.request.contextPath}/assets/icons/close.svg"/>
                </button>
            </div>
            <div
                    class="overlay__body d-flex align-items-left justify-content-between"
                    style="height: 500px"
            >
                <ul
                        class="navbar-nav d-flex flex-column list-unstyled fs-3 w-100"
                        style="font-size: 1.5rem"
                >
                    <hr class="w-100 ms-2"/>
                    <li class="nav-item mx-3">
                        <a href="${pageContext.request.contextPath}/" class="nav-link text-dark"
                        >Home</a
                        >
                    </li>
                    <hr class="w-100 ms-2"/>
                    <li class="nav-item mx-3">
                        <a href="${pageContext.request.contextPath}/frontend/collectionPage/collectionsPage.jsp"
                           class="nav-link text-dark">Bộ sưu tập</a>
                    </li>
                    <hr class="w-100 ms-2"/>
                    <li class="nav-item mx-3">
                        <a href="${pageContext.request.contextPath}/frontend/menPage/menPage.jsp"
                           class="nav-link text-dark">Nam</a>
                    </li>
                    <hr class="w-100 ms-2"/>
                    <li class="nav-item mx-3">
                        <a href="${pageContext.request.contextPath}/frontend/womenPage/womenPage.jsp"
                           class="nav-link text-dark"
                        >Nữ</a
                        >
                    </li>
                    <hr class="w-100 ms-2"/>
                    <li class="nav-item mx-3">
                        <a href="${pageContext.request.contextPath}/frontend/signInPage/signInPage.jsp"
                           class="nav-link text-dark"
                        >Đăng nhập / Đăng ký</a
                        >
                    </li>
                    <hr class="w-100 ms-2"/>
                </ul>
            </div>
        </div>
    </div>
    <a
            href=""
            class="navbar-brand col-3 d-sm-none d-md-none d-lg-block"
            id="logo"
    >
        THOMAS
    </a>

    <a
            href="${pageContext.request.contextPath}/index.jsp"
            class="navbar-brand d-sm-block ms-sm-3 ms-5 mr-5 d-md-block d-lg-none"
            id="logo"
    >
        THOMAS
    </a>

    <ul class="navbar-nav col-6 navitem__group d-sm-none d-md-none d-lg-flex">
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/" class="nav-link">Trang Chủ</a>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/navigate?type=collection" class="nav-link"
            >Bộ Sưu Tập</a
            >
        </li>
        <li class="nav-item dropdown">
            <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
            >
                Nam
            </a>
            <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/navigate?type=men&page=1"
                    >Tất cả thắt lưng nam</a
                    >
                </li>
                <li>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/navigate?type=menLeather&page=1"
                    >Thắt Lưng Da Nam</a
                    >
                </li>
                <li>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/navigate?type=menCanvas&page=1"
                    >Thắt Lưng Vải Canvas Nam</a
                    >
                </li>
            </ul>
        </li>
        <li class="nav-item dropdown">
            <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
            >
                Nữ
            </a>
            <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}/navigate?type=women&page=1"
                    >Tất cả thắt lưng nữ</a
                    >
                </li>
                <li>
                    <a class="dropdown-item"
                       href="${pageContext.request.contextPath}/navigate?type=womenLeather&page=1"
                    >Thắt Lưng Da Nữ
                    </a>
                </li>
                <li>
                    <a class="dropdown-item"
                       href="${pageContext.request.contextPath}/navigate?type=womenCanvas&page=1"
                    >Thắt Lưng Vải Canvas Nữ</a
                    >
                </li>
            </ul>
        </li>
        <li class="nav-item">
            <a href="${pageContext.request.contextPath}/navigate?type=all&page=1" class="nav-link">Sản
                Phẩm</a>
        </li>
    </ul>
    <div class="header__icon__group col-3">
        <form action="search" method="get">
            <div class="search__container d-flex align-items-center">
                <input name="keyword" type="text" class="form-control search__input" placeholder="Tìm kiếm..."
                       style="max-width: 150px;">
                <button class="btn btn-outline-secondary search__button ms-2" type="submit">
                    <i class="fa-solid fa-magnifying-glass fa-l"></i>
                </button>
            </div>
        </form>


        <c:if test="${sessionScope.auth!=null}">
            <a class="nav-item favorite"
               href="${pageContext.request.contextPath}/favorite?userId=${sessionScope.auth.id}">
                <img class="nav-icon" src="${pageContext.request.contextPath}/assets/icons/favorite.svg" alt=""/>
                <span id="favorite_receive" class="favorite__count">0</span>
            </a>
        </c:if>
        <a class="nav-item user user__dropdown" href="#">
            <div class="dropdown text-end dropdown-hover">
                <c:if test="${sessionScope.auth !=null}">
                    <a
                            href="${pageContext.request.contextPath}/userInfo"
                            class="d-flex align-items-center text-decoration-none"
                            id="dropdownUser"
                    >
                        <c:choose>
                            <c:when test="${sessionScope.auth.image == null}">
                                <img src="${pageContext.request.contextPath}/assets/icons/default_profile.svg"
                                     alt="User Avatar"
                                     width="35"
                                     height="35"
                                     class="rounded-circle me-2">
                            </c:when>
                            <c:otherwise>
                                <img src="${sessionScope.auth.image}"
                                     alt="User Avatar"
                                     width="35"
                                     height="35"
                                     class="rounded-circle me-2">
                            </c:otherwise>
                        </c:choose>

                    </a>
                    <ul
                            class="dropdown-menu dropdown-menu-end text-small"
                            aria-labelledby="dropdownUser"
                    >
                        <c:if test="${sessionScope.auth.role == 1}">
                            <li>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/admin"
                                >Admin</a
                                >
                            </li>
                        </c:if>

                        <li>
                            <form method="POST" action="${pageContext.request.contextPath}/logout">
                                <button type="submit" class="dropdown-item"
                                >Đăng xuất
                                </button>
                            </form>

                        </li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.auth ==null}">
                    <a
                            href="${pageContext.request.contextPath}/login"
                            class="d-flex align-items-center text-decoration-none"
                            id="dropdownUser"
                    >
                        <img
                                src="${pageContext.request.contextPath}/assets/icons/user.svg"
                                alt="User Avatar"
                                width="35"
                                height="35"
                                class="rounded-circle me-2"
                        />
                    </a>
                    <ul
                            class="dropdown-menu dropdown-menu-end text-small"
                            aria-labelledby="dropdownUser"
                    >

                        <li>
                            <a href="${pageContext.request.contextPath}/login" class="dropdown-item"
                            >Đăng nhập
                            </a>
                        </li>
                        <li>
                            <a href="/signup" class="dropdown-item"
                            >Đăng ký
                            </a>

                        </li>
                    </ul>
                </c:if>
            </div>
        </a>
            <a class="nav-item cart" href="${pageContext.request.contextPath}/Cart">
                <input type="hidden" class="userId" value="${sessionScope.auth.id}">
                <img
                        class="nav-icon"
                        src="${pageContext.request.contextPath}/assets/icons/cart.svg"
                        alt=""
                        style="width: 26px; height: 26px"
                />
                <span id="cart_received" class="nav-item favorite__count">${cartSize!=null ?cartSize:0}</span>
            </a>

    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/header.js"></script>