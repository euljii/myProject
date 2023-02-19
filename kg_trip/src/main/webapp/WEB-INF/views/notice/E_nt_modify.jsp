<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="info" >
		<form action="/notice/ntModify" method="post" role="form" enctype="multipart/form-data">
			<table class="eTblView">
				<thead>
					<tr>
						<th colspan="2" class="tdCenter">공지사항 글 수정하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>글번호</td>
						<td>${notice.n_num }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="n_title" class="regInput" value='<c:out value="${notice.n_title }"></c:out>'></td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="100" class="regInput" name="n_content" >${notice.n_content }</textarea>
						
						</td>
					</tr>
					<tr >
						<td>파일</td>
						<td id="reloadLayer">
						
							<h4>기존 업로드 파일 보기</h4><br>
							<c:if test="${ not empty notice.n_file && notice.n_file ne ',' }">
							    <span class="hh">${ notice.n_file}</span> <br>
								<a href="/notice/ntModify?n_num=${notice.n_num }&n_file=${notice.n_file }" class="hh"> <br>
								<img src="/img/${notice.n_file }" name="${notice.n_file }" style="max-width: 800px; max-height: 500px;"></a>
								<br>
								<input type="hidden" id="n_file" name="n_file" value='<c:out value="${notice.n_file }"/>' />
								<input type="button" id="deleteFileBtn" class="deleteFileBtn" value="파일 삭제">
							</c:if>
							
							<c:choose>
								<c:when test="${ empty notice.n_file || notice.n_file eq ','  }">
									업로드한 파일이 없습니다.
								</c:when>
							</c:choose>
							<br><br>
							
							<h4>이미지 미리보기</h4><br>
							<img id="preview" style="max-width: 300px; max-height: 400px;">
							<br><br>
							<label class="inputFileBtn" for="inputFile">업로드</label>
							<input type="file" name="uploadFile" id="inputFile" onchange="readURL(this);" style="display: none;"/>
							
							<input type="button" id="deleteUploadingFile" class="deleteFileBtn" value="파일 삭제">
						
					</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" class="tdCenter">
							<button	id="modifyBtn"  class="searchBtn">글 수정</button>
							<input type="reset" value="새로쓰기" class="searchBtn">
							<input type="button" value="목록" class="searchBtn">
							
							<input type="hidden" id="n_num" name="n_num" value='<c:out value="${notice.n_num }"/>' />
       						<input type="hidden" id="n_file" name="n_file" value='<c:out value="${notice.n_file }"/>' />
             						
           						<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
							<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
							<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>

</section>
<script type="text/javascript">
	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
	

	$(function() {
		
		var n_num =  $(".info").find("input[name='n_num']");
		var n_title =  $(".info").find("input[name='n_title']");
		var n_content =  $(".info").find("textarea[name='n_content']");
		var n_cat =  $(".info").find("select[name='n_cat']");
		var n_file =  $(".info").find("input[name='n_file']");
		var uploadFile =  $(".info").find("input[name='uploadFile']");

		console.log("n_num : " + n_num.val());
		console.log("n_title : " + n_title.val());
		console.log("n_content : " + n_content.val());
		console.log("n_cat : " + n_cat.val());
		console.log("n_file : " + n_file.val());
		console.log("uploadFile : " + uploadFile.val());		

		var formObj = $("form");
		
		
		$("#deleteFileBtn").on("click", function(e) {
			console.log("삭제 전) n_file 값? >> " + n_file.val());
			n_file.val("");
			
			console.log("삭제 후) n_file 값? >> " + n_file.val());
			
			$(".hh").hide();
	
		}); // end : deleteUploadedFile 이벤트 종료
		
		$("#deleteUploadingFile").on("click", function(e) {
			uploadFile.val("");
			
			console.log("uploadFile 값? >> " + uploadFile.val());
			location.reload();
		}); // end : deleteUploadingFile 이벤트 종료
		
		$("modifyBtn").on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			if (operation == 'modify') {
				formObj.attr("action", "/notice/ntModify"); //리스트로 보냄

				var nowPageTag = $("input[name='nowPage']").clone();
				var cntPageTag = $("input[name='cntPage']").clone();

			} else if (operation == 'list') {
				formObj.attr("action", "/notice/ntList"); //리스트로 보냄
				formObj.attr("method", "get"); 			//메소드를 get방식으로 변경

				var nowPageTag = $("input[name='nowPage']").clone();
				var cntPageTag = $("input[name='cntPage']").clone();

				formObj.empty(); //form 안에있는 모든 데이터들을 다 날려버림

				formObj.append(nowPageTag);
				formObj.append(cntPageTag);

				formObj.submit();
			}
			
		});
	});

</script>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
