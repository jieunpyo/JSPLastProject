<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 800px;
}
</style>
</head>
<body>
<div class="container">
   <div class="row">
    <table class="table">
      <tr>
       <td><a href="../emp/all.do?empno=7900">삭제</a></td>
      </tr>
    </table>
   </div>
   <div class="row">
    <h1 class="text-center">사원 정보(1)</h1>
    <table class="table">
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직위</th>
        <th>입사일</th>
        <th>급여</th>
      </tr>
      <c:forEach var="vo" items="${list1 }">
       <tr>
        <th>${vo.empno }</th>
        <th>${vo.ename }</th>
        <th>${vo.job }</th>
        <th>${vo.dbday }</th>
        <th>${vo.sal }</th>
        </tr>
      </c:forEach>
   </table>
   <h1 class="text-center">사원 정보(2)</h1>
    <table class="table">
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직위</th>
        <th>입사일</th>
        <th>급여</th>
      </tr>
      <c:forEach var="vo" items="${list2 }">
       <tr>
        <th>${vo.empno }</th>
        <th>${vo.ename }</th>
        <th>${vo.job }</th>
        <th>${vo.dbday }</th>
        <th>${vo.sal }</th>
        </tr>
      </c:forEach>
   </table>
   <h1 class="text-center">사원 정보(3)</h1>
    <table class="table">
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직위</th>
        <th>입사일</th>
        <th>급여</th>
      </tr>
      <c:forEach var="vo" items="${list3 }">
       <tr>
        <th>${vo.empno }</th>
        <th>${vo.ename }</th>
        <th>${vo.job }</th>
        <th>${vo.dbday }</th>
        <th>${vo.sal }</th>
        </tr>
      </c:forEach>
   </table>
   <h1 class="text-center">사원 정보(4)</h1>
    <table class="table">
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직위</th>
        <th>입사일</th>
        <th>급여</th>
      </tr>
      <c:forEach var="vo" items="${list4 }">
       <tr>
        <th>${vo.empno }</th>
        <th>${vo.ename }</th>
        <th>${vo.job }</th>
        <th>${vo.dbday }</th>
        <th>${vo.sal }</th>
        </tr>
      </c:forEach>
   </table>
   <h1 class="text-center">사원 정보(5)</h1>
    <table class="table">
      <tr>
        <th>사번</th>
        <th>이름</th>
        <th>직위</th>
        <th>입사일</th>
        <th>급여</th>
      </tr>
      <c:forEach var="vo" items="${list5 }">
       <tr>
        <th>${vo.empno }</th>
        <th>${vo.ename }</th>
        <th>${vo.job }</th>
        <th>${vo.dbday }</th>
        <th>${vo.sal }</th>
        </tr>
      </c:forEach>
   </table>
  </div>
 </div>
</body>
</html>