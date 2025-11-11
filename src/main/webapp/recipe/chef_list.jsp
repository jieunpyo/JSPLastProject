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
 .chef-card {
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    padding: 20px;
    margin-bottom: 30px;
    transition: all 0.3s ease;
    border-top: 5px solid #f7a9a8; /* 포인트라인 */
  }
  .chef-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 6px 15px rgba(247,169,168,0.3);
    background-color: #fff7f5;
  }

  .chef-card img {
    border: 3px solid #a3d2ca;
    transition: all 0.3s ease;
  }
  .chef-card:hover img {
    border-color: #f7a9a8;
  }

  .chef-name {
    color: #f7a9a8;
    font-weight: bold;
    font-size: 20px;
    margin-top: 10px;
  }

  .chef-stats {
    margin-top: 15px;
  }
  .chef-stats td {
    padding: 10px;
    font-size: 14px;
    color: #666;
  }
  .chef-stats img {
    width: 20px;
    height: 20px;
    vertical-align: middle;
  }

  /* pastel pagination */
  .pagination>li>a {
    background-color: transparent;
    color: #f7a9a8;
    border: 1px solid #f7a9a8;
  }
  .pagination>li.active>a {
    background-color: #a3d2ca;
    border-color: #a3d2ca;
    color: #fff;
  }
  .pagination>li>a:hover {
    background-color: #ffc1a1;
    border-color: #ffc1a1;
    color: #fff;
  }

  .chef_row {
    margin-top: 50px;
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
                        <h2>쉐프 목록</h2>
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
    <div class="row chef_row text-center">
      <c:forEach var="vo" items="${list}">
        <div class="col-md-4 col-sm-6">
          <div class="chef-card">
            <img src="${vo.poster}" class="img-circle" style="width:150px;height:150px;">
            <div class="chef-name">${vo.chef}</div>
            <table class="table chef-stats text-center">
              <tr>
                <td><img src="icon/m1.png">&nbsp;${vo.mem_cont1}</td>
                <td><img src="icon/m2.png">&nbsp;${vo.mem_cont2}</td>
              </tr>
              <tr>
                <td><img src="icon/m3.png">&nbsp;${vo.mem_cont7}</td>
                <td><img src="icon/m4.png">&nbsp;${vo.mem_cont3}</td>
              </tr>
            </table>
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="row">
      <div class="col-md-12 text-center">
        <ul class="pagination">
          <c:if test="${startPage>1}">
            <li><a href="../recipe/chef_list.do?page=${startPage-1}">&lt;</a></li>
          </c:if>

          <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <li ${i==curpage?'class=active':''}>
              <a href="../recipe/chef_list.do?page=${i}">${i}</a>
            </li>
          </c:forEach>

          <c:if test="${endPage<totalpage}">
            <li><a href="../recipe/chef_list.do?page=${endPage+1}">&gt;</a></li>
          </c:if>
        </ul>
      </div>
    </div>
  </div>
</section>
</body>
</html>