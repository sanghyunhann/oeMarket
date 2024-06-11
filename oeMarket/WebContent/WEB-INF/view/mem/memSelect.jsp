<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="org.apache.log4j.LogManager" %>  
<%@ page import="org.apache.log4j.Logger" %>    
    
<%@ page import="oe.market.mem.vo.OeMemVO" %> 
<%@ page import="oe.market.common.CodeUtil" %>    
<%@ page import="java.util.List" %>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Logger logger = LogManager.getLogger(this.getClass());
	logger.info("memSelect.jsp >>> : ");
%>
<%
	Object obj = request.getAttribute("listS");
	if (obj == null) return;
	List<OeMemVO> list = (List<OeMemVO>)obj;	
	int nCnt = list.size();
	OeMemVO ovo = (OeMemVO)list.get(0);
	
	String opw = "";
	String ohp = "";
	String ohp0 = "";
	String ohp1 = "";
	String ohp2 = "";
	String oemail = "";	
	String oemails[] = null;
	String ogender="";
	String onum="";
	String ohp3 = "";
	
	OeMemVO _ovo = null;
	_ovo = list.get(0);
	ohp = _ovo.getOhp();

    ohp1 = ohp.substring(0, 3);
    ohp2 = ohp.substring(3, 7);
    ohp3 = ohp.substring(7);
    System.out.println("ohp : " + ohp);
	   
	onum = _ovo.getOnum();
	System.out.println("onum : " + onum);
	oemail = _ovo.getOemail();
	oemails = oemail.split("@");
	ogender = _ovo.getOgender();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script  src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	let pwck = false;
	
	$("#opw").on('change',function(){
		let pVal = $("#opw").val();
		let pBool = pwValidation(pVal);
		
	});
	
	
	$("#pwCheck").click(function(){
					
		console.log("pwcheck");
		var pw = $("#opw").val();
		var pw_r = $("#opw_r").val();
		
		if(pw == null || pw==""){
			alert("비밀번호를 입력해 주세요");
			$("#opw").focus;
		}
		if(pw_r == null || pw_r==''){
			alert("비밀번호 확인란을 입력해 주세요");
			$("#opw_r").focus;
		}
		
		if(pw == pw_r){
			alert("비밀번호가 같습니다");
			pwck = true;
			return true;
		}else{
			alert("비밀번호가 다릅니다");
			$("#opw").val('');
			$("#opw_r").val('');
			$("#opw").focus();
			pwck = false;
			return false;
		}
	});
	
	$("#oemail2").change(function(){
		$("#oemail2 option:selected").each(function(){
			if($(this).val()=='1'){
				var aa = $("#oemail1").val();
				$("#oemail").val('');
				$("#oemail").attr("readonly",false);
				
			}else{
				$("#oemail1").val($(this).text());
				$("#oemail1").attr("readonly",true);
			}
		});
	});
	
	$("#ozonecode").prop('readonly',true);
	$("#oroad").prop('readonly',true);
	$("#ogibun").prop('readonly',true);
	$("#zonecode").click(function(){
		console.log("zonecode : ");
		new daum.Postcode({
			oncomplete:function(data){
				$("#ozonecode").val(data.zonecode);
				$("#oroad").val(data.roadAddress);
				$("#ojibun").val(data.jibunAddress);
			}
		}).open();
	});
	
	var ogender = "<%= ogender %>";
	console.log(ogender);
	if (ogender == 'F') {
	    $("#ogender_f").prop("checked", true);
	} else if(ogender == 'M') {
	    $("#ogender_m").prop("checked", true);
	}
	
	$("#btn").on("click",function(){
		if(!pwck) {
			alert("비밀번호 확인을 완료해 주세요.");
			event.preventDafault(); // 폼 제출을 막음
			return;		
		}
		$("#memUpdate").attr({
			'action':'memUpdate.oe',
			'method':'GET'
		}).submit();
	})
});
</script>
<style>
.form-control[readonly] {
  background-color: #fff; /* 흰색 배경색 */
  cursor: not-allowed; /* 포인터 모양 변경 */
}

