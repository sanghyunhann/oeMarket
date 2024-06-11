<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 로컬 스토리지에서 찜하기 상태 확인
		var isFavorited = localStorage.getItem('isFavorited');
		
		// 이미 찜하기를 한 경우
		if(isFavorited === 'true') {
			alert('이미 찜하셨습니다.');
			$("#cartBtn").prop('disabled', true); // 찜하기 버튼 비활성화
		}
		
		$("#cartBtn").on("click",function(){
			var msg = "이 게시글을 찜하시겠습니까?";
			
			if (confirm(msg)) {
				// 사용자가 "예" 버튼을 클릭한 경우
				$("#deleteyn").val("Y");
				$("#cartInsert").attr({
					'action':'addCart.oe',
					'method':'POST'
				}).submit();
				localStorage.setItem('isFavorited', 'true'); // 로컬 스토리지에 찜하기 상태 저장
			} else {
				// 사용자가 "아니요" 버튼을 클릭한 경우
				$("#deleteyn").val("N");
				$("#cartInsert").attr({
					'action':'addCart.oe',
					'method':'POST'
				}).submit();
				console.log("사용자가 찜하기를 취소했습니다.");
				window.close();
			}
		});
	});
</script>
</head>
<body>
<h3>test</h3>
<form id="cartInsert">
<input type="hidden" id="deleteyn" value="Y">
<input type="button" id="cartBtn">찜하기
</form>

</body>
</html>