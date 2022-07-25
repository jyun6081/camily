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
											<div id="campingQuestionList_div">
												<!-- 캠핑장 문의 -->
												<c:forEach items="${campingQuestionList}" var="campingQustionInfo">
													<div class="p-b-68" id="${campingQustionInfo.cqcode}">
														<!-- 캠핑장 문의글 -->
														<div>
															<form action="questionWrite" method="post" id="${campingQustionInfo.cqcode}_questionModify">
																<div class="flex-w flex-sb-m">
																	<span class="mtext-107 cl2 p-r-20" id="questionId">
																		${campingQustionInfo.cqmid} [ ${campingQustionInfo.caname}]
																	</span>
																	<span id="${campingQustionInfo.cqcode}_qustionBtn">
																		<button class="btn btn-success m-r-10" onclick="answerQuestionForm('${campingQustionInfo.cqcode}')">답변</button><button class="btn btn-danger" onclick="deleteQuestion('${campingQustionInfo.cqcode}')">삭제</button>
																	</span>
																</div>
																<div class="p-b-17" style="font-size: 12px;">${campingQustionInfo.cqdate}</div>
																<textarea class="stext-102 cl6" id="${campingQustionInfo.cqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">${campingQustionInfo.cqcontents}</textarea>
															</form>
														</div>
														<!-- 답글 -->
														<c:choose>
															<c:when test="${campingQustionInfo.cqstate == 1}">
																<div class="row p-b-25">
																	<div class="col-12 p-b-5">
																		<label class="stext-102 cl3" for="review">답글 작성</label>
																		<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="cqcontents" name="cqcontents" style="resize: none;"></textarea>
																	</div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="flex-w flex-t">
																	<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">
																		<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>
																	</div>
																	<div class="size-207">
																		<div class="flex-w flex-sb-m p-b-17">
																			<span class="mtext-107 cl2 p-r-20">
																				Camily
																			</span>
																		</div>
																		<textarea class="stext-102 cl6" id="${campingQustionInfo.cqcode}_answer" name="answer" style="width: 100%; resize: none;">문의하신 내용에 답변 드립니다.</textarea>
																	</div>
																	<button type="button" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" onclick="cqAnswerSubmit('${campingQustionInfo.cqcode}');">
																		작성
																	</button>
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
					output += '<div>';
					output += '<div class="flex-w flex-sb-m">';
					output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
					output += result[i].cqmid +  ' [ ' + result[i].caname + ' ]';
					output += '</span>';
					output += '<span id="' + result[i].cqcode + '_qustionBtn">';
					output += '<button class="btn btn-success m-r-10" onclick="answerQuestionForm(\''+result[i].cqcode+'\')">답변</button><button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].cqcode + '\')">삭제</button>';
					output += '</span>';
					output += '</div>';
					output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cqdate + '</div>';
					output += '<textarea class="stext-102 cl6" id="' + result[i].cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].cqcontents + '</textarea>';
					output += '</div>';
					if(result[i].cqstate == 1){
						output += '<div class="row p-b-25">';
						output += '<div class="col-12 p-b-5">';
						output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
						output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="cqcontents" name="cqcontents" style="resize: none;"></textarea>';
						output += '</div>';
						output += '</div>';
					}else{
						output += '<div class="flex-w flex-t">';
						output += '<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">';
						output += '<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>';
						output += '</div>';
						output += '<div class="size-207">';
						output += '<div class="flex-w flex-sb-m p-b-17">';
						output += '<span class="mtext-107 cl2 p-r-20">';
						output += 'Camily';
						output += '</span>';
						output += '</div>';
						output += '<textarea class="stext-102 cl6" id="answer" name="answer" style="width: 100%; resize: none;">문의하신 내용에 답변 드립니다.</textarea>';
						output += '</div>';
						output += '<button type="button" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" onclick="cqsubmit();">';
						output += '작성';
						output += '</button>';
						output += '</div>';
					}
					output += '</div>';
					$("#campingQuestionList_div").html(output);
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
					if(result[i].cqstate == 1){
						output += '<div class="p-b-68" id="' + result[i].cqcode + '">';
						output += '<div>';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
						output += result[i].cqmid +  ' [ ' + result[i].caname + ' ]';
						output += '</span>';
						output += '<span id="' + result[i].cqcode + '_qustionBtn">';
						output += '<button class="btn btn-success m-r-10" onclick="answerQuestionForm(\''+result[i].cqcode+'\')">답변</button><button class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].cqcode + '\')">삭제</button>';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].cqdate + '</div>';
						output += '<textarea class="stext-102 cl6" id="' + result[i].cqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].cqcontents + '</textarea>';
						output += '</div>';
						output += '<div class="row p-b-25">';
						output += '<div class="col-12 p-b-5">';
						output += '<label class="stext-102 cl3" for="review">답글 작성</label>';
						output += '<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="cqcontents" name="cqcontents" style="resize: none;"></textarea>';
						output += '</div>';
						output += '</div>';
						output += '</div>';
					}
				}
				$("#campingQuestionList_div").html(output);
			}
			});
		}

		function cqAnswerSubmit(cqcode){
			var cqcontents = $("#"+ cqcode +"answer").val();
			$.ajax({
			type: "get",
			url: "adminCampingAnswer",
			data: {"cqcode": cqcode, "cqcontents": cqcontents},
			dataType: "json",
			async: false,
			success: function(result){
			}
			});
		}
	</script>

</body>
</html>