<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ page import="oe.market.board.vo.OeBoardVO" %> 
<%@ page import="oe.market.common.CodeUtil" %> 
<%@ page import="java.util.List" %> 

<% request.setCharacterEncoding("UTF-8");%> 
<%    
    Object obj = request.getAttribute("listS");
    if (obj == null) return;

    List<OeBoardVO> list = (List<OeBoardVO>)obj;    
    int nCnt = list.size();
    
    OeBoardVO _obvo = null;
    if (nCnt == 1){
        _obvo = list.get(0);
    }    
%> 
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.6.1/css/bootstrap.min.css">
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

    .container {
        flex: 1;
        padding: 20px;
    }

    table {
        width: 100%;
        max-width: 800px;
        margin: 20px auto;
        border-collapse: collapse;
        border: 1px solid #ddd;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: left;
    }

    th {
        background-color: #f8f9fa;
        font-weight: bold;
    }

    .form-control[readonly] {
        background-color: #e9ecef;
    }

    .text-center {
        text-align: center;
    }

    .text-right {
        text-align: right;
    }

    .btn {
        display: inline-block;
        font-weight: 400;
        color: #212529;
        text-align: center;
        vertical-align: middle;
        user-select: none;
        background-color: transparent;
        border: 1px solid transparent;
        padding: 0.375rem 0.75rem;
        font-size: 1rem;
        line-height: 1.5;
        border-radius: 0.25rem;
        transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    }

    .btn-warning {
        color: #212529;
        background-color: #ffc107;
        border-color: #ffc107;
    }

    .btn-warning:hover {
        color: #212529;
        background-color: #e0a800;
        border-color: #d39e00;
    }

    .btn-danger {
        color: #fff;
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-danger:hover {
        color: #fff;
        background-color: #c82333;
        border-color: #bd2130;
    }

    .btn-secondary {
        color: #fff;
        background-color: #6c757d;
        border-color: #6c757d;
    }

    .btn-secondary:hover {
        color: #fff;
        background-color: #5a6268;
        border-color: #545b62;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .btn-container {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
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
		
		 var timer = setInterval(function() { 
	            if(popupWindow.closed) {
	                clearInterval(timer);
	                window.location.reload();
	            }
	        }, 1000);
	}
        $(document).ready(function(){
            
            let pwck = false;
            
            //  pwBtn : 비밀번호 확인 
            $(document).on("click", "#pwbtn", function(){
                let pwcheckURL = "boardPwCheck.oe";
                let reqType = "POST";
                let dataParam = {
                    bnum: $("#bnum").val(),
                    bpw: $("#bpw").val(),
                };
                console.log("dataParam >>> : " + dataParam);

                $.ajax({
                    url: pwcheckURL,
                    type: reqType,
                    data: dataParam,                
                    success: whenSuccess,
                    error: whenError
                });

                function whenSuccess(resData){
                    console.log("resData >>> : " + resData);
                    if ("ID_YES" == resData){
                        alert("비밀번호 확인되었습니다.");
                        $("#U").css('background-color','yellow');
                        pwck = true;
                    }else if ("ID_NO" == resData){
                        alert("비밀번호가 일치하지 않습니다.");
                        return;
                    };
                }
                function whenError(e){
                    console.log("e >>> : " + e.responseText);
                }
            });
            
            $("#cartBtn").on("click", function() {
                var bnum = $("#bnum").val();
                var oid = $("#oid").val();

                $.ajax({
                    url: 'addCart.oe',
                    type: 'POST',
                    data: { bnum: bnum, oid: oid },
                    dataType: 'json',
                    success: function(response) {
                        if (response.loginRequired) {
                            alert('로그인이 필요합니다.');
                            openPopup();
                            return;
                        }

                        alert(response.message);
                        if (response.status == 'success') {
                            location.reload();
                        }
                    },
                    error: function(error) {
                        console.log('Error:', error);
                    }
                });
            });
            
            //  U
            $(document).on("click", "#U", function(e){
                alert("수정 요청");
                e.preventDefault();
                if(pwck){
                    $("#boardUpdateForm").attr({ "method":"GET", "action":"boardUpdate.oe"}).submit();
                }else{
                    alert("비밀번호를 맞게 입력하여야 수정 가능합니다.");
                }
            });

            // D
            $(document).on("click", "#D", function(e){
                alert("삭제 요청");
                e.preventDefault();
                if(pwck){
                $("#boardUpdateForm").attr({ "method":"GET", "action":"boardDelete.oe"}).submit();
                }else{
                    alert("비밀번호를 맞게 입력하여야 삭제가 가능합니다.");
                }
            });
        });
    </script>
</head>
<body>
    <jsp:include page="/WEB-INF/view/header.jsp" />

    <div class="container">
        <form name="boardUpdateForm" id="boardUpdateForm">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" class="text-center">게시판 글 내용</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>글번호</td>
                        <td><input type="text" class="form-control" name="bnum" id="bnum" value="<%= _obvo.getBnum() %>" readonly/></td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" class="form-control" name="bsubject" id="bsubject" value="<%= _obvo.getBtitle() %>" readonly/></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" class="form-control" name="bname" id="bname" value="<%= _obvo.getOid() %>" readonly/></td>
                    </tr>
                    <tr>
                        <td>소개글</td>
                        <td><textarea class="form-control" name="bcontent" id="bcontent" rows="8"><%= _obvo.getBcontent() %></textarea></td>
                    </tr>
                    <tr>
                        <td>사진</td>
                        <td><img src="/oeMarket/image/<%= _obvo.getBphoto() %>" class="img-fluid" alt="게시글 이미지"></td>
                    </tr>
                    <tr>
                        <td>등록일</td>
                        <td><input type="text" class="form-control" name="sbinsertdate" id="sbinsertdate" value="<%= _obvo.getInsertdate() %>" readonly /></td>
                    </tr>
                    <tr>
                        <td>수정일</td>
                        <td><input type="text" class="form-control" name="sbupdatedate" id="sbupdatedate" value="<%= _obvo.getUpdatedate() %>" readonly /></td>
                    </tr>
                    <tr>
                        <td>패스워드</td>
                        <td>
                            <input type="password" class="form-control" name="bpw" id="bpw" />
                            <button type="button" class="btn btn-secondary mt-2" id="pwbtn">비밀번호 확인</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button type="button" class="btn btn-danger" id="cartBtn">찜하기</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right">
                            <button type="button" class="btn btn-warning" id="U">수정</button>
                            <button type="button" class="btn btn-warning" id="D">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <form id="cartInsert" name="cartInsert" method="POST" action="addCart.oe" style="display:none;">
            <input type="hidden" id="deleteyn" name="deleteyn" value="Y">
            <input type="hidden" name="bnum" value="<%= _obvo.getBnum() %>">
            <input type="hidden" name="oid" value="<%= _obvo.getOid() %>">
        </form>
    </div>

    <!-- 댓글 처리 하는 루틴  -->
    <jsp:include page="/commForm.oe">
        <jsp:param value="<%=_obvo.getBnum()%>" name="bnum"/>
    </jsp:include>
    <jsp:include page="/WEB-INF/view/footer.jsp" />

</body>
</html>
