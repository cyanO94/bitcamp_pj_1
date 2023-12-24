<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">

$(document).ready(function () {
	
    $("#saveBtn").click(function () {
        // 버튼 클릭 시 실행되는 함수

        // 폼 데이터 가져오기
        var formData = {
            comBoardCommentSeq: $("input[name='comBoardCommentSeq']").val(),
            comBoardCommentName: $("input[name='comBoardCommentName']").val(),
            comBoardCommentMsg: $("input[name='comBoardCommentMsg']").val()
        };

		$.ajax({
			type:"post",
			url:"./answerList",
			data:formData,

			success:function(res){
				let datas=res.data;
				let s="";
				$.each(datas,function(idx,item){
					s+=
						`
						\${item.comBoardCommentName}
						<span style="margin-left:20px;">\${item.comBoardCommentMsg}</span>
						&nbsp;
						`;
					s+="<br>";
					s+="<hr>";
				});

				$(".answerlist").html(s);
			}
		});
    });
});
</script>


<body>
	<div class="mw_1000">
		<div class="fw_500 cBlack mt-5">
			<a href="${pageContext.request.contextPath}">HOME</a><span
				class="fs_18 mx-1">></span> <a
				href="${pageContext.request.contextPath}/board/list">자취생 커뮤니티</a><span
				class="fs_18 mx-1">></span> <a
				href="${pageContext.request.contextPath}/board/content">상세 페이지</a>
		</div>
		<div class="mt-4 content-border">
			<div class="fs_30 mt-2 fw_600 px-2">${dto.comBoardSubject}</div>
			<div class="row px-2 mt-2">
				<div class="col">
					<span><i class="bi bi-person-fill fs_17 mr-2"></i><b>${dto.userName}</b></span>&nbsp;
					<span><i class="bi bi-three-dots-vertical"></i></span>&nbsp; <span
						class="day"><i class="bi bi-eye-fill fs_17 mr-2"></i><b>${dto.comBoardviewCount}</b></span>

					<button type="button"
						class="btn-3d red2 ml-3 fw_500"
						onclick="location.href='./updateform?comBoardSeq=${dto.comBoardSeq}'">수정</button>

					<button type="button"
						class="btn-3d red2 ml-1 fw_500"
						onclick="location.href='./delete?comBoardSeq=${dto.comBoardSeq}'">삭제</button>
				</div>
				<div class="col text-right">
					<fmt:formatDate value="${dto.writeDay}" pattern="yyyy-MM-dd HH:mm" />
				</div>
			</div>

			<div class="content-border mt-3 py-2">
				<pre style="min-height: 300px;" class="fs_16 px-2">${dto.comBoardContent}</pre>
				<div class="content-border py-2">
					<i class="bi bi-chat-dots ml-3 "></i> &nbsp;${dto.acount}
				</div>
				<c:forEach var="adto" items="${datas}">
					<span>${adto.nickname} : ${adto.content}</span>
					<span style="margin-left: 20px; color: gray; font-size: 0.9em;">
						<fmt:formatDate value="${adto.awriteday}"
							pattern="yyyy-MM-dd HH:mm" />
					</span>

					<br>
				</c:forEach>
				<div style="padding-bottom: 15px; border-bottom: 1px solid #c5c5c5;">
					<div class="answerlist" style="margin-left: 10px;">댓글</div>
					<div class="form-table">
						<input type="hidden" name=comBoardCommentSeq
							value="${dto.comBoardSeq}">
						<div class="input-group content_comment px-2">
							<input type="text" name="comBoardCommentName" class="input1 bg_red inset_shadow2"
								placeholder="닉네임"> <input type="text"
								name="comBoardCommentMsg" class="col input2 bg_red inset_shadow2" placeholder="댓글">

							<button type="button" id="saveBtn"
								class="btn-3d red px-3 ml-2">저장</button>
						</div>
					</div>


					
					</div>
					<div class="text-center mt-4">
						<button type="button" class="btn-3d red fw_600"
							onclick="location.href='./list'">목록으로</button>
					</div>
				</div>
			</div>
		</div>
</body>