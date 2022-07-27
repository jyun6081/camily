<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>관리자 문의 관리 게시판</title>
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
<script src="https://kit.fontawesome.com/d70fa0d402.js" crossorigin="anonymous"></script>

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
								<h5>캠핑장 문의글 확인</h5>
						</div>
						<div>
							<button class="btn btn-info" onclick="allQuestion()">전체보기</button>
							<button class="btn btn-warning" onclick="notyetQuestion()">미답변 문의만 보기</button>
						</div>
							<div id="questionList">
								<div class="row">
									<div class="col-sm-10 col-md-10 col-lg-8 m-lr-auto">
										<div class="p-b-30 m-lr-15-sm">
											<div id="campingQnAList_div">
												<!-- 캠핑장 문의 -->
												<c:forEach items="${campingQnAList}" var="campingQnAInfo">
													<div class="p-b-68" id="${campingQnAInfo.cqcode}">
														<c:choose>
															<c:when test="${campingQnAInfo.cqstate != 0}">
																<!-- 캠핑장 문의글 -->
																<div id="${campingQnAInfo.cqcode}_question">
																	<div class="flex-w flex-sb-m">
																		<span class="mtext-107 cl2 p-r-20" id="questionId">
																			${campingQnAInfo.cqmid} [ ${campingQnAInfo.caname}]
																		</span>
																		<span id="${campingQnAInfo.cqcode}_qustionBtn">
																			<button type="button" class="btn btn-danger" onclick="deleteQuestion('${campingQnAInfo.cqcode}')">삭제</button>
																		</span>
																	</div>
																	<div class="p-b-17" style="font-size: 12px;">${campingQnAInfo.cqdate}</div>
																	<textarea class="stext-102 cl6" id="${campingQnAInfo.cqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">${campingQnAInfo.cqcontents}</textarea>
																</div>
																<!-- 답글 -->
																<div id="${campingQnAInfo.cqcode}_answer">
																	<c:choose>
																		<c:when test="${campingQnAInfo.cwcode == null}">
																			<div class="row p-b-25">
																				<div class="col-12 p-b-5">
																					<label class="stext-102 cl3" for="review">답글 작성</label>
																					<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="${campingQnAInfo.cqcode}_cwcontents" name="cwcontents" style="resize: none;"></textarea>
																					<button class="btn btn-primary m-t-10" onclick="cqAnswerSubmit('${campingQnAInfo.cqcode}')" style="float: right;">답변작성</button>
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
																						<span id="${campingQnAInfo.cwcode}_modifyAnswerBtn">
																							<button type="button" class="btn btn-success" onclick="modifyAnswerForm('${campingQnAInfo.cwcode}')">수정</button>
																						</span>
																					</div>
																					<div class="p-b-17" style="font-size: 12px;">${campingQnAInfo.cwdate}</div>
																					<textarea class="stext-102 cl6" id="${campingQnAInfo.cwcode}_answerForm" name="answer" style="width: 100%; resize: none;" readonly="readonly">${campingQnAInfo.cwcontents}</textarea>
																				</div>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</div>
															</c:when>
															<c:otherwise>
																<div id="${campingQnAInfo.cqcode}_question">
																	<div class="flex-w flex-sb-m">
																		<span class="mtext-107 cl2 p-r-20" id="questionId">
																			${campingQnAInfo.cqmid} [ ${campingQnAInfo.caname}]
																		</span>
																	</div>
																	<div class="p-b-17" style="font-size: 12px;">${campingQnAInfo.cqdate}</div>
																	<textarea class="stext-102 cl6" id="${campingQnAInfo.cqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>
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
			url: "adminCampingQuestionList",
			data: {},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				var output = "";
				for(var i = 0; i < result.length; i++){
					output += '<div class="p-b-68" id="' + result[i].cqcode + '">';
					if(result.cqstate != 0){
						output += '<div id="' + result[i].cqcode + '_question">';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].cqmid +  ' [ ' + result[i].caname + ' ]';
						output += '</span>';
						output += '<span id="' + result[i].cqcode + '_qustionBtn">';
						output += '<button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].cqcode + '\')">삭제</button>';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cqdate + '</div>';
						output += '<textarea class="stext-102 cl6" id="' + result[i].cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].cqcontents + '</textarea>';
						output += '</div>';
						output += '<div id="' + result[i].cqcode + '_answer">';
						if(result[i].cwcode == null){
							output += '<div class="row p-b-25">';
							output += '<div class="col-12 p-b-5">';
							output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
							output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="' + result[i].cqcode + '_cwcontents" name="cwcontents" style="resize: none;"></textarea>';
							output += '<button class="btn btn-primary m-t-10" onclick="cqAnswerSubmit(\'' + result[i].cqcode + '\')" style="float: right;">답변작성</button>';
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
							output += '</div>';
							output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cwdate + '</div>'
							output += '<textarea class="stext-102 cl6" id="answer" name="answer" style="width: 100%; resize: none;" readonly="readonly">' + result[i].cwcontents + '</textarea>';
							output += '</div>';
							output += '</div>';
						}
						output += '</div>';
						output += '</div>';
					}else{
						output += '<div id="' + result[i].cqcode + '_question">';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].cqmid + ' [ ' + result[i].caname + ' ]';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cqdate + '</div>';
						output += '<textarea class="stext-102 cl6" id="' + result[i].cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>';
						output += '</div>';
					}
					$("#campingQnAList_div").html(output);
				}
			}
			});
		}

		function notyetQuestion(){
			$.ajax({
			type: "get",
			url: "adminCampingQuestionList",
			data: {},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				var output = "";
				for(var i = 0; i < result.length; i++){
					if(result.cqstate != 0 && result[i].cwcode == null){
						output += '<div class="p-b-68" id="' + result[i].cqcode + '">';
						output += '<div>';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].cqmid +  ' [ ' + result[i].caname + ' ]';
						output += '</span>';
						output += '<span id="' + result[i].cqcode + '_qustionBtn">';
						output += '<button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].cqcode + '\')">삭제</button>';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cqdate + '</div>';
						output += '<textarea class="stext-102 cl6" id="' + result[i].cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].cqcontents + '</textarea>';
						output += '</div>';
						output += '<div id="' + result[i].cqcode + '_answer">';
						output += '<div class="row p-b-25">';
						output += '<div class="col-12 p-b-5">';
						output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
						output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="' + result[i].cqcode + '_cwcontents" name="cwcontents" style="resize: none;"></textarea>';
						output += '<button class="btn btn-primary m-t-10" onclick="cqAnswerSubmit(\'' + result[i].cqcode + '\')" style="float: right;">답변작성</button>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
					}
				}
				$("#campingQnAList_div").html(output);
			}
			});
		}

		function cqAnswerSubmit(cqcode){
			var cwcontents = $("#"+ cqcode +"_cwcontents").val();
			console.log("cwcqcode : " + cqcode);
			console.log("cwcontents : " + cwcontents);
			
			$.ajax({
			type: "get",
			url: "adminCampingAnswer",
			data: {"cwcqcode": cqcode, "cwcontents": cwcontents},
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
				output += '<div class="p-b-17" style="font-size: 12px;">' + result.cwdate + '</div>'
				output += '<textarea class="stext-102 cl6" id="answer" name="answer" style="width: 100%; resize: none;" readonly="readonly">' + result.cwcontents + '</textarea>';
				output += '</div>';
				output += '</div>';
				$("#" + result.cqcode + "_answer").html(output);
			}
			});
			
		}

		function modifyAnswerForm(cwcode){
			$("#" + cwcode + "_answerForm").removeAttr("readonly")
			$("#" + cwcode + "_answerForm").addClass("size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");

			var output = "";
			output += '<button class="btn btn-primary m-r-10" onclick="modifyAnswer(\'' + cwcode + '\')">확인</button>';
			output += '<button class="btn btn-danger" onclick="cancelModify(\'' + cwcode + '\')">취소</button>'
			$("#"+cwcode+"_modifyAnswerBtn").html(output);
		}

		function cancelModify(cwcode){
			$("#" + cwcode + "_answerForm").attr("readonly")
			$("#" + cwcode + "_answerForm").removeClass("size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");

			var output = "";
			output += '<button type="button" class="btn btn-success" onclick="modifyAnswerForm(\'' + cwcode + '\')">수정</button>';
			$("#"+cwcode+"_modifyAnswerBtn").html(output);
		}

		function modifyAnswer(cwcode){
			var cwcontents = $("#" + cwcode + "_answerForm").val();
			console.log(cwcontents);
			$.ajax({
			type: "get",
			url: "adminCampingAnswerModify",
			data: {"cwcode": cwcode, "cwcontents": cwcontents},
			dataType: "json",
			async: false,
			success: function(result){
				console.log(result);
				if(result != "NG"){
					$("#" + cwcode + "_answerForm").val(result.cwcontents);
					cancelModify(cwcode);
				}
			}
			});
		}

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
					output += '<textarea class="stext-102 cl6" id="' + cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>';
					output += '</div>';
					$("#" + cqcode).html(output);
				}
			}
			});
		}

	</script>

</body>
</html>