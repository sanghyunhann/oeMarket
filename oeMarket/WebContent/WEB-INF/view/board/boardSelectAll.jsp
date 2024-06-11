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
    logger.info("oeBoardSelectAll.jsp 페이지 >>> : ");

    // 페이징 변수 세팅
    int pageSize = 10;
    int groupSize = 5;
    int curPage = 1;
    int totalCount = 0;

    Object objPaging = request.getAttribute("pagingOBVO");
    OeBoardVO pagingOBVO = (OeBoardVO) objPaging;
    if(pagingOBVO != null){
    	 pageSize = Integer.parseInt(pagingOBVO.getPageSize()) > 0 ? Integer.parseInt(pagingOBVO.getPageSize()) : pageSize;
         groupSize = Integer.parseInt(pagingOBVO.getGroupSize()) > 0 ? Integer.parseInt(pagingOBVO.getGroupSize()) : groupSize;
         curPage = Integer.parseInt(pagingOBVO.getCurPage()) > 0 ? Integer.parseInt(pagingOBVO.getCurPage()) : curPage;
    }
    Object obj = request.getAttribute("listAll");
    List<OeBoardVO> list = (List<OeBoardVO>) obj;
    int nCnt = (list != null) ? list.size() : 0;
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <title>오직 이곳에서만 오이</title>

    <link rel="icon" type="image/x-icon" href="images/oee.jpg">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Gasoek+One&family=Jua&display=swap" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <script type="text/javascript">
        $(document).ready(function() {
            // 글 영역 클릭 이벤트 처리
            $(document).on("click", ".boardItem", function() {
                var bnum = $(this).data("bnum"); // 해당 글의 번호 가져오기
                window.location.href = "boardSelect.oe?bnum=" + bnum; // 해당 글의 선택 페이지로 이동
            });

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
                var popupWindow = window.open('loginForm.oe', 'loginPopup', 'width=' + popupWidth + ',height=' + popupHeight + ',left=' + popupX + ',top=' + popupY);

                var timer = setInterval(function() {
                    if (popupWindow.closed) {
                        clearInterval(timer);
                        window.location.reload();
                    }
                }, 1000);
            }
            // 글쓰기 버튼 클릭 이벤트 처리
            $('#insertBtn').on('click', function() {
                var loginRequired = '<%= session.getAttribute("loginRequired") %>';
                if (loginRequired == 'true') {
                    if (confirm('로그인을 해야 이용 가능한 기능입니다. 로그인을 하시겠습니까?')) {
                        openPopup();
                    } else {
                        window.location.href = 'boardSelectAll.oe';
                    }
                } else {
                    window.location.href = 'boardForm.oe'; // 글쓰기 페이지로 이동
                }
            });

            // 날짜를 '몇 시간 전' 형식으로 변환하는 함수
            function timeAgo(dateString) {
                const now = new Date();
                const date = new Date(dateString);
                const diff = now - date; // 차이(ms 단위)
                const minutes = Math.floor(diff / 1000 / 60);
                const hours = Math.floor(minutes / 60);
                const days = Math.floor(hours / 24);
                if (days > 0) return days + '일 전';
                if (hours > 0) return hours + '시간 전';
                if (minutes > 0) return minutes + '분 전';
                return '방금 전';
            }
            document.querySelectorAll('.updatedate').forEach(function(element) {
                const dateString = element.getAttribute('data-date');
                element.textContent = timeAgo(dateString);
            });
        });
    </script>
    <style>
        .card-img-top {
            width: 100%;
            height: auto;
            max-height: 300px; /* 원하는 최대 높이 설정 */
            object-fit: cover; /* 이미지 비율을 유지하며 카드 크기에 맞추기 */
        }
        .card-body {
            text-align: left;
        }
        .container {
            margin-top: 20px;
        }
        .boardItem {
            cursor: pointer;
        }
    </style>
</head>
<body class="hoian-kr">
    <jsp:include page="/WEB-INF/view/header.jsp" />
    <div class="container">
        <h3 class="text-center">게시판 목록</h3>
        <hr>
        <form name="boardList" id="boardList">
            <div class="row">
                <% if (nCnt == 0) { %>
                    <div class="col-12 text-center">
                        <p>게시물이 없습니다.</p>
                    </div>
                <% } else {
                    for (int i = 0; i < nCnt; i++) {
                        OeBoardVO _obvo = list.get(i);
                        // 페이징 세팅
                        
                        totalCount = Integer.parseInt(_obvo.getTotalCount());
                        if (i % 3 == 0 && i != 0) {
                %>
                    </div>
                    <div class="row">
                <% } %>
                    <div class="col-md-4 mb-4">
                        <div class="card boardItem" data-bnum="<%= _obvo.getBnum() %>">
                            <img class="card-img-top" src="/oeMarket/image/<%= _obvo.getBphoto() %>" alt="Card image">
                            <div class="card-body">
                                <h5 class="card-title"><%= _obvo.getBtitle() %></h5>
                                <p class="card-text">작성자: <%= _obvo.getOid() %></p>
                                <p class="card-text">가격: <%= _obvo.getBprice() %></p>
                                <p class="card-text updatedate" data-date="<%= _obvo.getUpdatedate() %>"></p>
                                <p class="card-text">조회수: <%= _obvo.getBhit() %></p>
                            </div>
                        </div>
                    </div>
                <% } %>
                <% } %>
            </div>
            <div class="row">
                <div class="col-12">
                    <jsp:include page="boardPaging.jsp" flush="true">
                        <jsp:param name="url" value="boardSelectAll.oe"/>
                        <jsp:param name="str" value=""/>
                        <jsp:param name="pageSize" value="<%=pageSize%>"/>
                        <jsp:param name="groupSize" value="<%=groupSize%>"/>
                        <jsp:param name="curPage" value="<%=curPage%>"/>
                        <jsp:param name="totalCount" value="<%=totalCount%>"/>
                    </jsp:include>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-right">
                    <button type="button" class="btn btn-danger" id="insertBtn">글쓰기</button>
                    <button type="button" class="btn btn-primary" id="selectAllBtn">글목록</button>
                </div>
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
