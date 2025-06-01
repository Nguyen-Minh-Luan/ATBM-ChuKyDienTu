<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Không tìm thấy sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/general.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
        .container {
            text-align: center;
            margin-top: 100px;
        }

        .error-icon {
            font-size: 80px;
            color: #dc3545;
        }

        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<%-- Header --%>
<jsp:include page="/frontend/header_footer/header.jsp"/>

<div class="container">
    <i class="fas fa-search error-icon"></i>
    <h2 class="mt-4">Không tìm thấy sản phẩm</h2>
    <p>Rất tiếc! Chúng tôi không tìm thấy sản phẩm nào phù hợp với từ khóa của bạn.</p>
    <a href="${pageContext.request.contextPath}/" class="btn btn-primary btn-back">Quay lại trang chủ</a>
</div>

<%-- Footer --%>
<jsp:include page="/frontend/header_footer/footer.jsp"/>

</body>
</html>
