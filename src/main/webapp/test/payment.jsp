<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
  background: linear-gradient(135deg, #0a1930, #182848);
  color: white;
  font-family: "Noto Sans KR", sans-serif;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
}
.payment-container {
  background: rgba(20, 30, 60, 0.85);
  backdrop-filter: blur(15px);
  border-radius: 20px;
  padding: 40px;
  box-shadow: 0 8px 40px rgba(0,0,0,0.4);
  width: 600px;
}
.section-title {
  font-weight: bold;
  margin-bottom: 10px;
  border-bottom: 1px solid rgba(255,255,255,0.2);
  padding-bottom: 5px;
}
.form-control, .form-select {
  background-color: rgba(255, 255, 255, 0.1);
  color: white;
  border: none;
}
.form-control:focus, .form-select:focus {
  background-color: rgba(255,255,255,0.2);
  color: white;
  box-shadow: 0 0 6px rgba(255,255,255,0.4);
}
.btn-primary {
  background-color: #1e90ff;
  border: none;
  border-radius: 10px;
  padding: 10px 20px;
}
.btn-primary:hover {
  background-color: #0f6fff;
}
</style>
</head>

<body>
<div class="payment-container">
  <h3 class="text-center mb-4">결제 정보 확인</h3>

  <form action="payment_ok.jsp" method="post">

    <!-- 주문자 정보 -->
    <div class="mb-3">
      <div class="section-title">주문자 정보</div>
      <div class="row">
        <div class="col-md-6">
          <label class="form-label">이름</label>
          <input type="text" name="name" value="${user.name}" class="form-control" required>
        </div>
        <div class="col-md-6">
          <label class="form-label">전화번호</label>
          <input type="text" name="phone" value="${user.phone}" class="form-control" required>
        </div>
      </div>
    </div>

    <!-- 배송지 선택 -->
    <div class="mb-3">
      <div class="section-title">배송지 선택</div>
      <select id="addressSelect" class="form-select mb-2">
        <option value="">-- 배송지를 선택하세요 --</option>
        <c:forEach var="addr" items="${addressList}">
          <option value="${addr.fullAddress}">${addr.alias} - ${addr.fullAddress}</option>
        </c:forEach>
        <option value="new">+ 새 주소 입력</option>
      </select>

      <div id="newAddressSection" style="display: none;">
        <input type="text" name="address" class="form-control mt-2" placeholder="새 배송지를 입력하세요" />
      </div>
    </div>

    <!-- 결제 수단 -->
    <div class="mb-3">
      <div class="section-title">결제 수단</div>
      <select name="paymentMethod" class="form-select">
        <option value="card">신용/체크카드</option>
        <option value="bank">무통장입금</option>
        <option value="kakaopay">카카오페이</option>
      </select>
    </div>

    <!-- 결제 금액 -->
    <div class="mb-3">
      <div class="section-title">결제 금액</div>
      <input type="text" name="amount" value="${totalPrice}" class="form-control" readonly>
    </div>

    <!-- 결제 버튼 -->
    <div class="text-center mt-4">
      <button type="submit" class="btn btn-primary w-100">결제하기</button>
    </div>

  </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const addressSelect = document.getElementById('addressSelect');
  const newAddressSection = document.getElementById('newAddressSection');

  addressSelect.addEventListener('change', function() {
    const addressInput = document.querySelector('input[name="address"]');
    if (this.value === 'new') {
      newAddressSection.style.display = 'block';
      addressInput.value = "";
    } else if (this.value !== '') {
      newAddressSection.style.display = 'none';
      addressInput.value = this.value;
    } else {
      newAddressSection.style.display = 'none';
      addressInput.value = "";
    }
  });
});
</script>

</body>
</html>
