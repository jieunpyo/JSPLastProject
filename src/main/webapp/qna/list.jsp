<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/table.css">
<style type="text/css">
.board_row{
  margin: 0px auto;
  width: 900px;
}
.badge {
  display: inline-block;
  padding: 4px 10px;
  border-radius: 999px;
  font-size: 0.75rem;
  font-weight: 700;
  border: 1px solid transparent;
}
.badge-no {
  background: #fef3c7;
  color: #92400e;
  border-color: #fde68a;
}
.badge-yes {
  background: #fee2e2;
  color: #b91c1c;
  border-color: #fecaca;
}
/* 테이블 헤더 전체 둥근형 */
.table thead tr th:first-child {
    border-top-left-radius: 12px;
}

.table thead tr th:last-child {
    border-top-right-radius: 12px;
}

/* 헤더 배경 · 색상 */
.table thead th {
    background: #f3f0ff;
    border-bottom: 2px solid #d6d2ff;
    color: #5b4fb2;
    font-weight: 700;
    text-align: center;
    padding: 12px 0;
}
/* 테이블 전체 */
.table-hover tbody tr:hover {
    background-color: #f9f3ff !important;
}

/* 제목 컬럼 a 태그 */
.table a {
    color: #6a4fbf;
    font-weight: 600;
    text-decoration: none;
}
.table a:hover {
    text-decoration: underline;
    color: #8f6cef;
}

/* 상태 배지 */
.badge-no {
    background-color: #f7b5c2;
    color: #fff;
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 12px;
}

.badge-yes {
    background-color: #96d7c6;
    color: #fff;
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 12px;
}

/* 페이징 버튼 */
.btn-pink {
    background-color: #ff9ec7;
    border: none;
    color: #fff;
    font-weight: 600;
    border-radius: 20px;
    padding: 5px 15px;
}
.btn-pink:hover {
    background-color: #ff7ab3;
}

.btn-mint {
    background-color: #82e0d4;
    border: none;
    color: #fff;
    font-weight: 600;
    border-radius: 20px;
    padding: 5px 15px;
}
.btn-mint:hover {
    background-color: #5bd4c3;
}

/* 테이블 헤더 */
.table th {
    background: #f3f0ff;
    border-bottom: 2px solid #d6d2ff;
    color: #5b4fb2;
    font-weight: 700;
    text-align: center;
}

/* 셀 */
.table td {
    vertical-align: middle !important;
    font-size: 14px;
}

</style>
</head>
<body>
<!-- ****** Breadcumb Area Start ****** -->
    <div class="breadcumb-area" style="background-image: url(../img/bg-img/breadcumb.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="bradcumb-title text-center">
                        <h2>묻고 답하기</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="breadcumb-nav">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <%-- 검색기 --%>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Breadcumb Area End ****** -->

    <!-- ****** Archive Area Start ****** -->
    <section class="archive-area section_padding_80">
        <div class="container">
            <div class="row board_row">
            
	              <table class="table table-hover">
	               <thead>
	                <tr>
	                 <th class="text-center" width="10%">번호</th>
	                 <th class="text-center" width="35%">제목</th>
	                 <th class="text-center" width="15%">이름</th>
	                 <th class="text-center" width="20%">작성일</th>
	                 <th class="text-center" width="10%">조회수</th>
	                 <th class="text-center" width="10%">상태</th>
	                </tr>
	               </thead>
	                <c:forEach var="vo" items="${list }">
	                 <tr>
	                  <td class="text-center" width="10%">${vo.no}</td>
	                  <td width="15%">
	                   <a href="#">${vo.subject }</a>
	                   <c:if test="${today==vo.dbday }">
	                    &nbsp;<sup><img src="../board/images/new.gif"></sup>
	                   </c:if>
	                  </td>
	                  <td class="text-center" width="15%">${vo.name }</td>
	                  <td class="text-center" width="20%">${vo.dbday }</td>
	                  <td class="text-center" width="10%">${vo.hit }</td>
	                  <c:if test="${vo.state==0 }">
	                   <td class="text-center" width="10%"><span class="badge badge-no">대기</span></td>
	                  </c:if>
	                  <c:if test="${vo.state==1 }">
	                   <td class="text-center" width="10%"><span class="badge badge-yes">완료</span></td>
	                  </c:if>
	                </tr>
	                
	                </c:forEach>
	              </table>
	              <table class="table">
	                <tr>
	                 <td class="text-center">
	                  <a href="../qna/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-pink"><span class="glyphicon glyphicon-chevron-left"></span>이전</a>
	                  ${curpage } page / ${totalpage } pages
	                  <a href="../qna/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-mint">다음<span class="glyphicon glyphicon-chevron-right"></span></a> 
	                 </td>
	                </tr>
	              </table>
              </div>
            
        </div>
    </section>
</body>
</html>