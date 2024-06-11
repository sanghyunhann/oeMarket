<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="oe.market.board.vo.OeBoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.log4j.LogManager" %>
<%@ page import="org.apache.log4j.Logger" %>

<%
    request.setCharacterEncoding("UTF-8");
    Logger logger = LogManager.getLogger(this.getClass());
    logger.info("boardForm.jsp 페이지 >>> : ");
    OeBoardVO obvo = (OeBoardVO) request.getAttribute("obvo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <title>오이마켓 | 상품등록</title>

    <link rel="icon" type="image/x-icon" href="images/oee.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Jua&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Do Hyeon', sans-serif;
            background-color: #f8f9fa;
        }

        h3 {
            margin: 20px 0;
            font-size: 2.5rem;
            font-family: 'Jua', sans-serif;
            text-align: center;
            color: #343a40;
        }

        .container {
            padding-top: 20px;
        }

        #boardForm {
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #dee2e6;
            border-radius: 0.5rem;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            margin: 20px 0;
            text-align: left;
        }

        td {
            padding: 5px;
            vertical-align: middle;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }

        .custom-file-upload {
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            width: 120px;
            font-size: 1rem;
            border-radius: 0.5rem;
            margin-top: 20px;
        }

        .btn-danger:hover, .btn-primary:hover {
            opacity: 0.8;
        }

        .text-right {
            text-align: right;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.1/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on("click", "#bBtn", function() {
                $('#boardForm').attr({
                    'action': 'boardInsert.oe',
                    'method': 'POST',
                    'enctype': 'multipart/form-data'
                }).submit();
            });
        });

        function formatPrice() {
            const input = document.getElementById('bprice');
            let value = input.value.replace(/,/g, ''); // Remove existing commas

            // Only allow numbers
            if (isNaN(value)) {
                input.value = '';
                return;
            }

            // Add commas to the number
            value = parseFloat(value).toLocaleString('ko-KR');
            input.value = value;
        }
    </script>
</head>

<body class="hoian-kr">
    <jsp:include page="/WEB-INF/view/header.jsp" />

    <div class="container">
        <h3>상품등록</h3>
        <hr>

        <form name="boardForm" id="boardForm">
            <table>
                <tr>
                    <td colspan="2" align="center" style="padding: 20px;">
                        <div style="font-size: 20px; font-weight: bold;">상품정보</div>
                    </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>
                        <input type="text" name="oid" id="oid" value="<%= obvo.getOid() %>" readonly>
                    </td>
                </tr>
               
                <tr>
                    <td>상품명</td>
                    <td>
                        <input type="text" name="btitle" id="btitle">
                    </td>
                </tr>
                <tr>
                    <td>상품 설명</td>
                    <td>
                        <textarea name="bcontent" id="bcontent" rows="3"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>가격</td>
                    <td>
                        <input type="text" name="bprice" id="bprice" placeholder="가격을 입력해 주세요." oninput="formatPrice()">
                    </td>
                </tr> 
                 <tr>
                    <td>상품 이미지</td>
                    <td>
                        <label for="bphoto" class="custom-file-upload">상품 이미지 등록</label>
                        <input type="file" name="bphoto" id="bphoto" accept="image/jpg, image/jpeg, image/png" multiple style="display: none;">
                    </td>
                </tr>                             
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="bpw" id="bpw">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-right">
                        <button type="button" class="btn btn-danger" id="bBtn">작성 등록</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
