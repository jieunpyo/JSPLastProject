<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <c:if test="${empty list }">
   <h1>업로드된 이미지가 없습니다</h1>
  </c:if>
  <div style="display:flex;flex-wrap:wrap;gap:10px;">
    <c:forEach var="img" items="${list}">
      <div style="text-align:center;">
        <img src="${img.fileUrl}" style="width:150px;height:150px;object-fit:cover;border:1px solid #ccc;" />
        <p>${img.fileName}</p>
      </div>
    </c:forEach>
  </div>
</body>
</html>