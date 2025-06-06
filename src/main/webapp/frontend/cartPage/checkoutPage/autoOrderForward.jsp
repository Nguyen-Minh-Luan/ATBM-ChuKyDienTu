<%-- autoOrderForward.jsp --%>
<jsp:useBean id="paymentMethod" class="java.lang.String" scope="request" />

<!DOCTYPE html>
<html>
<head>
  <title>Đang xử lý thanh toán...</title>
</head>
<body>
<form id="autoOrderForm" method="POST" action="${pageContext.request.contextPath}/Order">
  <input type="hidden" name="paymentMethod" value="${paymentMethod}" />
</form>

<script>
  // Tự động submit ngay khi trang load
  window.onload = function() {
    document.getElementById('autoOrderForm').submit();
  };
</script>
</body>
</html>
