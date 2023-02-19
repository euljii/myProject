<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">

<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="contents" >
	<!-- <div class="contents" style="display: flex; justify-content: center;"> -->
		<form action="/freq/register" method="post" role="form" enctype="multipart/form-data" id="operForm">
		<!-- enctype 멀티 어쩌고 삭제하니까 400 에러 사라짐 -->
			<table class="registerTbl">
				<thead>
					<tr>
						<th colspan="2" class="tdCenter">자주찾는질문 글 등록하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="fq_title" class="regInput" style="float: left;">
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
							<select id = "fq_cat" name="fq_cat">
								<option value="">카테고리를 선택하세요.</option>
								<option value="여행">여행</option>
								<option value="항공권">항공권</option>
								<option value="패키지">패키지</option>
								<option value="계정">계정</option>
								<option value="신뢰센터">신뢰센터</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="80" class="regInput" name="fq_content" ></textarea></td>
					</tr>
					<tr>
						<td>파일</td>
						<td class="uploadDiv">
						
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
							<button data-oper="register" class="searchBtn">등록</button>
							<button data-oper="list" class="searchBtn" onclick="location.href='/freq/list'" type="button">목록</button>
							<button type="reset" class="searchBtn">새로쓰기</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>	<!-- div contents end -->
</section>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

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
		
		var fq_num =  $(".info").find("input[name='fq_num']");
		var fq_title =  $(".info").find("input[name='fq_title']");
		var fq_content =  $(".info").find("textarea[name='fq_content']");
		var fq_cat =  $(".info").find("select[name='fq_cat']");
		var fq_file =  $(".info").find("input[name='fq_file']");
		var uploadFile =  $(".info").find("input[name='uploadFile']");

		console.log("fq_num : " + fq_num.val());
		console.log("fq_title : " + fq_title.val());
		console.log("fq_content : " + fq_content.val());
		console.log("fq_cat : " + fq_cat.val());
		console.log("fq_file : " + fq_file.val());
		console.log("uploadFile : " + uploadFile.val());		
		
		// ajax 태워보려 했으나 실패.. 
		/* 
		var operForm = $("#operForm");
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		// var maxSize = 20971520; //20MB
		var maxSize = 5242880; // 5MB

		function checkExtension(fq_file, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if (regex.test(fq_file)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다");
				return false;
			}
			return true;
		}

		var cloneOBJ = $(".uploadDiv").clone();		// 첨부파일을 복사
		
		$("#uploadBtn").on("click", function() {	// upload 버튼 눌리면!
			var formData = new FormData();			// FormData 객체 이용 (form 태그 같은 애)
		
			var inputFile = $("input[name='fq_file']");
			var files = inputFile[0].files;
			console.log(files);

			// 파일데이터 FormData에 추가하기
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("fq_file", files[i]);	// 첨부파일 추가
			}

			$.ajax({
				url : "/notice/uploadAjaxAction",
				processData : false,
				contentType : false,
				data : formData,
				type : "post",
				dataType : "json",
				success : function(result) {
					console.log(result);
					$(".uploadDiv").html(cloneOBJ.html());
					// .html() == 내부에 있는 html정보를 가져온다.
					showUploadFile(result);
					alert("업로드 성공!");
				}
			});
		});

		// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
		var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			var str = '';
			for (var i = 0; i < uploadResultArr.length; i++) {
				var obj = uploadResultArr[i];

				var fileCallPath = encodeURIComponent(obj.fq_uploadPath + "/"
						+ obj.fq_uuid + "_" + obj.fq_file);
				// 인코딩해주기

				str += '<li>'
				str += '<a href=/download?fq_file=' + fileCallPath + '>';
				// fq_file, fq_uploadPath, fq_uuid 세개만 있으면 위치 찾을 수 있다..
				// download 겟 매핑

				str += "<img src='/resources/img/cool.png'>" + obj.fq_file; // 파일 이름 보여주기
				str += '</a>'
				str += "<span data-file="+fileCallPath+">X</span>"
				str += '</li>'
			}
			uploadResult.html(str);
		}

		uploadResult.on("click", "span", function() {
			var targetFile = $(this).data("file");

			$.ajax({
				url : "/deleteFile",
				data : {
					fileName : targetFile
				},
				type : "post",
				dataType : "text",
				success : function(result) {
					alert(result);
				}
			})
		}); // end onload
		*/
		var operForm = $("#operForm");
		
		$("#deleteUploadingFile").on("click", function(e) {
			fq_file.val("");
			
			console.log("uploadFile 값? >> " + uploadFile.val());
			location.reload();
			$(".hh").hide();
		}); // end : deleteUploadingFile 이벤트 종료

		// register; button인데 type이 register인 것. []에 속성 찾아서 쓸 수 있는 것-> 클릭이벤트나 온 넣을 수 있음
		$("button[data-oper='register']").click(function(e) {
			
			e.preventDefault();

			// 필수 데이터 미입력시 alert
			var title = $("input[name='fq_title']").val();
			var cont = $("textarea[name='fq_content']").val();
			var cat = $("select[name='fq_cat']").val();
			
			if(title.trim() == ""){
				alert("제목을 입력하세요.");
				return;
			}else if(cont.trim() == ""){
				alert("내용을 입력하세요.");
				return;
			}else if(cat.trim() == ""){
				alert("카테고리를 선택하세요");
				return;
			}else{
				operForm.submit();
			}

			console.log("fq_title : " + title);
			console.log("fq_content : " + cont);
			console.log("fq_cat : " + cat);
			
			/* if(title != "" && cont != "" && cat != ""){
				operForm.attr("action", "/freq/register").submit(); 
				// action을 보드 모디파이에 작성한 후 submit
			} */ 
		});
	}); 
	
</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

		
	