.input-group-text{
	background-color: #fff; /* 흰색 배경색 */
	border: none;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/view/header.jsp" />
<div class="container">
		<h3 class="text-center my-4">내정보</h3>
		<hr>
		<form name="memUpdate" id="memUpdate">
		  <div class="form-group">
			<label>이름</label>
			<input type="text" class="form-control" id="oname" name="oname" value="<%= _ovo.getOname() %>" maxlength="10" readonly>
		  </div>
		  <div class="form-group">
			<label>아이디</label>
			<div class="input-group">
			  <input type="text" class="form-control" id="oid" name="oid" value="<%= _ovo.getOid() %>" maxlength="10" readonly>
			</div>
		  </div>
		  <div class="form-group">
			<label>비밀번호</label>		
			  <input type="password" class="form-control" id="opw" name="opw" value="<%= _ovo.getOpw() %>" maxlength="16" required>
			  <div class="input-group">
			  <input type="password" class="form-control" id="opw_r" name="opw_r" placeholder="비밀번호 확인" maxlength="16" required>
			  <div class="input-group-append">
				<button type="button" class="btn btn-outline-primary" id="pwCheck">확인</button>
			  </div>
			</div>
			<div class="invalid-feedback" id="pwFeedback" style="display:none;">
			  비밀번호가 일치하지 않습니다.
			</div>
		  </div>
		  <div class="form-group">
			<label>성별</label>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="ogender" id="ogender_f" value="F">
			  <label class="form-check-label" for="ogender_f">여자</label>
			</div>
			<div class="form-check form-check-inline">
			  <input class="form-check-input" type="radio" name="ogender" id="ogender_m" value="M">
			  <label class="form-check-label" for="ogender_m">남자</label>
			</div>
		  </div>
		   <div class="form-group">
			<label for="ohp">핸드폰</label>
			<div class="input-group">
			  <input type="text" class="form-control" id="ohp" name="ohp" value="010" size="2" readonly>
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" name="ohp1" id="ohp1"value="<%= ohp2 %>" size="2">
			  <span class="input-group-text">-</span>
			  <input type="text" class="form-control" name="ohp2" id="ohp2"value="<%= ohp3 %>" size="2" >
			</div>
		  </div>
		  <div class="form-group">
			<label for="oemail">이메일</label>
			<div class="input-group">
			  <input type="text" class="form-control" name="oemail" id="oemail" value="<%= oemails[0] %>">
			  <span class="input-group-text">@</span>
			  <input type="text" class="form-control" name="oemail1" id="oemail1" value="<%= oemails[1] %>">
			  <div class="input-group-append">
				<select class="form-control" name="oemail2" id="oemail2">
				  <option value="1" selected>직접 입력</option>
				  <option value="naver.com">naver.com</option>
				  <option value="gmail.com">gmail.com</option>
				  <option value="daum.net">daum.net</option>
				</select>
			  </div>
			</div>
		  </div>
		  <div class="form-group">
			<label for="ozonecode">주소</label>
			<div class="input-group">
			  <input type="text" class="form-control" name="ozonecode" id="ozonecode" value="<%= _ovo.getOzonecode() %>" style="width:100px">
			  <div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button" id="zonecode">찾기</button>
			  </div>
			</div>
			<input type="text" class="form-control mt-2" name="oroad" id="oroad" value="<%= _ovo.getOroad() %>">
			<input type="text" class="form-control mt-2" name="oroaddetail" id="oroaddetail" value="<%= _ovo.getOroaddetail() %>">
			<input type="text" class="form-control mt-2" name="ojibun" id="ojibun" value="<%= _ovo.getOjibun() %>">
		  </div>
		  <div class="text-right">
		  	<input type="hidden" name="onum" value="<%=onum%>">
			<button type="button" class="btn btn-primary" id="btn">수정</button>
		  </div>
		</form>
	  </div>
	<jsp:include page="/WEB-INF/view/footer.jsp" />  
</body>
</html>