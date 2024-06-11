<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="oe.market.board.vo.OeBoardVO"%>
<%@ page import="oe.market.comm.vo.OeCommVO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.log4j.LogManager"%>
<%@ page import="org.apache.log4j.Logger"%>

<%
    request.setCharacterEncoding("UTF-8");
    Logger loggerr = LogManager.getLogger(this.getClass());
    loggerr.info("commForm.jsp 페이지 >>> : ");
    OeBoardVO obvo = (OeBoardVO) request.getAttribute("obvo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commForm.jsp</title>
    <style>
        body {
            font-family: "Black Han Sans", sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        h3 {
            text-align: center;
            color: #333;
        }
        #comment-section {
            max-width: 1200px;
            width:800px;
            margin: 10px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
        }
        #comment-form table {
            width: 100%;
        }
        #comment-form td {
            padding: 10px 0;
        }
        #comment-form input[type="text"],
        #comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        #comment-form textarea {
            resize: none;
        }
        #comment-form input[type="button"] {
            padding: 10px 20px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #comment-form input[type="button"]:hover {
            background: #0056b3;
        }
        #comment-list {
            list-style-type: none;
            padding: 0;
        }
        #comment-list li {
            background: #f1f1f1;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            position: relative;
        }
        .comment-author {
            font-weight: bold;
        }
        .comment-content {
            margin: 5px 0;
        }
        .bytes {
            font-size: 0.9em;
            color: #999;
        }
        .delete-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #dc3545;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .delete-btn:hover {
            background: #c82333;
        }
    </style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        //ccontent 길이 제한 200byte
        $("#ccontent").keyup(function() {
            cut_200(this);
        });

        // 댓글 전체 불러오기 
        selectAll();

        // 댓글 등록
        $(document).on("click", "#insertBtn", function() {
            console.log("insertBtn >>> : ");

            let insertURL = "oeCommInsert.oe";
            let method = "POST";
            let dataParam = {
                bnum : $("#bnum").val(),
                oid : $("#oid").val(),
                bcontent : $("#ccontent").val(),
            };
            dataParam = $("#commForm").serialize();
            console.log("dataParam >>> : " + dataParam);

            $.ajax({
                url : insertURL,
                type : method,
                data : dataParam,
                success : whenSuccess,
                error : whenError
            });

            function whenSuccess(resData) {
                alert("resData >>> : " + resData);
                if ("GOOD" == resData) {
                    // 입력데이터 초기화 함수호출
                    commFormData();
                    location.reload();
                    selectAll();
                }
            }
            function whenError(e) {
                alert("e >>> : " + e.responseText);
            }

            // selectAll();
        });

     // 댓글 삭제		
        $(document).on("click", ".deleteBtn", function() {
            console.log("D >>> : ");

            var cnumV = $(this).parents("li").attr("dataNum");
            alert("cnumV >>> : " + cnumV);
            var target = $(this).parents(".rbmemoItem");
            console.log("target >>> : " + target);

            let deleteURL = "oeCommDelete.oe";
            let method = "POST";
            let dataParam = {
                ckbnum : $('#cnum').val(cnumV),
            };
            dataParam = $("#commForm").serialize();
            console.log("dataParam >>> : " + dataParam);

            $.ajax({
                url : deleteURL,
                type : method,
                data : dataParam,
                success : whenSuccess,
                error : whenError
            });

            function whenSuccess(resData) {
                console.log("resData >>> : " + resData);
                if ("GOOD" == resData) {
                    alert("댓글이 삭제되었습니다.");
                    target.remove();
                } else if ("NOT_ALLOWED" == resData) {
                    alert("댓글을 삭제할 권한이 없습니다.");
                }
            }
            function whenError(e) {
                console.log("e >>> : " + e.responseText);
            }
        });
	});

    // 게시글 번호로 댓글 전체조회 ============================================
    function selectAll() {

        console.log("SALL >>> : ");

        let selectAllURL = "oeCommSelectAll.oe";
        let method = "POST";
        let dataParam = {
            bnum : $("#bnum").val(),
        };
        dataParam = $("#commForm").serialize();
        console.log("dataParam >>> : " + dataParam);

        $.ajax({
            url : selectAllURL,
            type : method,
            data : dataParam,
            success : whenSuccess,
            error : whenError
        });

        function whenSuccess(resData) {
            console.log("resData >>> : " + resData);
            console.log("whenSuccess oeCommSelectAll resData >>> : " + resData);

            if (isEmpty(resData)) {
                return false;
            }

            let v = resData.split("&");
            for (let i = 0; i < v.length; i++) {
                console.log(v[i]);
                let vv = v[i].split(",");
                let j = 0
                for (; j < vv.length - 1; j++) {
                    console.log("vv[0] >>> : " + vv[0]);
                    console.log("vv[1] >>> : " + vv[1]);
                    console.log("vv[2] >>> : " + vv[2]);
                    console.log("vv[3] >>> : " + vv[3]);
                }
                addNewItem(vv[0], decodeURIComponent(vv[1]), decodeURIComponent(vv[2]), vv[3]);
            }
        }
        function whenError(e) {
            console.log("e >>> : " + e.responseText);
        }
    }

    // 게시글 번호로 댓글 전체조회 ============================================

    //새로운 글 화면에 추가	=================================================
    function addNewItem(num, writer, content, datetime) {

        //데이터 체크
        if (isEmpty(num))
            return false;

        // 새로운 글이 추가될 li태그
        var newLi = $("<li>");
        newLi.attr("dataNum", num);
        newLi.addClass("rbmemoItem");
        // 작성자 정보가 지정될 <p> 태그
        var writerP = $("<p>");
        writerP.addClass("writer");
        // 작성자 정보의 이름
        var nameSpan = $("<span>");
        nameSpan.addClass("name");
        nameSpan.html(decodeURIComponent(writer) + "님");
        // 작성일시
        var dateSpan = $("<span>");
        dateSpan.html(" / " + datetime + " ");
        // 삭제 버튼
        var delInput = $("<input>");
        delInput.attr({
            "type" : "button",
            "value" : "삭제하기"
        });
        delInput.addClass("deleteBtn");
        // 내용
        var contentP = $("<p>");
        contentP.html(decodeURIComponent(content));

        // 조립하기
        writerP.append(nameSpan).append(dateSpan).append(delInput);
        newLi.append(writerP).append(contentP);
        $("#comment-list").append(newLi);
    }

    // 새로운 글 화면에 추가	=================================================

    // 댓글 길이 체크  ========================================================
    //한글 포함 문자열 길이
    function getTextLength(s) {
        var len = 0;
        for (var i = 0; i < s.length; i++) {
            if (escape(s.charAt(i)).length == 6) {
                len++;
            }
            len++;
        }
        return len;
    }
    function cut_200(obj) {
        var t = $(obj).val();
        var l = t.length;
        while (getTextLength(t) > 200) {
            l--;
            t = t.substring(0, l);
        }
        $(obj).val(t);
        $('.bytes').text(getTextLength(t));
    }
    // 댓글 길이 체크  ========================================================

    //댓글 등록 후 입력창 초기화
    function commFormData() {
        $("#oid").val("");
        $("#ccontent").val("");
    }

    //데이터 체크
    function isEmpty(val) {
        if (typeof val == "undefined" || val == null || val == "") {
            return true;
        } else {
            return false;
        }
    }
