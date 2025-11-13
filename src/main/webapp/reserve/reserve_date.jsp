<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
  <table class="table">
   <tr>
    <td colspan="7">
     <h3>${year }년 ${month }월</h3>
    </td>
   </tr>
   <tr>
   	 <c:forEach var="weeks" items="${weeks }" varStatus="s">
   	   <td class="text-center">
   	   	 <c:set var="style" value="black"/>
   	     <c:choose>
   	       <c:when test="${s.index==0 }">
   	        <c:set var="style" value="red"/>
   	       </c:when>
   	       <c:when test="${s.index==6 }">
   	        <c:set var="style" value="blue"/>
   	       </c:when>
   	       <c:otherwise>
   	        <c:set var="style" value="black"/>
   	       </c:otherwise>
   	     </c:choose>
     	 <h3 style="color:${style}">
     	   ${weeks }
     	 </h3>
       </td>
   	 </c:forEach>
   </tr>
   <c:set var="week" value="${week }"/>
   <c:forEach var="i" begin="1" end="${lastday }">
	   <c:set var="style" value="black"/>
	   	     <c:choose>
	   	       <c:when test="${week==0 }">
	   	        <c:set var="style" value="red"/>
	   	       </c:when>
	   	       <c:when test="${week==6 }">
	   	        <c:set var="style" value="blue"/>
	   	       </c:when>
	   	       <c:otherwise>
	   	        <c:set var="style" value="black"/>
	   	       </c:otherwise>
	   	     </c:choose>
     <c:if test="${i==1 }">
       <tr>
       <c:forEach var="j" begin="1" end="${week }">
         <td class="text-center">&nbsp;</td> 
       </c:forEach>
     </c:if>
     <td class="text-center"><h4 style="color:${style}">${i}</h4></td>
     <c:set var="week" value="${week+1 }"/>
     <c:if test="${week>6}">
       <c:set var="week" value="0"/>
       </tr>
       <tr>
     </c:if>
   </c:forEach>
   </tr>
  </table>
</body>
</html>