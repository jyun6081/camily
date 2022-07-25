<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>캠핑장 후기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
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
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script
	src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

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

.fa-star {
	color: #f9ba48
}
</style>



</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->

	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->





	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row isotope-grid" id="goodsList"></div>
		</div>
		<div class="row">
			<div class="col-md-8 col-lg-9 p-b-80">
				<div class="p-r-45 p-r-0-lg">
					<div class="section-reply-title">
						<h5>캠핑장 REVIEW</h5>
						<h6 class="mt-2">캠핑장에서의 좋은 경험을 남겨보세요.</h6>
					</div>


					<div class="row isotope-grid">
						<c:forEach items="${cgrvList}" var="cgrvList">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
								<!-- Block2 -->
								<div class="block2">
									<div class="block2-pic">
										<!--c:set으로 이미지 파일 이름 지정 -->

										<img class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"
											src="${cgrvList.caimage}" alt="캠핑장 이미지"
											style="width: 100%; height: 200px; object-fit: cover; object-position: bottom;">

										<!-- <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
											Quick View
										</a> -->
									</div>

									<div class="block2-txt flex-w flex-t p-t-14">
										<div class="block2-txt-child1 flex-col-l ">

											<span class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"
												style="font-size: 20px; font-weight: bold;">${cgrvList.caname}</span>
										</div>
									</div>

									<div class="p-t-32">
										<!-- <h4 class="p-b-15">
									
										<a href="goreviewdetailpage" class="ltext-108 cl2 hov-cl1 trans-04">
											 
										
										</a>
									</h4> -->

										<p class="stext-117 mt-2" style="color: black;">제목 :
											${cgrvList.cgrvtitle }</p>

										<p class="stext-116">캠핑장 이름 : 🌈${cgrvList.caname }🌈</p>
										<p class="mt-1">
											별점 :
											<c:if test="${cgrvList.cgstarating == 1 }">
												<i class="fa-solid fa-star"></i>
											</c:if>
											<c:if test="${cgrvList.cgstarating == 2 }">
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
											</c:if>
											<c:if test="${cgrvList.cgstarating == 3 }">
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
											</c:if>
											<c:if test="${cgrvList.cgstarating == 4 }">
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
											</c:if>
											<c:if test="${cgrvList.cgstarating == 5 }">
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
												<i class="fa-solid fa-star"></i>
											</c:if>
										</p>

										<div class="flex-w flex-sb-m p-t-18">
											<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
												<span> <span class="cl4"></span><i
													class="fa-regular fa-user"></i> ${cgrvList.cgrvmid } <span
													class="cl12 m-l-4 m-r-6">|</span>
											</span> <span> <span class="cl4"></span><i
													class="fa-regular fa-calendar"></i> ${cgrvList.cgrvdate } <span
													class="cl12 m-l-4 m-r-6">|</span>
											</span> <span> 조회수 ${cgrvList.cgrvhits } </span>
											</span> <a href="cgreviewdetail?cgrvcode=${cgrvList.cgrvcode }"
												class="stext-101 cl2 hov-cl1 trans-04 m-tb-10"> 상세보기 <i
												class="fa fa-long-arrow-right m-l-9"></i>
											</a>
										</div>
									</div>


								</div>
							</div>
						</c:forEach>
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

		<!-- <div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div> -->

	</section>
	<div class="row isotope-grid" id="goodsList"></div>

	<div class="row">
		<div class="col-md-8 col-lg-9 p-b-80">
			<div class="p-r-45 p-r-0-lg">
				<div class="section-reply-title">
					<h5>캠핑장 REVIEW</h5>
					<h6 class="mt-2">캠핑장에서의 좋은 경험을 남겨보세요.</h6>
				</div>


				<div class="row isotope-grid">
					<c:forEach items="${campingreviewList}" var="cgrvList">
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
							<!-- Block2 -->
							<div class="block2">
								<div class="block2-pic">
									<!--c:set으로 이미지 파일 이름 지정 -->

									<a href="cgreviewdetail?cgrvcode=${cgrvList.cgrvcode }"> <img
										class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"
										src="${cgrvList.caimage}" alt="캠핑장 이미지"
										style="width: 100%; height: 200px; object-fit: cover; object-position: bottom;">
									</a>

									<!-- <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
											Quick View
										</a> -->
								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">

										<span class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"
											style="font-size: 20px; font-weight: bold;">${cgrvList.caname}</span>
									</div>
								</div>

								<div class="p-t-32">
									<!-- <h4 class="p-b-15">
									
										<a href="goreviewdetailpage" class="ltext-108 cl2 hov-cl1 trans-04">
											 
										
										</a>
									</h4> -->

									<p class="stext-117 mt-2" style="color: black;">제목 :
										${cgrvList.cgrvtitle }</p>

									<p class="mt-1">
										별점 :
										<c:if test="${cgrvList.cgstarating == 1 }">
											<i class="fa-solid fa-star"></i>
										</c:if>
										<c:if test="${cgrvList.cgstarating == 2 }">
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</c:if>
										<c:if test="${cgrvList.cgstarating == 3 }">
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</c:if>
										<c:if test="${cgrvList.cgstarating == 4 }">
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</c:if>
										<c:if test="${cgrvList.cgstarating == 5 }">
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
											<i class="fa-solid fa-star"></i>
										</c:if>
									</p>

									<div class="flex-w flex-sb-m p-t-18">
										<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
											<span> <span class="cl4"></span><i
												class="fa-regular fa-user"></i> ${cgrvList.cgrvmid } <span
												class="cl12 m-l-4 m-r-6">|</span>
										</span> <span> <span class="cl4"></span><i
												class="fa-regular fa-calendar"></i> ${cgrvList.cgrvdate } <span
												class="cl12 m-l-4 m-r-6">|</span>
										</span> <span> 조회수 ${cgrvList.cgrvhits } </span>
										</span>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
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
	<!-- <div class="col-md-4 col-lg-3 p-b-80">
					<div class="side-menu">
						<div class="bor17 of-hidden pos-relative">
							<input class="stext-103 cl2 plh4 size-116 p-l-28 p-r-55" type="text" name="search" placeholder="Search">

							<button class="flex-c-m size-122 ab-t-r fs-18 cl4 hov-cl1 trans-04">
								<i class="zmdi zmdi-search"></i>
							</button>
						</div> -->

	</section>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>



	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

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

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>
</html>