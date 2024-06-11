<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="oe.market.common.O_Session" %>
<%@page import="oe.market.mem.vo.OeMemVO"%>

<%
    O_Session os = O_Session.getInstance();
    String oID = os.getSession(request);
    OeMemVO ovo = null;
    if (oID != null) {
        ovo = (OeMemVO) request.getSession().getAttribute("user");
    }
%>

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Jua&display=swap" rel="stylesheet">
    <style>
        .topnav {
            overflow: hidden;
            background-color: #95eb0c;
            position: relative;
        }

        .topnav a {
            float: left;
            color: #000000;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-family: "Do Hyeon", sans-serif;
            font-weight: 400;
            font-style: normal;
            font-size: 17px;
        }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .topnav a.active {
            background-color: #04AA6D;
            color: white;
        }

        .topnav .auth-buttons {
            float: right;
        }

        .topnav .auth-buttons button {
            background-color: #fff;
            border: 1px solid #ccc;
            color: #000;
            padding: 10px 20px;
            font-family: "Do Hyeon", sans-serif;
            font-size: 16px;
            cursor: pointer;
            margin: 8px 8px 0 0;
        }

        .topnav .auth-buttons button:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <a class="active" href="main.jsp">Home</a>
        <a href="boardSelectAll.oe">board</a>
        <a href="cartList.oe">Cart</a>
        <div class="auth-buttons">
            <c:choose>
                <c:when test="${not empty ovo}">
                    <form id="memSelectForm" method="post" action="memSelect.oe" style="display: inline;">
                        <input type="hidden" name="oid" value="${ovo.oid}"/>
                        <button type="button" onclick="document.getElementById('memSelectForm').submit()">내 정보 조회</button>
                    </form>
                    <form id="logoutForm" method="post" action="logout.oe" style="display: inline;">
                        <button type="button" onclick="document.getElementById('logoutForm').submit()">로그아웃</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <button onclick="openPopup()">로그인</button>
                    <button onclick="location.href='memForm.oe'">회원가입</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script type="text/javascript">
        function openPopup() {
            var screenWidth = window.screen.width;
            var screenHeight = window.screen.height;
            var popupWidth = 600;
            var popupHeight = 600;
            var popupX = (screenWidth - popupWidth) / 2;
            var popupY = (screenHeight - popupHeight) / 2;
            window.open('loginForm.oe', 'loginPopup', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ',top=' + popupY);
        }

        function updateLoginStatus(oid) {
            $(".auth-buttons").html('<form id="memSelectForm" method="post" action="memSelect.oe" style="display: inline;">' +
                '<input type="hidden" name="oid" value="' + oid + '"/>' +
                '<button type="button" onclick="submitPostForm(\'memSelectForm\')">내 정보 조회</button>' +
                '</form>' +
                '<form id="logoutForm" method="post" action="logout.oe" style="display: inline;">' +
                '<button type="button" onclick="submitPostForm(\'logoutForm\')">로그아웃</button>' +
                '</form>');
        }

        function submitPostForm(formId) {
            document.getElementById(formId).submit();
        }

        $(document).ready(function () {
            <% if (ovo != null) { %>
                updateLoginStatus("<%= ovo.getOid() %>");
            <% } %>
        });
    </script>
