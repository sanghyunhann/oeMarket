<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="oe.market.mem.vo.OeMemVO"%>  
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0
     	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
    $('#loginBtn').click(function(){
        $.ajax({
            url: 'loginCheck.oe', // 로그인 체크 URL
            type: 'POST',
            data: {
                oid: $('#oid').val(),
                opw: $('#opw').val()
            },
            success: function(response) {
                if (response == 'success') {
                    if (window.opener) {
                        window.opener.updateLoginStatus($('#oid').val());
                        window.close();
                    } else {
                        alert("로그인 성공");
                        history.back();
                        location.reload();
                    }
                } else {
                    var confirmMessage = "등록된 아이디가 없습니다. 회원가입 페이지로 이동하시겠습니까?";
                    if (confirm(confirmMessage)) {
                        if (window.opener) {
                            window.opener.location.href = "memForm.oe"; // 회원가입 페이지로 이동
                            window.close();
                        } else {
                            window.location.href = "memForm.oe"; // 회원가입 페이지로 이동
                        }
                    } else {
                        console.log("사용자가 회원가입을 취소했습니다.");
                        window.close();
                    }
                }
            }
        });
    });
});

</script>
<style>
   header{
        display:flex;
        justify-content: center;
    }
    form{
        padding:10px;
    }
    .input-box{
        position:relative;
        margin:10px 0;
    }
    .input-box > input{
        background:transparent;
        border:none;
        border-bottom: solid 1px #ccc;
        padding:20px 0px 5px 0px;
        font-size:14pt;
        width:100%;
    }
    input::placeholder{
        color:transparent;
    }
    input:placeholder-shown + label{
        color:#aaa;
        font-size:14pt;
        top:15px;

    }
    input:focus + label, label{
        color:#8aa1a1;
        font-size:10pt;
        pointer-events: none;
        position: absolute;
        left:0px;
        top:0px;
        transition: all 0.2s ease ;
        -webkit-transition: all 0.2s ease;
        -moz-transition: all 0.2s ease;
        -o-transition: all 0.2s ease;
    }

    input:focus, input:not(:placeholder-shown){
        border-bottom: solid 1px #8aa1a1;
        outline:none;
    }
    input[type=button]{
        background-color: #8aa1a1;
        border:none;
        color:white;
        border-radius: 5px;
        width:100%;
        height:35px;
        font-size: 14pt;
        margin-top:100px;
    }
    #forgot{
        text-align: right;
        font-size:12pt;
        color:rgb(164, 164, 164);
        margin:10px 0px;
    }
</style>
</head>
<body>
<header>
     <h2>Login</h2>
     </header>

     <form name="loginForm" id="loginForm">
       <div class="input-box">
             <input id="oid" type="text" name="oid" placeholder="아이디">
             <label for="oid">아이디</label>
         </div>
         <div class="input-box">
             <input id="opw" type="password" name="opw" placeholder="비밀번호">
             <label for="opw">비밀번호</label>
         </div>
         <input type="button" id="loginBtn" name="loginBtn" value="로그인">
     </form>

</body>
</html>
