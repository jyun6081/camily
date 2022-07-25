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
							<div class="row">
								<div class="col-sm-10 col-md-10 col-lg-8 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<div>
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
															<textarea class="stext-102 cl6" id="answer" name="answer" style="width: 100%; resize: none;">문의하신 내용에 답변 드립니다.</textarea>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
										


										<!-- 문의글 작성하기 -->
										<form action="questionWrite" id="cqform">
											<input type="hidden" id="cqmid" name="cqmid" value="${sessionScope.loginId}">
											<input type="hidden" name="cqcacode" value="${campingInfo.cacode}">
											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">문의글 작성</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="cqcontents" name="cqcontents" style="resize: none;"></textarea>
												</div>
											</div>
											<button type="button" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" onclick="cqsubmit();">
												작성
											</button>
										</form>
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

	</script>

</body>
</html>