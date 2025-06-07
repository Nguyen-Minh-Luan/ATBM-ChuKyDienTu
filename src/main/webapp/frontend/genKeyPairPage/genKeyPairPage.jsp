<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>THOMAS - Cấp lại khóa</title>
  <link rel="icon" href="${pageContext.request.contextPath}/assets/icons/favicon.svg" type="image/x-icon"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/genKeyPair.css"/>
</head>

<body>
<!-- Header -->
<div class="row p-2 border-bottom border-dark">
  <a href="${pageContext.request.contextPath}/index.jsp"
     class="d-sm-none d-md-none d-lg-block d-flex text-dark text-decoration-none fs-4 ms-2">
    THOMAS / Cấp lại khóa
  </a>
</div>

<!-- Main content -->
<div class="container-fluid mt-5 mb-5">
  <div class="row justify-content-center">
    <div class="col-12 col-lg-10 col-xl-8">
      <div class="card w-100 shadow p-4">
        <h3 class="text-center text-uppercase fw-bold mb-4">Khóa đã được tạo thành công</h3>

        <div class="alert alert-warning" role="alert">
          ⚠️ <strong>Hãy giữ gìn Private Key cẩn thận.</strong> Không chia sẻ nó với bất kỳ ai!
        </div>

        <!-- Hướng dẫn sử dụng -->
        <div class="mb-4">
          <h5 class="fw-bold">📘 Hướng dẫn sử dụng khóa RSA:</h5>
          <div class="text-dark">
            <p class="fs-5"><strong>Bước 1:</strong> Tải về <strong>Public Key</strong>.</p>
            <p class="fs-5"><strong>Bước 2:</strong> Tải về <strong>Private Key</strong> (Đã được mã hóa).</p>
            <p class="fs-5"><strong>Bước 3:</strong> Tải và cài đặt công cụ hỗ trợ ở đường link phía dưới.</p>
            <p class="fs-5"><strong>Bước 4:</strong> Mở tool, chọn tab <strong>"Lấy Private Key"</strong>.</p>
            <p class="fs-5"><strong>Bước 5:</strong> Thêm file private key đã tải, nhập mật khẩu người dùng.</p>
            <p class="fs-5"><strong>Bước 6:</strong> Nhấn "Tạo Private Key" để giải mã. Private Key hoàn chỉnh sẽ hiển thị.</p>
          </div>
        </div>




        <!-- Hiển thị Public Key -->
        <div class="mb-4">
          <label class="form-label fw-bold">🔓 Public Key</label>
          <a href="${pageContext.request.contextPath}/downloadKey?type=public" class="btn btn-outline-primary mt-2">
            📥 Tải Public Key
          </a>
        </div>

        <!-- Hiển thị Private Key -->
        <div class="mb-4">
          <label class="form-label fw-bold">🔐 Private Key (đã mã hóa)</label>
          <a href="${pageContext.request.contextPath}/downloadKey?type=private" class="btn btn-outline-danger mt-2">
            📥 Tải Private Key
          </a>
        </div>

        <!-- Nút tải tool -->
        <div class="text-center mt-4 mb-2">
          <a href="https://drive.google.com/uc?export=download&id=1hGw-APz6mKfM6u1y-QoiGABFAzsVAINK"
             class="btn btn-success btn-lg">
            🛠️ Tải công cụ ký/giải mã
          </a>
        </div>

        <!-- Quay về -->
        <div class="text-center mt-3">
          <a href="${pageContext.request.contextPath}/" class="btn btn-outline-dark px-4">
            Quay về trang chủ
          </a>
        </div>
      </div>

    </div>
  </div>
</div>

<jsp:include page="/frontend/header_footer/footer.jsp"/>
</body>
</html>
