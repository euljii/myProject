<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ page session="false" %>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/eulji.css">


<!-- 이 부분 내용만 수정 (바디 작성 부분)-->

<section class="cont">
	<div class="contents" >
		<form action="/notice/ntRegister" method="post" role="form" enctype="multipart/form-data" id="operForm">
		<br>
			<table class="registerTbl" style="width: 100%;">
				<thead>
					<tr>
						<th colspan="2" class="tdCenter">공지사항 글 등록하기 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>제목</td>
						<td><input type="text" class="regInput" name="n_title" style="float: left;"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="80" class="regInput" name="n_content" ></textarea></td>
					</tr>
					<tr >
						<td>파일</td>
						<td class="uploadDiv">
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
						<td colspan="2"  class="tdCenter">
							<button data-oper="register" class="searchBtn">등록</button>
							<button data-oper="list" class="searchBtn" onclick="location.href = '/notice/ntList'" type="button">목록</button>
							<button type="reset" class="searchBtn">새로쓰기</button>
						
							<%-- <input type="hidden" name="pageNum" value="${cri.pageNum }">
             						<input type="hidden" name="amount" value="${cri.amount}"> --%>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>	<!-- div contents end -->
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
					
		// ajax 태워보려 했으나 실패.. 
		/* 
		var operForm = $("#operForm");
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		// var maxSize = 20971520; //20MB
		var maxSize = 5242880; // 5MB

		function checkExtension(n_file, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if (regex.test(n_file)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다");
				return false;
			}
			return true;
		}

		var cloneOBJ = $(".uploadDiv").clone();		// 첨부파일을 복사
		
		$("#uploadBtn").on("click", function() {	// upload 버튼 눌리면!
			var formData = new FormData();			// FormData 객체 이용 (form 태그 같은 애)
		
			var inputFile = $("input[name='n_file']");
			var files = inputFile[0].files;
			console.log(files);

			// 파일데이터 FormData에 추가하기
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("n_file", files[i]);	// 첨부파일 추가
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

				var fileCallPath = encodeURIComponent(obj.n_uploadPath + "/"
						+ obj.n_uuid + "_" + obj.n_file);
				// 인코딩해주기

				str += '<li>'
				str += '<a href=/download?n_file=' + fileCallPath + '>';
				// n_file, n_uploadPath, n_uuid 세개만 있으면 위치 찾을 수 있다..
				// download 겟 매핑

				str += "<img src='/resources/img/cool.png'>" + obj.n_file; // 파일 이름 보여주기
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

		// register; button인데 type이 register인 것. []에 속성 찾아서 쓸 수 있는 것-> 클릭이벤트나 온 넣을 수 있음
		$("button[data-oper='register']").click(function(e) {
			
			e.preventDefault();
			
			// 필수 데이터 미입력시 alert
			var title = $("input[name='n_title']").val();
			var cont = $("textarea[name='n_content']").val();
			
			if(title == ""){
				alert("제목을 입력하세요.");
				return;
			}else if(cont == ""){
				alert("내용을 입력하세요.");
				return;
			}else{
				operForm.submit();
			}

			console.log("n_title? " + title);
			console.log("n_content? " + cont);
			
		});
			// operForm.attr("action", "/notice/ntRegister").submit(); // action을 보드 모디파이에 작성한 후 submit
			
		$("#deleteUploadingFile").on("click", function(e) {
			uploadFile.val("");
			
			console.log("uploadFile 값? >> " + uploadFile.val());
			location.reload();
		}); // end : deleteUploadingFile 이벤트 종료
	}); 
</script>
<!-- 이 부분 내용만 수정 (바디 작성 부분)-->
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>