<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<form name="f" method="post" role="form" enctype="multipart/form-data">
	<div class="info">
		<table class="eTblView" >
			<thead>
				<tr>
					<th colspan="2" class="tdCenter">일대일문의 글 수정하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tdCenter">글번호</td>
					<td>${obo.o_num }</td>
				</tr>
				<tr>
					<td class="tdCenter">제목</td>
					<td><input type="text" name="o_title" class="regInput" value='${obo.o_title }' class="obo_"></td>
				</tr>
				<tr>
					<td class="tdCenter">카테고리</td>
					<td>
						<select name="o_cat" class="regInput" >
							<!-- if 처리해서 fq_cat 뺀 거만 뜨게 
							 = '기타'면 기타 안 뜨게 . (비동기 안하고 할 수 있는 방식. 아닐지도 모름. 일단 레쓰고.)
							-->								
							
							<option value="">선택해주세요~</option>
						     <c:forEach var="list" items="${catList}">
						     <c:choose>
						     	<c:when test="${list eq obo.o_cat }">
							     	<option value="${list}" selected="selected">${list}</option>
							     	<option value="${list}" selected="selected">${list}</option>
							     </c:when>
							     <c:otherwise>
							     	<option value="${list}">${list}</option>
							     </c:otherwise>
						     </c:choose>
						    </c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="tdCenter">내용</td>
					<td>
						<textarea rows="10" cols="100" class="regInput"  name="o_content" class="obo_">${obo.o_content }</textarea>
					</td>
				</tr>
				<tr >
					<td class="tdCenter">파일</td>
					<td id="reloadLayer">
						
						<h4>기존 업로드 파일 보기</h4><br>
						<c:if test="${ not empty obo.o_file }">
						    <span class="hh">${ obo.o_file}</span> <br>
							<a href="/obo/modify?o_num=${obo.o_num }&o_file=${obo.o_file }" class="hh"> <br>
							<img src="/img/${obo.o_file }" name="${obo.o_file }" style="max-width: 800px; max-height: 500px;"></a>
							<br>
							<input type="hidden" id="o_file" name="o_file" value='<c:out value="${obo.o_file }"/>' />
							<input type="button" id="deleteFileBtn" class="deleteFileBtn" value="파일 삭제">
						</c:if>
						
						<c:choose>
							<c:when test="${ empty obo.o_file }">
								업로드한 파일이 없습니다.
							</c:when>
						</c:choose>
						<br><br>
						<!-- <input type="file" name="uploadFile" multiple="multiple" style="float: left;"> -->
						
						<h4>이미지 미리보기</h4><br>
						<img id="preview" style="max-width: 300px; max-height: 400px;">
						<br><br>
						<label class="inputFileBtn" for="inputFile">업로드</label>
						<input type="file" name="uploadFile" multiple="multiple" id="inputFile" onchange="readURL(this);" style="display: none;"/>
						
						
						<input type="button" id="deleteUploadingFile" class="deleteFileBtn" value="파일 삭제">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" class="tdCenter">
						<button	id="modifyBtn"  class="searchBtn">글 수정</button>
						<input type="hidden" id="o_num" name="o_num" value='<c:out value="${obo.o_num }"/>' />
						<%-- <input type="hidden" id="o_file" name="o_file" value='<c:out value="${obo.o_file }"/>' /> --%>
            			<input type="hidden" name="nowPage" value="${pageMaker.nowPage }"> 
						<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
						<input type="hidden" name="cntPerPage" value="${pageMaker.cntPerPage}">
						
					</td>
				</tr>
			</tfoot>
		</table>
		</div>
	</form>
	
	
</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<script type="text/javascript" src="/resources/js/E_obo.js"></script>
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
	
	var formObj = $("form");
	$(function() {
		
		var o_num =  $(".info").find("input[name='o_num']");
		var o_title =  $(".info").find("input[name='o_title']");
		var o_content =  $(".info").find("textarea[name='o_content']");
		var o_cat =  $(".info").find("select[name='o_cat']");
		var o_file =  $(".info").find("input[name='o_file']");
		var uploadFile =  $(".info").find("input[name='uploadFile']");

		console.log("o_num : " + o_num.val());
		console.log("o_title : " + o_title.val());
		console.log("o_content : " + o_content.val());
		console.log("o_cat : " + o_cat.val());
		console.log("o_file : " + o_file.val());
		console.log("uploadFile : " + uploadFile.val());		
		
		var formObj = $("form");
		
		$("#deleteFileBtn").on("click", function(e) {
			console.log("삭제 전) o_file 값? >> " + o_file.val());
			o_file.val("");
			
			console.log("삭제 후) o_file 값? >> " + o_file.val());
			
			$(".hh").hide();
	
		}); // end : deleteUploadedFile 이벤트 종료
		
		$("#deleteUploadingFile").on("click", function(e) {
			console.log("uploadFile 값? >> " + uploadFile.val());
			uploadFile.val("");
			
			console.log("uploadFile 값? >> " + uploadFile.val());
			location.reload();
		}); // end : deleteUploadingFile 이벤트 종료
		
		/* $("#removeImgBtn").on("click", function(e) {
			e.preventDefault();
			
			
			console.log("버튼 누르면 이거 타는지?");
			var o_numValue = '<c:out value="${obo.o_num }"/>';

			oboService.removeImg(o_numValue,function(result) {
				console.log("버튼 누르면 이거 타는지?222");
				console.log("result 값 ? >> " + result);
				
				$('#reloadLayer').load(location.href +' #reloadLayer');
				
			}); 	
		}); // end : removeImgBtn 이벤트 종료
		*/
		
		$("#modifyBtn").on("click", function(e) {
			
			e.preventDefault();

			console.log("o_file 값 있나연 ? >> " + o_file.val());
			
			formObj.attr("action", "/obo/modify"); //리스트로 보냄

			var nowPageTag = $("input[name='nowPage']").clone();
			var cntPageTag = $("input[name='cntPage']").clone();
			
			formObj.submit();

		}); // end : modifyBtn 이벤트 종료
		
		
	});

</script>


<jsp:include page="/WEB-INF/views/include/footer.jsp"/>