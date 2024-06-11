<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="oe.market.common.O_Session" %>
<%@page import="oe.market.mem.vo.OeMemVO"%>  
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Jua&display=swap" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <title>오이마켓</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

	function openPopup() {

		var screenWidth = window.screen.width;
		var screenHeight = window.screen.height;

		// 팝업 창 크기 정보
		var popupWidth = 600;
		var popupHeight = 600;

		// 팝업 창 중앙 위치 계산
		var popupX = (screenWidth - popupWidth) / 2;
		var popupY = (screenHeight - popupHeight) / 2;

		// 팝업 창 열기
		var popupWindow = window.open('loginForm.oe', 'loginPopup', 'width='
				+ popupWidth + ',height=' + popupHeight + ',left=' + popupX
				+ ',top=' + popupY);
		

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
          <% O_Session os = O_Session.getInstance();
              String oID = os.getSession(request);
              OeMemVO ovo = null;

              if (oID != null) {
                  ovo = (OeMemVO) request.getSession().getAttribute("user");
                  if (ovo != null) {
          %>
          updateLoginStatus("<%= ovo.getOid() %>");
          <% }
              }
          %>
        
      });
      
      
    </script>
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

        body {
            line-height: 1;
        }

        .body_content_1 {
            height: 700px;
            width: 100%;
            margin: auto;
            background-color: #90c799;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
        }

        .body_wrap {
            padding: 20px;
            width: 100%;
        }

        .big {
            font-size: 5vw;
            line-height: 1.3;
            font-weight: 500;
            margin-bottom: 2.6rem;
            letter-spacing: -0.4px;
            text-align: center;
        }

        .highlight {
            color: #ffff;
            font-weight: bold;
            font-family: "Jua", sans-serif;
        }

        .highlight_2 {
            color: #00ff4c;
            font-weight: bold;
            font-family: "Jua", sans-serif;
        }

        .small {
            font-size: 1.0rem;
            font-weight: 400;
            line-height: 1.5;
            letter-spacing: -0.3px;
            text-align: center;
        }

        .body_content_2 {
            height: 700px;
            width: 100%;
            margin: auto;
            background-color: white;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .green_button {
            border-radius: 6px;
            font-size: large;
            font-weight: 600;
            border: none;
            display: inline-block;
            padding: 1.5rem 2rem;
            background-color: #04AA6D;
            color: white;
            margin: 10px;
            transition: background-color 0.3s ease-in-out;
            cursor: pointer;
        }

        .green_button:hover {
            background-color: #039f5e;
        }

        .slidebox {
            max-width: 700px;
            margin: 0 auto 50px;
            position: relative;
            overflow: hidden;
        }

        .slidebox .slidelist {
            display: flex;
            transition: transform 0.5s ease-in-out;
        }

        .slidebox .slidelist .slideitem {
            min-width: 100%;
            box-sizing: border-box;
        }

        .slidebox .slidelist .slideitem img {
            width: 100%;
            border-radius: 12px;
        }

        .top_title {
            font-weight: bold;
            font-family: "Jua", sans-serif;
            text-align: center;
            margin: 50px 0;
        }

        footer {
            background-color: #04AA6D;
            padding: 20px 0;
            color: white;
            text-align: center;
        }

        footer .menu {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        footer .menu li {
            display: inline;
        }

        footer .menu li a {
            color: white;
            text-decoration: none;
        }

        footer .menu li a:hover {
            text-decoration: underline;
        }

        footer .info {
            margin-top: 10px;
            font-size: 14px;
        }

        footer .copyright {
            margin-top: 10px;
            font-size: 12px;
        }

        /* 반응형 스타일 */
        @media (max-width: 1024px) {
            .body_content_1,
            .body_content_2 {
                width: 100%;
                padding: 0 20px;
            }

            .body_wrap {
                flex-direction: column;
                align-items: center;
            }
        }

        @media (max-width: 768px) {
            .topnav a {
                float: none;
                display: block;
                text-align: left;
            }

            .big,
            .small {
                text-align: center;
            }

            .green_button {
                width: 100%;
                margin-left: 0;
                margin-bottom: 10px;
            }

            .body_content_1,
            .body_content_2 {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .body_content_1 img,
            .body_content_2 img {
                width: 100%;
                height: auto;
            }
        }

        @media (max-width: 480px) {
            .big {
                font-size: 5vw;
            }

            .slide-control [class*="control"] label {
                padding: 10px;
            }

            .slidebox .slide-control [class*="control"] label.prev {
                left: -25px;
            }

            .slidebox .slide-control [class*="control"] label.next {
                right: -25px;
            }

            .topnav a {
                padding: 10px 12px;
                font-size: 14px;
            }
        }
    </style>
</head>
	<div class="topnav">
		<a class="active" href="#home">Home</a>
		<a href="boardSelectAll.oe">Board</a>
		<a href="cartList.oe" id="cart">Cart</a>
		<div class="auth-buttons">
			<button onclick="openPopup()">로그인</button>
			<button onclick="location.href='memForm.oe'">회원가입</button>	
        </div>
    </div>
    <br>
    <div id="body">
        <div class="body_content_1">
            <div class="body_wrap">
                <h2 class="big"><span class="highlight">오</span>직 <br><span class="highlight">이</span>곳에서만</h2>
            </div>
            <div class="body_wrap">
                <img class="image_1" src="images/메인사진1.png" width="650" height="auto">
            </div>
        </div>
        <div class="body_content_2">
            <div class="body_wrap">
                <img src="images/오이마켓로고.png" width="600" height="auto">
            </div>
            <div class="body_wrap">
                <h2 class="medium" style="font-size: 2vw;"><span class="highlight_2">오</span>직 <span class="highlight_2">이</span>곳에서만<br><br>
                <div>
                    <button class="green_button">인기매물 보기</button>
                    <button class="green_button">믿을 수 있는 중고거래</button>
                </div>
            </div>
        </div>
        <div>
            <h1 class="top_title">중고거래 인기매물</h1>
            <div class="slidebox">
                <div class="slidelist">
                    <div class="slideitem">
                        <a href="#">
                            <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202303/2e3462bb439e276d12b809c12f515a5ee4ed128aa4799ca88879a79de0df7c79.webp?q=82&s=300x300&t=crop" style="border-radius: 12px;">
                        </a>
                    </div>
                    <div class="slideitem">
                        <a href="#">
                            <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202303/8c895d09679a822fc66fc85d9171a4c93af08f25b69c66b245e6dda3d3334702.webp?q=82&s=300x300&t=crop" style="border-radius: 12px;">
                        </a>
                    </div>
                    <div class="slideitem">
                        <a href="#">
                            <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202303/c2bbbad3e6b2b451aac966c26938a4ef8db909109c61876a2c614d204a888529.webp?q=82&s=300x300&t=crop" style="border-radius: 12px;">
                        </a>
                    </div>
                    <div class="slideitem">
                        <a href="#">
                            <img src="https://dnvefa72aowie.cloudfront.net/origin/article/202303/7c0a3c3645abc9f767d9b437449edff4d0e1aa472b1483c45b26d01d93c3965d.jpg?q=82&s=300x300&t=crop" style="border-radius: 12px;">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer>
        <div class="inner">
            <ul class="menu">
                <li><a href="">개인정보처리방침</a></li>
                <li><a href="">영상정보처리기기 운영관리 방침</a></li>
                <li><a href="">홈페이지 이용약관</a></li>
                <li><a href="">위치정보 이용약관</a></li>
                <li><a href="">오이마켓 카드 이용약관</a></li>
                <li><a href="">윤리경영 핫라인</a></li>
            </ul>
            <div class="info">
                <span>사업자등록번호 201-81-21515</span>
                <span>(주)오이마켓 대표이사 박제근</span>
                <span>TEL : 02) 7777-7777 / FAX : 02) 7777-7777</span>
                <span>개인정보 책임자 : 김선일</span>
            </div>
            <p class="copyright">
                &copy; <span class="this-year"></span> 2024 copyright OI MARKET Company. All Rights Reseved.
            </p>
        </div>
    </footer>
   <script>
    document.addEventListener("DOMContentLoaded", function() {
        const sliderInner = document.querySelector(".slidelist");
        const slides = document.querySelectorAll(".slideitem");
        const totalSlides = slides.length;
        let currentIndex = 0;

        function moveToNextSlide() {
            currentIndex++;
            if (currentIndex >= totalSlides) {
                currentIndex = 0;
            }
            sliderInner.style.transition = 'transform 0.5s ease-in-out';
            sliderInner.style.transform = `translateX(-${currentIndex * 100}%)`;
        }

        setInterval(moveToNextSlide, 3000);
    });
</script>
</body>

</html>
