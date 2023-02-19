<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
<style type="text/css">
	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	td{
		height:70px;
	}
	#left{
		width: 200px;
	}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<link href="/assets/css/star.css" rel="stylesheet"/>

		<section class="cont">
			<div style= "text-align: center;">
			<h3>후기 작성</h3><br><br>
				<form action="uploadFormAction" method="post" enctype="multipart/form-data" class="mb-3" name="myform" id="myform">
					<table style="margin: auto">
						<tr>
							<td id="left">
								후기 내용
							</td>
							<td>
								<input type="hidden" name="p_rnum" value="${p_rnum}">
								<input type="hidden" name="p_num" value="${p_num}">
								<input type="hidden" name="m_idx" value="${loginPublicInfo.m_idx}">
								<input type="hidden" name="m_id" value="${loginPublicInfo.m_id}">
								<input type="text" name="p_reviewcontent" style="width:500px; height:200px;">
							</td>
						</tr>
						<tr>
							<td id="left">
								후기 사진
							</td>
							<td>
								<input type="file" name="uploadFile" multiple="multiple">
							</td>
						</tr>
						<tr>
							<td id="left">
								별점
							</td>
							<td>
								<fieldset>
									<input type="radio" name="p_star" value="5" id="rate1"><label
										for="rate1">★</label>
									<input type="radio" name="p_star" value="4" id="rate2"><label
										for="rate2">★</label>
									<input type="radio" name="p_star" value="3" id="rate3"><label
										for="rate3">★</label>
									<input type="radio" name="p_star" value="2" id="rate4"><label
										for="rate4">★</label>
									<input type="radio" name="p_star" value="1" id="rate5"><label
										for="rate5">★</label>
								</fieldset>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;"><button id="buttonB">후기 등록</button></td>
						</tr>
					</table>
				</form>
			</div>
		</section>
		
<script type="text/javascript">

</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>