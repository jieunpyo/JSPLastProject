<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('.times').click(function(){
		let time=$(this).text();
		$('#food_reserve_time').text(time)
		$('#rtime').val(time)
		
	})
})
</script>
</head>
<body>
  <c:forEach var="time" items="${tList }">
   <button class="btn btn-outline-primary btn-sm times">${time }</button>
  </c:forEach>
</body>
</html>