<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="oe.market.cart.vo.OeCartVO" %>
<%@ page import="java.util.List" %>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
    // 세션에서 로그인한 사용자 아이디 가져오기
    String oid = (String) session.getAttribute("oid");
    if (oid == null || oid.isEmpty()) {
        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        response.sendRedirect("login.oe");
        return;
    }

    // 리스트 가져오기
    Object obj = request.getAttribute("cartList");
    List<OeCartVO> cartList = (List<OeCartVO>) obj;

    // 로그 출력
    System.out.println("로그인한 사용자 OID: " + oid);
    System.out.println("찜한 게시글 목록 크기: " + (cartList != null ? cartList.size() : "null"));
%>

<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>찜한 게시글 목록</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Hi+Melody&family=Tiny5&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Black Han Sans", sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        table {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        .clickable-row {
            cursor: pointer;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #f1f1f1;
            margin-top: auto;
        }

        .footer nav a {
            margin: 0 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".clickable-row").click(function() {
                window.location = $(this).data("href");
            });
        });
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/view/header.jsp" />

    <div class="w3-container">
        <h2>찜한 게시글 목록</h2>
        <table>
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>가격</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody>
                <% if (cartList != null) {
                    for (OeCartVO ocvo : cartList) { %>
                        <tr class="clickable-row" data-href="boardSelect.oe?bnum=<%= ocvo.getBnum() %>">
                            <td><%= ocvo.getBnum() %></td>
                            <td><%= ocvo.getBtitle() %></td>
                            <td><%= ocvo.getBcontent() %></td>
                            <td><%= ocvo.getBprice() %></td>
                            <td><%= ocvo.getInsertdate() %></td>
                        </tr>
                <%  }
                   } else { %>
                        <tr>
                            <td colspan="5">찜한 게시글이 없습니다.</td>
                        </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
