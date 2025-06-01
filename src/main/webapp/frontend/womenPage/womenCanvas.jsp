<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nữ</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/womenPage.css"/>
  </head>

  <body>
  <jsp:include page="/frontend/header_footer/header.jsp"/>
  <div id="dimmer3" class="dimmer2"></div>
    <div id="overlay3" class="d-sm-flex overlay border" style="width: 20%">
      <div class="overlay__content w-100">
        <div
          class="overlay__header d-flex w-100 justify-content-center align-items-center mt-2"
        >
          <h3 class="filter__header__title mb-0">THOMAS</h3>
          <button id="closeButton" class="btn ms-5">
            <img src="${pageContext.request.contextPath}/assets/icons/close.svg" />
          </button>
        </div>
        <div
          class="overlay__body d-flex align-items-left justify-content-between"
          style="height: 500px"
        >
          <div class="w-100">
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
                      <input
                        id="price1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        data-value="0-400000"
                        data-id="price-0-400000"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">400.000</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="price1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        data-value="0-400000"
                        data-id="price-0-400000"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">400.000 - 600.000</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="price1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        data-value="0-400000"
                        data-id="price-0-400000"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">600.000 - 900.000</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="price1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        data-value="0-400000"
                        data-id="price-0-400000"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">> 900.000</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header" id="headingColor">
                  <button
                    class="accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseColor"
                    aria-expanded="false"
                    aria-controls="collapseColor"
                  >
                    Màu sắc
                  </button>
                </h2>
                <div
                  id="collapseColor"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingColor"
                  data-bs-parent="#filterAccordion"
                >
                  <div class="accordion-body">
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="color1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">Trắng</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="color1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">Trắng</p>
                    </div>
                    <div
                      class="dropdown-item d-flex align-items-center custom_border_active"
                    >
                      <input
                        id="color1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">Đỏ</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="color1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">Vàng</p>
                    </div>
                  </div>
                </div>
              </div>

              <div class="accordion-item">
                <h2 class="accordion-header" id="headingSize">
                  <button
                    class="accordion-button collapsed"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseSize"
                    aria-expanded="false"
                    aria-controls="collapseSize"
                  >
                    Kích cỡ
                  </button>
                </h2>
                <div
                  id="collapseSize"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingSize"
                  data-bs-parent="#filterAccordion"
                >
                  <div class="accordion-body">
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="size1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">80</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="size1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">90</p>
                    </div>
                    <div
                      class="dropdown-item d-flex align-items-center custom_border_active"
                    >
                      <input
                        id="size1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">100</p>
                    </div>
                    <div class="dropdown-item d-flex align-items-center">
                      <input
                        id="size1"
                        class="form-check-input filter-item border border-dark mb-0 mt-0"
                        type="checkbox"
                      />
                      <p class="ms-2 mt-0 mb-0">120</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="apply__container">
              <button class="apply__button">Áp dụng</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <header id="header"></header>
    <div class="breadcumb__container">
      <nav style="--bs-breadcrumb-divider: '>'" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
          <li class="breadcrumb-item active" aria-current="page">
            Thắt Lưng Nữ
          </li>
        </ol>
      </nav>
    </div>
    <div class="banner">
      <img src="${pageContext.request.contextPath}/assets/images/collection4.png" alt="" style="width: 100%" />
    </div>

    <!-- Product Header -->
    <div class="container">
      <div class="belts-header">Thắt Lưng Vải Canvas Nữ</div>
    </div>

    <!-- Filter and Sort -->
    <div class="function__bar">
      <div class="container-fluid">
        <div class="row function__bar__row">
          <div class="col-4 filter__column">
            <div class="filter__container">
              <i class="fa-solid fa-filter" style="color: #171717"></i>
              <span class="filter__title" id="filterToggle">Bộ lọc</span>
            </div>
          </div>
          <div class="col-4 quantity__column">
            <span>90</span> <span class="pix__text"> sản phẩm</span>
          </div>
          <div class="col-4 sort__column">
            <div class="sort__container">
              <img
                src="${pageContext.request.contextPath}/assets/icons/sort (1).png"
                alt=""
                style="height: 20px"
              />
              <li class="nav-item dropdown">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  Sắp Xếp
                </a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item active" href="#">Mặc Định</a></li>
                  <li><a class="dropdown-item" href="#">Giá Tăng Dần</a></li>
                  <li><a class="dropdown-item" href="#">Giá Giảm Dần</a></li>
                  <li><a class="dropdown-item" href="#">Bán Chạy Nhất</a></li>
                </ul>
              </li>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="list__product container-fluid">
      <div class="row" id="list__product__row">
        <div class="list__product__element">
          <div
            class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4"
            id="list__product__row"
          >
            <!-- Sản phẩm -->
            <div class="col product__col">
              <a href="../productDetail/productDetail.jsp">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/ae91a035409527d29e8128c91e5ded54.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng vải canvas đan khoá hợp kim</h4>
                    <p class="product__price">230.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/cn-11134301-7qukw-lk7scdx4n8nx7e.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng quân đội dáng khóa kim cổ điển
                    </h4>
                    <p class="product__price">220.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134201-7qvf5-lk9zb07pnyaub0.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng vải canvas khoá móc hiện đại
                    </h4>
                    <p class="product__price">240.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134301-7rcde-lt7tud1mcy4z7f.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng thời trang vải cao cấp bền</h4>
                    <p class="product__price">250.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134201-7qvf5-lk9zb07pnyaub0.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng vải canvas khoá móc hiện đại
                    </h4>
                    <p class="product__price">240.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134301-7rcde-lt7tud1mcy4z7f.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng thời trang vải cao cấp bền</h4>
                    <p class="product__price">250.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>

            <div class="col product__col">
              <a href="../productDetail/productDetail.jsp">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/ae91a035409527d29e8128c91e5ded54.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng vải canvas đan khoá hợp kim</h4>
                    <p class="product__price">230.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/cn-11134301-7qukw-lk7scdx4n8nx7e.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng quân đội dáng khóa kim cổ điển
                    </h4>
                    <p class="product__price">220.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134301-7rcde-lt7tud1mcy4z7f.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng thời trang vải cao cấp bền</h4>
                    <p class="product__price">250.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/sg-11134201-7qvf5-lk9zb07pnyaub0.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng vải canvas khoá móc hiện đại
                    </h4>
                    <p class="product__price">240.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>

            <div class="col product__col">
              <a href="">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/cn-11134301-7qukw-lk7scdx4n8nx7e.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">
                      Thắt lưng quân đội dáng khóa kim cổ điển
                    </h4>
                    <p class="product__price">220.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col product__col">
              <a href="../productDetail/productDetail.jsp">
                <div class="belts">
                  <div class="product__image">
                    <img
                      src="${pageContext.request.contextPath}/assets/images/belts/Images/women/canvas/ae91a035409527d29e8128c91e5ded54.webp"
                      class="img-fluid"
                      alt="Leather Belt"
                    />
                  </div>
                  <div class="product__title">
                    <h4 class="title">Thắt lưng vải canvas đan khoá hợp kim</h4>
                    <p class="product__price">230.000VNĐ</p>
                  </div>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <section>
      <nav aria-label="Page__navigation__example" id="pagination__bar">
        <div class="container paginationWrapper">
          <ul class="pagination pagination__Ul">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item pageNumber active">
              <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#">...</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#">10</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#">11</a>
            </li>
            <li class="page-item pageNumber">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </section>

    <jsp:include page = "/frontend/header_footer/footer.jsp" />

  </body>
</html>
