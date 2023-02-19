<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<form action="/freq/modify" name="f" method="post" role="form"
		enctype="multipart/form-data">
	<div class="info">
		<table class="registerTbl">
			<thead>
				<tr>
					<th colspan="2" class="tdCenter">자주찾는질문 글 수정하기</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="tdCenter">글번호</td>
					<td>${freq.fq_num }</td>
				</tr>
				<tr>
					<td class="tdCenter">제목</td>
					<td><input type="text" name="fq_title" class="regInput"
						value='${freq.fq_title }'></td>
				</tr>
				<tr>
					<td class="tdCenter">카테고리</td>
					<td><select name="fq_cat">
							<!-- if 처리해서 fq_cat 뺀 거만 뜨게 
								 = '기타'면 기타 안 뜨게 . (비동기 안하고 할 수 있는 방식. 아닐지도 모름. 일단 레쓰고.)
								-->

							<option value="">선택해주세요~</option>
							<c:forEach var="list" items="${catList}">
								<c:choose>
									<c:when test="${list eq freq.fq_cat }">
										<option value="${list}" selected="selected">${list}</option>
										<%-- <option value="${list}" selected="selected">${list}</option> --%>
									</c:when>
									<c:otherwise>
										<option value="${list}">${list}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="tdCenter">내용</td>
					<%-- <td><input type="text" name="fq_content" value='<c:out value="${freq.fq_content }"></c:out>'></td> --%>
					<td><textarea rows="10" cols="100" class="regInput"
							name="fq_content">${freq.fq_content }</textarea></td>
				</tr>
				<tr >
					<td class="tdCenter">파일</td>
					<td id="reloadLayer">
						
						<h4>기존 업로드 파일 보기</h4><br>
						<c:if test="${ not empty freq.fq_file && freq.fq_file ne ',' }">
						    <span class="hh">${ freq.fq_file}</span> <br>
							<a href="/freq/modify?fq_num=${freq.fq_num }&fq_file=${freq.fq_file }" class="hh"> <br>
							<img src="/img/${freq.fq_file }" name="${freq.fq_file }" style="max-width: 800px; max-height: 500px;"></a>
							<br>
							<input type="hidden" id="fq_file" name="fq_file" value='<c:out value="${freq.fq_file }"/>' />
							<input type="button" id="deleteFileBtn" class="deleteFileBtn" value="파일 삭제">
						</c:if>
						
						<c:choose>
							<c:when test="${ empty freq.fq_file || freq.fq_file eq ','  }">
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
						<input type="reset" class="searchBtn" value="새로쓰기"> 
						<input type="button" class="searchBtn" value="목록"> 
						<input type="hidden" id="fq_num" name="fq_num" value='<c:out value="${freq.fq_num }"/>' />
						<input type="hidden" id="fq_file" name="fq_file" value='<c:out value="${freq.fq_file }"/>' /> 
						<input type="hidden" name="nowPage" value="${pageMaker.nowPage }">
						<input type="hidden" name="cntPage" value="${pageMaker.cntPage}">
						<input type="hidden" name="cntPerPage"
						value="${pageMaker.cntPerPage}">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	</form>
</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->


<script type="text/javascript">
	/* 
	    function deleteFile(obj) {
	        obj.parent().remove();
	    }
	 */

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

		var fq_num = $(".info").find("input[name='fq_num']");
		var fq_title = $(".info").find("input[name='fq_title']");
		var fq_content = $(".info").find("textarea[name='fq_content']");
		var fq_cat = $(".info").find("select[name='fq_cat']");
		var fq_file = $(".info").find("input[name='fq_file']");
		var uploadFile = $(".info").find("input[name='uploadFile']");

		console.log("fq_num : " + fq_num.val());
		console.log("fq_title : " + fq_title.val());
		console.log("fq_content : " + fq_content.val());
		console.log("fq_cat : " + fq_cat.val());
		console.log("fq_file : " + fq_file.val());

		$("#deleteFileBtn").on("click", function(e) {
			fq_file.val("");
			
			
			$(".hh").hide();
	
		}); // end : deleteUploadedFile 이벤트 종료
		
		$("#deleteUploadingFile").on("click", function(e) {
			console.log("uploadFile 값? >> " + uploadFile.val());
			uploadFile.val("");
			
			console.log("uploadFile 값? >> " + uploadFile.val());
			location.reload();
		}); // end : deleteUploadingFile 이벤트 종료
		

		/* $("#delFile").on("click", function(e) {
			alert("$(this).fq_file은? " + $(this).attr("value"));
		    //deleteFile($(this).attr("value"));
			$(this).fq_file.remove();
		        });
		 */

		/* 
		$("#delFile").click(function(){
		if(confirm("한번 삭제하면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?")==true){
			
			$.ajax({
				type:"POST",
				url:"/freq/modifyImg",
				dataType:'json',
				data: param, //json형태로 데이터를 날려줍니다.
				success: function(data){ 
					alert("이미지 삭제 성공 !"); 
				},
					//이미지를 지웠으면 blank이미지로 교체 해준다.
				error: function(){ 
					alert("사진을 삭제하지 못했습니다."); 
				}
			});
		}
		});
		 */

		var formObj = $("form");
		 
		 $("#modifyBtn").on("click", function(e) {
				
				e.preventDefault();

				formObj.attr("action", "/freq/modify"); //리스트로 보냄

				var nowPageTag = $("input[name='nowPage']").clone();
				var cntPageTag = $("input[name='cntPage']").clone();
				
				formObj.submit();

			}); // end : modifyBtn 이벤트 종료
			
		/* $("button").on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			if (operation == 'modify') {
				formObj.attr("action", "/freq/modify"); //리스트로 보냄

				var nowPageTag = $("input[name='nowPage']").clone();
				var cntPageTag = $("input[name='cntPage']").clone();

			} else if (operation == 'list') {
				formObj.attr("action", "/freq/list"); //리스트로 보냄
				formObj.attr("method", "get"); //메소드를 get방식으로 변경

				var nowPageTag = $("input[name='nowPage']").clone();
				var cntPageTag = $("input[name='cntPage']").clone();

				formObj.empty(); //form 안에있는 모든 데이터들을 다 날려버림

				formObj.append(nowPageTag);
				formObj.append(cntPageTag);
			}
			formObj.submit();
		}); */
	});
</script>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
