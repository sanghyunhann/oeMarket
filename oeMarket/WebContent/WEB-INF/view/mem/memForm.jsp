<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
    $(document).ready(function() {
        var idck = false;
        var pwck = false;

        $(document).on("click", "#oidbtn", function() {
            alert("oidbtn");

            let idCheckURL = "oeIdCheck.oe";
            let reqType = "GET";
            let dataParam = { oid: $("#oid").val() };

            if ($("#oid").val() == null) {
                alert("중복 확인 할 아이디를 입력해 주세요");
                $("#oid").focus();
            }

            $.ajax({
                url: idCheckURL,
                type: reqType,
                data: dataParam,
                success: whenSuccess,
                error: whenError
            });

            function whenSuccess(resData) {
                alert("resData : " + resData);
                if ("ID_YES" == resData) {
                    alert("아이디 사용 가능");
                    idck = true;
                } else if ("ID_NO" == resData) {
                    alert("이미 사용중인 아이디 이거나, 사용이 불가능한 아이디 입니다");
                    $("#oid").val('');
                    $("#oid").focus();
                    idck = false;
                }
            }

            function whenError(e) {
                alert("e : " + e.responseText);
            }
        });

        $("#opw").on('change', function() {
            let pVal = $("#opw").val();
            let pBool = pwValidation(pVal);

        });

        $("#pwCheck").click(function() {

            console.log("pwcheck");
            var pw = $("#opw").val();
            var pw_r = $("#opw_r").val();

            if (pw == null || pw == "") {
                alert("비밀번호를 입력해 주세요");
                $("#opw").focus;
            }
            if (pw_r == null || pw_r == '') {
                alert("비밀번호 확인란을 입력해 주세요");
                $("#opw_r").focus;
            }

            if (pw == pw_r) {
                alert("비밀번호가 같습니다");
                pwck = true;
                return true;
            } else {
                alert("비밀번호가 다릅니다");
                $("#opw").val('');
                $("#opw_r").val('');
                $("#opw").focus();
                pwck = false;
                return false;
            }
        });

        $("#oemail2").change(function() {
            $("#oemail2 option:selected").each(function() {
                if ($(this).val() == '1') {
                    var aa = $("#oemail1").val();
                    $("#oemail").val('');
                    $("#oemail").attr("readonly", false);

                } else {
                    $("#oemail1").val($(this).text());
                    $("#oemail1").attr("readonly", true);
                }
            });
        });

        $("#ozonecode").prop('readonly', true);
        $("#oroad").prop('readonly', true);
        $("#ogibun").prop('readonly', true);
        $("#zonecode").click(function() {
            console.log("zonecode : ");
            new daum.Postcode({
                oncomplete: function(data) {
                    $("#ozonecode").val(data.zonecode);
                    $("#oroad").val(data.roadAddress);
                    $("#ojibun").val(data.jibunAddress);
                }
            }).open();
        });

        $(document).on("click", "#btn", function() {
            alert("btn");
            if (idck != true) {
                alert("아이디 중복확인을 해주세요");
            } else if (pwck == false) {
                alert("비밀번호 확인을 해주세요")
            } else {
                $("#memForm").attr({
                    'action': 'memInsert.oe',
                    'method': 'POST'
                    //'enctype':'multipart/form-data' ?key=value&key=value
                }).submit();
            }
        });
    });
</script>
<style>
    .form-control[readonly] {
        background-color: #fff; /* 흰색 배경색 */
        cursor: not-allowed; /* 포인터 모양 변경 */
    }

    .input-group-text {
        background-color: #fff; /* 흰색 배경색 */
        border: none;
    }
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/view/header.jsp" />
    <div class="container">
        <h3 class="text-center my-4">회원가입</h3>
        <form name="memForm" id="memForm">
            <div class="form-group">
                <label>이름</label>
                <input type="text" class="form-control" id="oname" name="oname" placeholder="이름을 입력하세요" maxlength="10" required>
            </div>
            <div class="form-group">
                <label>아이디</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="oid" name="oid" placeholder="아이디를 입력하세요" maxlength="10" required>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="oidbtn" name="oidbtn">중복 확인</button>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>비밀번호</label>
                <input type="password" class="form-control" id="opw" name="opw" placeholder="비밀번호 (8자 이상, 영문/숫자/특수문자 포함)" maxlength="16" required>
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
                    <input class="form-check-input" type="radio" name="ogender" id="ogender_f" value="F" checked>
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
                    <input type="text" class="form-control" name="ohp1" id="ohp1" size="2" required>
                    <span class="input-group-text">-</span>
                    <input type="text" class="form-control" name="ohp2" id="ohp2" size="2" required>
                </div>
            </div>
            <div class="form-group">
                <label for="oemail">이메일</label>
                <div class="input-group">
                    <input type="text" class="form-control" name="oemail" id="oemail" required>
                    <span class="input-group-text">@</span>
                    <input type="text" class="form-control" name="oemail1" id="oemail1" placeholder="직접 입력" required>
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
                    <input type="text" class="form-control" name="ozonecode" id="ozonecode" placeholder="우편번호" style="width:100px" required>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" id="zonecode">찾기</button>
                    </div>
                </div>
                <input type="text" class="form-control mt-2" name="oroad" id="oroad" placeholder="도로명주소" required>
                <input type="text" class="form-control mt-2" name="oroaddetail" id="oroaddetail" placeholder="도로명주소 상세주소" required>
                <input type="text" class="form-control mt-2" name="ojibun" id="ojibun" placeholder="지번주소" required>
            </div>
            <div class="text-right">
                <button type="button" class="btn btn-primary" id="btn">회원가입</button>
                <button type="reset" class="btn btn-secondary">다시 작성</button>
            </div>
        </form>
    </div>
    <jsp:include page="/WEB-INF/view/footer.jsp" />
</body>
</html>
