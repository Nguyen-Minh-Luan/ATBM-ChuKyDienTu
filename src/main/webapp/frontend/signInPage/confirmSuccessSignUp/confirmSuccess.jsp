<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>THOMAS - Đăng nhập</title>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/icons/favicon.svg" type="image/x-icon"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signInPage.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>

</head>

<body>
<div class="row p-2 border-bottom border-dark">
    <a
            href="${pageContext.request.contextPath}/index.jsp"
            class="d-sm-none d-md-none d-lg-block d-flex text-dark text-decoration-none fs-4 ms-2"
    >
        THOMAS / Đăng nhập
    </a>
</div>

<div class="container-lg">
    <form action="${pageContext.request.contextPath}/signup" method="post">
        <div>
            <div class="">
                <div class="bg-light text-dark mx-auto my-5" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">
                        <div class="mb-md-5 mt-md-4 pb-5">
                            <c:choose>
                                <c:when test="${active==1}">
                                    <h2 class="fw-bold mb-2 text-uppercase">Tài khoản của bạn đã được xác nhận</h2>
                                    <i class="bi bi-check2"></i>


                                    <div class="text-start">
                                        <h5> Hướng dẫn sử dụng khóa RSA:</h5>
                                        <ol class="text-dark">
                                            <li><strong>Bước 1:</strong> Tải về <strong>Public Key</strong>.</li>
                                            <li><strong>Bước 2:</strong> Tải về <strong>Private Key</strong>(Lưu ý :
                                                private key trong file đã bị mã hoá . Sau khi tải về hãy dùng tool để
                                                lấy private key hoàn chỉnh).
                                            </li>
                                            <li><strong>Bước 3:</strong> Tải và cài đặt công cụ hỗ trợ ở đường link phía dưới.
                                            </li>
                                            <li><strong>Bước 4:</strong> Mở tool chọn Tab "Lấy Private Key".
                                            </li>
                                            <li><strong>Bước 5:</strong> Thêm file private key vừa tải về vào ô "Nhập Private Key" và nhập mật khẩu người dùng vào ô "Nhập mật khẩu" .
                                            </li>
                                            <li><strong>Bước 6:</strong> Bấm "Tạo Private Key". Private Key sẽ hiển thị ở ô "Private Key" , người dùng có thể lưu lại nếu muốn.
                                            </li>
                                        </ol>

                                        <div class="alert alert-warning" role="alert">
                                            ⚠️ Hãy giữ gìn <strong>Private Key</strong> cẩn thận. Không chia sẻ nó với
                                            bất kỳ ai!
                                        </div>
                                    </div>

                                    <div class="d-flex flex-column align-items-center mt-4">
                                        <a href="${pageContext.request.contextPath}/downloadController?type=public&userId=${userId}&version=1"
                                           class="btn btn-outline-primary btn-lg mb-2">
                                            📥 Tải Public Key
                                        </a>

                                        <a href="${pageContext.request.contextPath}/downloadController?type=private&userId=${userId}&version=1"
                                           class="btn btn-outline-danger btn-lg mb-2">
                                            🔐 Tải Private Key
                                        </a>

                                        <a href="https://drive.google.com/uc?export=download&id=1hGw-APz6mKfM6u1y-QoiGABFAzsVAINK"
                                           class="gdrive btn btn-success btn-lg ">
                                            🛠️ Tải công cụ ký/giải mã
                                        </a>
                                    </div>
                                    <div>
                                    <a href="${pageContext.request.contextPath}/"
                                       class="btn border-dark btn-lg px-5 text-dark"
                                    >Quay về trang chủ
                                    </a>
                                    </div>
                                </c:when>
                                <c:when test="${messageRedirect !=null}">
                                    <h2 class="fw-bold mb-2 text-uppercase">Đơn hàng của bạn đã được tiếp nhận</h2>
                                    <i class="bi bi-check2"></i>

                                    <a href="${pageContext.request.contextPath}/"
                                       class="btn border-dark btn-lg px-5 text-dark"
                                    >Quay về trang chủ
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <h2 class="fw-bold mb-2 text-uppercase">Chúng tôi đã gửi email xác nhận cho bạn</h2>
                                    <p class="text-dark mb-5">vui lòng kiểm tra email</p>
                                    <a href="${pageContext.request.contextPath}/"
                                       class="btn border-dark btn-lg px-5 text-dark" type="submit"
                                    >Quay về trang chủ
                                    </a>
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<jsp:include page="/frontend/header_footer/footer.jsp"/>

</body>
</html>