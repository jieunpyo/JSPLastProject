<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <!-- Bootstrap 3 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f6f8;
            padding-top: 40px;
        }
        .container {
            max-width: 900px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        .table thead th {
            background-color: #337ab7;
            color: white;
            text-align: center;
        }
        .table tbody td {
            vertical-align: middle;
        }
        .table-hover tbody tr:hover {
            background-color: #d9edf7;
        }
        .date, .author {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>공지사항</h1>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th class="author">작성자</th>
                <th class="date">날짜</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>서버 점검 안내</td>
                <td class="author">관리자</td>
                <td class="date">2025-11-17</td>
            </tr>
            <tr>
                <td>2</td>
                <td>신규 기능 업데이트</td>
                <td class="author">관리자</td>
                <td class="date">2025-11-15</td>
            </tr>
            <tr>
                <td>3</td>
                <td>이벤트 안내</td>
                <td class="author">관리자</td>
                <td class="date">2025-11-10</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Bootstrap 3 JS (선택) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</body>
</html>
    