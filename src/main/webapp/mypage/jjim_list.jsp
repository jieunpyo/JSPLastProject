<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.dataTr:hover{
  cursor: pointer;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.dataTr').click(function(){
		let fno=$(this).attr("data-no");
		//alert("fno:"+fno)
		$.ajax({
			type:'post'
			url:'../jjim/food_detail.do',
			data:{"fno",fno},
			success:function(result)
			{
				
			},
			error:function(eff)
			{
				console.log(err)
			}
		})
	})
})
</script>
</head>
<body>
<main class="mypage-main">
    <h2>찜 내역</h2>
    <div class="info-card">
      <table>
        <tr>
          <th width="10%">번호</th>
          <th width="15%"></th>
          <th width="20%">맛집명</th>
          <th width="45%">주소</th>
          <th width="15%"></th>
          <th></th>
        </tr>
        <c:forEach var="vo" items="${list }">
           <tr class="dataTr" data-no="${vo.fvo.fno}">
             <td width="10%">${vo.jno}</td>
             <td width="15%">
               <img src="${vo.fvo.poster}" style="width: 35px;height: 35px">
             </td>
             <td width="20%">${vo.fvo.name}</td>
             <td width="45%">${vo.fvo.address }</td>
             <td width="15%">
               <a href="../jjim/jjim_cancel.do?jno=${vo.jno}" class="btn btn-sm btn-danger">취소</a>
             </td>
           </tr>
        </c:forEach>
      </table>
    </div>
    
  </main>
</body>
</html>