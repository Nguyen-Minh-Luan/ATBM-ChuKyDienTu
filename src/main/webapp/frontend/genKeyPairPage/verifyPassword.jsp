<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String inputPassword = request.getParameter("password");
    String correctPassword = "123456"; // ✅ Sau này nên hash và kiểm tra ở backend (Servlet hoặc DB)

    if (inputPassword != null) {
        if (inputPassword.equals(correctPassword)) {
            response.sendRedirect("genKeyPairPage.jsp"); // 👈 Trang cấp lại khóa
            return;
        } else {
            request.setAttribute("error", "1");
        }
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác thực người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-4" style="width: 100%; max-width: 400px;">
        <h4 class="text-center mb-3">🔐 Xác thực người dùng</h4>

        <form action="verifyPassword.jsp" method="post">
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <c:if test="${ param.error}">
                <div class="alert alert-danger p-2 text-center" role="alert">
                    ❌ Mật khẩu không đúng. Vui lòng thử lại.
                </div>
            </c:if>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
