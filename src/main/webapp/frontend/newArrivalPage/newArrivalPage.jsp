<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Hàng mới về</title>
    <link
            rel="shortcut icon"
            href="${pageContext.request.contextPath}/assets/icons/favicon.svg"
            type="image/png"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/fontawesome-free-6.6.0-web/fontawesome-free-6.6.0-web/css/all.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newArrivalPage.css"/>
    <script src="${pageContext.request.contextPath}/js/allProduct.js"></script>

</head>

<body>
<jsp:include page="/frontend/header_footer/header.jsp"/>
<div id="dimmer3" class="dimmer2"></div>
<div id="overlay3" class="d-sm-flex overlay border" style="width: 20%">
    <div class="overlay__content w-100">
        <div class="overlay__header d-flex w-100 justify-content-center align-items-center mt-2">
            <h3 class="filter__header__title mb-0">THOMAS</h3>
            <button id="closeButton" class="btn ms-5">
                <img src="../../assets/icons/close.svg"/>
            </button>
        </div>
        <div class="overlay__body d-flex align-items-left justify-content-between" style="height: 500px">
            <div class="w-100">
                <c:set var="filterUrlBase" value="${pageContext.request.contextPath}/newArrival"/>
                <c:if test="${param.descPrice != null}">
                    <c:set var="filterUrlBase" value="${filterUrlBase}?descPrice=${param.descPrice}"/>
                </c:if>

                <div class="accordion border-top-0 w-100" id="filterAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingPrice">
                            <button
                                    class="accordion-button collapsed"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#collapsePrice"
                                    aria-expanded="false"
                                    aria-controls="collapsePrice"
                            >
                                Giá
                            </button>
                        </h2>
                        <div
                                id="collapsePrice"
                                class="accordion-collapse collapse"
                                aria-labelledby="headingPrice"
                                data-bs-parent="#filterAccordion"
                        >
                            <div class="accordion-body">
                                <div class="dropdown-item d-flex align-items-center">
                                    <c:choose>
                                        <c:when test="${param.minPrice != null || param.maxPrice != null}">
                                            <a href="${filterUrlBase}&minPrice=100&maxPrice=500"
                                               class="filter-item text-decoration-none">
                                                Giá từ 100.000 VNĐ đến 500.000 VNĐ
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${filterUrlBase}"
                                               class="filter-item text-decoration-none">
                                                Giá mặc định
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                `
                <div class="apply__container mt-3 d-flex flex-column">
                    <!-- Các liên kết áp dụng -->
                    <c:forEach var="priceRange" items="${['100-500', '500-900']}">
                        <c:set var="minPrice" value="${fn:split(priceRange, '-')[0]}"/>
                        <c:set var="maxPrice" value="${fn:split(priceRange, '-')[1]}"/>
                        <c:choose>
                            <c:when test="${param.descPrice!=null}">
                                <a href="${filterUrlBase}&minPrice=${minPrice}&maxPrice=${maxPrice}"
                                   class="apply__button text-decoration-none d-block mt-2 p-2">
                                    Giá từ ${minPrice}.000 VNĐ đến ${maxPrice}.000 VNĐ
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${filterUrlBase}?minPrice=${minPrice}&maxPrice=${maxPrice}"
                                   class="apply__button text-decoration-none d-block mt-2 p-2">
                                    Giá từ ${minPrice}.000 VNĐ đến ${maxPrice}.000 VNĐ
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
</div>

<header id="header">

</header>
<div class="breadcumb__container">
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item active" aria-current="page">Hàng mới về</li>
        </ol>
    </nav>
</div>
<div class="banner">
    <img src="${pageContext.request.contextPath}/assets/images/newArrivalBanner.png" alt="" style="width: 100%;">
</div>

<!-- Product Header -->
<!-- Filter and Sort -->
<div class="function__bar">
    <div class="container-fluid">
        <div class="row function__bar__row">
            <div class="col-4 filter__column">
                <div class="filter__container">
                    <i class="fa-solid fa-filter" style="color: #171717;"></i>
                    <span class="filter__title" id="filterToggle">Bộ lọc</span>
                </div>
            </div>
            <div class="col-4  quantity__column">
                <span>${totalBelt}</span> <span class="pix__text"> sản phẩm</span>
            </div>
            <div class="col-4  sort__column">
                <div class="sort__container">
                    <img src="${pageContext.request.contextPath}/assets/icons/sort (1).png" alt=""
                         style="height: 20px;">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Sắp Xếp
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item active" href="#">Mặc Định</a></li>
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/newArrival?page=${param.page}&descPrice=increase${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}">Giá
                                Tăng
                                Dần</a></li>
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/newArrival?page=${param.page}&descPrice=decrease${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}">Giá
                                Giảm
                                Dần</a></li>
                            <li><a class="dropdown-item"
                                   href="${pageContext.request.contextPath}/newArrival?page=${param.page}&descPrice=hotSelling${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}">Bán
                                Chạy
                                Nhất</a></li>
                        </ul>
                    </li>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="list__product mx-2">
    <div class="row" id="list__product__row">
        <div class="list__product__element">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4" id="list__product__row">
                <!-- Sản phẩm -->
                <jsp:useBean id="beltsForPage" scope="request" type="java.util.List"/>
                <c:forEach var="belt" items="${beltsForPage}">
                    <div class="col product__col">
                        <a href="${pageContext.request.contextPath}/productDetails?beltId=${belt.id}">
                            <div class="belts">
                                <div class="product__image">
                                    <img src="${pageContext.request.contextPath}${belt.image[0]}" alt="Product Image"
                                         class="img-fluid" alt="Leather Belt">
                                </div>
                                <div class="product__title ms-2">
                                    <h4 class="title">${belt.name}</h4>
                                    <p class="product__price">${belt.price}VNĐ</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<section>
    <nav aria-label="Page__navigation__example" id="pagination__bar">
        <div class="container paginationWrapper">
            <ul class="pagination pagination__Ul">
                <!-- Previous Button -->
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/newArrival?page=${currentPage > 1 ? currentPage - 1 : 1}${not empty param.descPrice ? '&descPrice='.concat(param.descPrice) : ''}${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}"
                    ${currentPage == 1 ? 'aria-disabled="true"' : ''}
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

                <!-- Loop to display page numbers -->
                <c:forEach var="i" begin="1" end="${totalPages}" step="1">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link"
                           href="${pageContext.request.contextPath}/newArrival?page=${i}${not empty param.descPrice ? '&descPrice='.concat(param.descPrice) : ''}${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}">${i}</a>
                    </li>
                </c:forEach>

                <!-- Next Button -->
                <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/newArrival?page=${currentPage < totalPages ? currentPage + 1 : totalPages}${not empty param.descPrice ? '&descPrice='.concat(param.descPrice) : ''}${not empty param.minPrice ? '&minPrice='.concat(param.minPrice) : ''}${not empty param.maxPrice ? '&maxPrice='.concat(param.maxPrice) : ''}"
                    ${currentPage == totalPages ? 'aria-disabled="true"' : ''}
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</section>

<jsp:include page="/frontend/header_footer/footer.jsp"/>
</body>

</html>
