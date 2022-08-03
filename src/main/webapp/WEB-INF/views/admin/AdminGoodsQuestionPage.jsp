<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin | Camily</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
<script src="https://kit.fontawesome.com/d70fa0d402.js"
	crossorigin="anonymous"></script>

<style type="text/css">
.section-reply-title {
	margin-bottom: 30px;
}

.section-reply-title h5 {
	color: #000000;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h6 {
	color: #848484;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h5:after {
	position: absolute;
	left: 0;
	top: -6px;
	height: 32px;
	width: 4px;
	background: #6E6E6E;
	content: "";
}
</style>


</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-0-lg">
						<div class="section-reply-title">
								<h5>캠핑용품 문의글 확인</h5>
						</div>
						<div>
							<button class="btn btn-info" onclick="allQuestion()">전체보기</button>
							<button class="btn btn-warning" onclick="notyetQuestion()">미답변
								문의만 보기</button>
						</div>
							<div id="questionList">
								<div class="row">
									<div class="col-sm-10 col-md-10 col-lg-8 m-lr-auto">
										<div class="p-b-30 m-lr-15-sm">
											<div id="goodsQnAList_div">
												<!-- 상품 문의 -->
												<c:forEach items="${goodsQnAList}" var="goodsQnAInfo">
													<div class="p-b-68" id="${goodsQnAInfo.gqcode}">
														<c:choose>
															<c:when test="${goodsQnAInfo.gqstate != 0}">
																<!-- 상품 문의글 -->
																<div id="${goodsQnAInfo.gqcode}_question">
																	<div class="flex-w flex-sb-m">
																		<span class="mtext-107 cl2 p-r-20" id="questionId">
																			${goodsQnAInfo.gqmid} [ ${goodsQnAInfo.gname} ]
																		</span>
																		<span id="${goodsQnAInfo.gqcode}_qustionBtn">
																			<button type="button" class="btn btn-danger" onclick="deleteQuestion('${goodsQnAInfo.gqcode}')">삭제</button>
																		</span>
																	</div>
																	<div class="p-b-17" style="font-size: 12px;">${goodsQnAInfo.gqdate}</div>
																	<textarea class="stext-102 cl6 autoTextarea" id="${goodsQnAInfo.gqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">${goodsQnAInfo.gqcontents}</textarea>
																</div>
																<!-- 답글 -->
																<div id="${goodsQnAInfo.gqcode}_answer">
																	<c:choose>
																		<c:when test="${goodsQnAInfo.gwcode == null}">
																			<div class="row p-b-25">
																				<div class="col-12 p-b-5">
																					<label class="stext-102 cl3" for="review">답글 작성</label>
																					<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10 autoTextarea" id="${goodsQnAInfo.gqcode}_gwcontents" name="gwcontents" style="resize: none;"></textarea>
																					<button class="btn btn-primary m-t-10" onclick="gqAnswerSubmit('${goodsQnAInfo.gqcode}')" style="float: right;">답변작성</button>
																				</div>
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="flex-w flex-t">
																				<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">
																					<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>
																				</div>
																				<div class="size-207">
																					<div class="flex-w flex-sb-m">
																						<span class="mtext-107 cl2 p-r-20">
																							Camily
																						</span>
																						<span id="${goodsQnAInfo.gwcode}_modifyAnswerBtn">
																							<button type="button" class="btn btn-success" onclick="modifyAnswerForm('${goodsQnAInfo.gwcode}')">수정</button>
																						</span>
																					</div>
																					<div class="p-b-17" style="font-size: 12px;">${goodsQnAInfo.gwdate}</div>
																					<textarea class="stext-102 cl6 autoTextarea" id="${goodsQnAInfo.gwcode}_answerForm" name="answer" style="width: 100%; resize: none;" readonly="readonly">${goodsQnAInfo.gwcontents}</textarea>
																				</div>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</div>
															</c:when>
															<c:otherwise>
																<div id="${goodsQnAInfo.gqcode}_question">
																	<div class="flex-w flex-sb-m">
																		<span class="mtext-107 cl2 p-r-20" id="questionId">
																			${goodsQnAInfo.gqmid} [ ${goodsQnAInfo.gname}]
																		</span>
																	</div>
																	<div class="p-b-17" style="font-size: 12px;">${goodsQnAInfo.gqdate}</div>
																	<textarea class="stext-102 cl6 autoTextarea" id="${goodsQnAInfo.gqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>
																</div>
															</c:otherwise>
														</c:choose>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#"
								class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1 </a> <a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2 </a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>
	<script>
	function allQuestion(){
		$.ajax({
		type: "get",
		url: "adminGoodsQuestionList",
		data: {},
		dataType: "json",
		async: false,
		success: function(result){
			console.log(result);
			var output = "";
			for(var i = 0; i < result.length; i++){
				if(result[i].gqstate != 0){
					output += '<div class="p-b-68" id="' + result[i].gqcode + '">';
					if(result[i].gqstate != 0){
						output += '<div id="' + result[i].gqcode + '_question">';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].gqmid +  ' [ ' + result[i].gname + ' ]';
						output += '</span>';
						output += '<span id="' + result[i].gqcode + '_qustionBtn">';
						output += '<button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].gqcode + '\')">삭제</button>';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gqdate + '</div>';
						output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].gqcontents + '</textarea>';
						output += '</div>';
						output += '<div id="' + result[i].gqcode + '_answer">';
						if(result[i].gwcode == null){
							output += '<div class="row p-b-25">';
							output += '<div class="col-12 p-b-5">';
							output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
							output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10 autoTextarea" id="' + result[i].gqcode + '_cwcontents" name="cwcontents" style="resize: none;"></textarea>';
							output += '<button class="btn btn-primary m-t-10" onclick="cqAnswerSubmit(\'' + result[i].gqcode + '\')" style="float: right;">답변작성</button>';
							output += '</div>';
							output += '</div>';
						}else{
							output += '<div class="flex-w flex-t">';
							output += '<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">';
							output += '<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>';
							output += '</div>';
							output += '<div class="size-207">';
							output += '<div class="flex-w flex-sb-m">';
							output += '<span class="mtext-107 cl2 p-r-20">';
							output += 'Camily';
							output += '</span>';

							output += '<span id="' + result[i].cwcode + '_modifyAnswerBtn">'
							output += '<button type="button" class="btn btn-success" onclick="modifyAnswerForm(' + result[i].cwcode + ')">수정</button>'
							output += '</span>'
							output += '</div>';
							output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cwdate + '</div>'
							output += '<textarea class="stext-102 cl6 autoTextarea" id="answer" name="answer" style="width: 100%; resize: none;" readonly="readonly">' + result[i].gwcontents + '</textarea>';
							output += '</div>';
							output += '</div>';
						}
					}else{
						output += '<div id="' + result[i].gqcode + '_question">';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].gqmid + ' [ ' + result[i].gname + ' ]';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gqdate + '</div>';
						output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>';
						output += '</div>';
					}
					output += '</div>';
					$("#goodsQnAList_div").html(output);
				}
				$("#goodsQnAList_div").html(output);
			}
		}
		});
	}

		function notyetQuestion() {
			$
					.ajax({
						type : "get",
						url : "adminGoodsQuestionList",
						data : {},
						dataType : "json",
						async : false,
						success : function(result) {
							console.log(result);
							var output = "";
							for (var i = 0; i < result.length; i++) {
								if (result.gqstate != 0
										&& result[i].gwcode == null) {
									output += '<div class="p-b-68" id="' + result[i].gqcode + '">';
									output += '<div>';
									output += '<div class="flex-w flex-sb-m">';
									output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
									output += result[i].gqmid + ' [ '
											+ result[i].gname + ' ]';
									output += '</span>';
									output += '<span id="' + result[i].gqcode + '_qustionBtn">';
									output += '<button class="btn btn-danger" onclick="deleteQuestion(\''
											+ result[i].gqcode
											+ '\')">삭제</button>';
									output += '</span>';
									output += '</div>';
									output += '<div class="p-b-17" style="font-size: 12px;">'
											+ result[i].gqdate + '</div>';
									output += '<textarea class="stext-102 cl6" id="'
											+ result[i].gqcode
											+ '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">'
											+ result[i].gqcontents
											+ '</textarea>';
									output += '</div>';
									output += '<div id="' + result[i].gqcode + '_answer">';
									output += '<div class="row p-b-25">';
									output += '<div class="col-12 p-b-5">';
									output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
									output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="' + result[i].gqcode + '_cwcontents" name="cwcontents" style="resize: none;"></textarea>';
									output += '<button class="btn btn-primary m-t-10" onclick="gqAnswerSubmit(\''
											+ result[i].gqcode
											+ '\')" style="float: right;">답변작성</button>';
									output += '</div>';
									output += '</div>';
									output += '</div>';
									output += '</div>';
								}
							}
							$("#goodsQnAList_div").html(output);
						}
					});
		}

		function notyetQuestion(){
			$.ajax({
			type: "get",
			url: "adminGoodsQuestionList",
			data: {},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				var output = "";
				for(var i = 0; i < result.length; i++){
					if(result[i].gqstate != 0 && result[i].gwcode == null){
						output += '<div class="p-b-68" id="' + result[i].gqcode + '">';
						output += '<div>';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].gqmid +  ' [ ' + result[i].gname + ' ]';
						output += '</span>';
						output += '<span id="' + result[i].gqcode + '_qustionBtn">';
						output += '<button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].gqcode + '\')">삭제</button>';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gqdate + '</div>';
						output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].gqcontents + '</textarea>';
						output += '</div>';
						output += '<div id="' + result[i].gqcode + '_answer">';
						output += '<div class="row p-b-25">';
						output += '<div class="col-12 p-b-5">';
						output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
						output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10 autoTextarea" id="' + result[i].gqcode + '_cwcontents" name="cwcontents" style="resize: none;"></textarea>';
						output += '<button class="btn btn-primary m-t-10" onclick="cqAnswerSubmit(\'' + result[i].gqcode + '\')" style="float: right;">답변작성</button>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
					}
				}
				$("#goodsQnAList_div").html(output);
			}
			});
		}

		function gqAnswerSubmit(gqcode){
			var gwcontents = $("#"+ gqcode +"_gwcontents").val();
			console.log("gwgqcode : " + gqcode);
			console.log("gwcontents : " + gwcontents);
			
			$.ajax({
			type: "get",
			url: "adminGoodsAnswer",
			data: {"gwgqcode": gqcode, "gwcontents": gwcontents},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				var output = "";
				output += '<div class="flex-w flex-t">';
				output += '<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">';
				output += '<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>';
				output += '</div>';
				output += '<div class="size-207">';
				output += '<div class="flex-w flex-sb-m">';
				output += '<span class="mtext-107 cl2 p-r-20">';
				output += 'Camily';
				output += '</span>';
				output += '</div>';
				output += '<div class="p-b-17" style="font-size: 12px;">' + result.gwdate + '</div>'
				output += '<textarea class="stext-102 cl6 autoTextarea" id="answer" name="answer" style="width: 100%; resize: none;" readonly="readonly">' + result.gwcontents + '</textarea>';
				output += '</div>';
				output += '</div>';
				$("#" + result.gqcode + "_answer").html(output);
			}
			});
			textareaAutoSize();
		}

		function modifyAnswerForm(gwcode) {
			$("#" + gwcode + "_answerForm").removeAttr("readonly")
			$("#" + gwcode + "_answerForm").addClass(
					"size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");

			var output = "";
			output += '<button class="btn btn-primary m-r-10" onclick="modifyAnswer(\''
					+ gwcode + '\')">확인</button>';
			output += '<button class="btn btn-danger" onclick="cancelModify(\''
					+ gwcode + '\')">취소</button>'
			$("#" + gwcode + "_modifyAnswerBtn").html(output);
		}

		function cancelModify(gwcode) {
			$("#" + gwcode + "_answerForm").attr("readonly")
			$("#" + gwcode + "_answerForm").removeClass(
					"size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");

			var output = "";
			output += '<button type="button" class="btn btn-success" onclick="modifyAnswerForm(\''
					+ gwcode + '\')">수정</button>';
			$("#" + gwcode + "_modifyAnswerBtn").html(output);
		}

		function modifyAnswer(gwcode) {
			var gwcontents = $("#" + gwcode + "_answerForm").val();
			console.log(gwcontents);
			$.ajax({
				type : "get",
				url : "adminGoodsAnswerModify",
				data : {
					"gwcode" : gwcode,
					"gwcontents" : gwcontents
				},
				dataType : "json",
				async : false,
				success : function(result) {
					console.log(result);
					if (result != "NG") {
						$("#" + gwcode + "_answerForm").val(result.gwcontents);
						cancelModify(gwcode);
					}
				}
			});
			textareaAutoSize();
		}

		/*
		function deleteQuestion(cqcode){
			$.ajax({
			type: "get",
			url: "deleteQustion",
			data: {"cqcode": cqcode},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				if(result != "NG"){
					var output = "";
					output += '<div id="' + cqcode + '_question">';
					output += '<div class="flex-w flex-sb-m">';
					output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
					output += result.cqmid +' [ ' + result.caname + ']';
					output += '</span>';
					output += '</div>';
					output += '<div class="p-b-17" style="font-size: 12px;">' + result.cqdate + '</div>';
					output += '<textarea class="stext-102 cl6 autoTextarea" id="' + cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>';
					output += '</div>';
					$("#" + cqcode).html(output);
				}
			}
			});
		}
		*/


	</script>

</body>
<script>
	window.onload = function(){
		textareaAutoSize();
	}
	function textareaAutoSize(){
		let textarea =  $(".autoTextarea");
		// console.log(textarea);
		for(var i = 0; i < textarea.length; i++){
			if (textarea) {
				// console.log("textarea["+i+"] : " + textarea[i])
				textarea[i].style.height = 'auto';
				let height = textarea[i].scrollHeight; // 높이
				// console.log(height);
				textarea[i].style.height = ( height + 8 ) + `px`;
			}
		}
	}
</script>
</html>