</script>
</head>
<body>

    <div id="comment-section">
        <h3>댓글</h3>
        <hr>
        <%
            Logger logger = LogManager.getLogger(this.getClass());
            logger.info("commForm.jsp 페이지 >>> : ");
            String bnum = request.getParameter("bnum");

            // bnum = "B0004";
            logger.info("commForm.jsp bnum >>> : " + bnum);
        %>

        <div id="cwriterdiv">
            <form name="commForm" id="commForm">

                <ul name="commlist" id="comment-list">
                    <!-- 여기에 동적 생성 요소가 들어온다. -->
                </ul>
                <hr>
                <table id="comment-form">
                	<tr>
                		<td colspan="2" style='text-align:center'>
                		로그인 이후 댓글을 작성하세요! 
                		</td>
                	</tr>
                    <tr>
                        <td>덧글 내용</td>
                        <td>
                         	<input type="hidden" name="oid" id="oid" value="<%= obvo.getOid() %>" readonly>
                            <input type="hidden" name="bnum" id="bnum" value="<%=bnum%>">
                            <input type="hidden" name="cnum" id="cnum">
                            <textarea name="ccontent" id="ccontent" rows="5" cols="50"></textarea>
                            <div>
                                <span class="bytes">0</span>bytes
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-right">
                            <input type="button" value="저장하기" id="insertBtn">
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
</body>
</html>
