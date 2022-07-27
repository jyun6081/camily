<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camily</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->

<style type="text/css">
.section-reply-title {
	margin-bottom: 30px;
}

.section-reply-title h5 {
	color: black;
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
	background: #ff8000;
	content: "";
}

.section-reply-title h5:after {
	position: absolute;
	left: 0;
	top: -6px;
	height: 32px;
	width: 4px;
	background: #ff8000;
	content: "";
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

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<c:forEach items="${bannerList}" var="bannerInfo">
					<div id="${bannerInfo.bncode}">
						<div class="item-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/bannerUpload/${bannerInfo.bnimage});">
							<div class="container h-full">
								<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bntitleeffect}" data-delay="0">
										<span class="ltext-101 cl2 respon2" style="color: white; text-shadow: 1px 1px 1px #000;">${bannerInfo.bntitle}</span>
									</div>
		
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bncontentseffect}" data-delay="800">
										<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="color: white; text-shadow: 1px 1px 1px #000;">${bannerInfo.bncontents}</h2>
									</div>
		
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bnlinkeffect}" data-delay="1600">
										<a href="${bannerInfo.bnlink}" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">보러가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>




		<!-- Banner -->
	<section>
		<div class="sec-banner bg0 p-t-80 p-b-50">
			<div class="container">
				<div class="section-reply-title">
					<h5>New item</h5>
				</div>
				 <div class="row">

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
							<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${homeList[0].gimage }">
						     <a href="campingDetailPage?gcode=${homeList[0].gcode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
						</div>
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
							<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${homeList[1].gimage }">
						     <a href="campingDetailPage?gcode=${homeList[1].gcode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
						</div>
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
							<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${homeList[2].gimage }">
						     <a href="campingDetailPage?gcode=${homeList[2].gcode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
						</div>
					</div>
					
				</div>
			</div>
          </div>

			<!-- Banner2 -->
		<div class="sec-banner bg0 p-t-80 p-b-50"> 	
			<div class="container">
				<div class="section-reply-title">
					<h5>Hot Camping</h5>
				</div>
				 <div class="row">

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
						
					     <c:if test="${homeList2[0].cacode == null}">
					         <p>아직 HOT한 예약 목록이 없습니다.</p>
						 </c:if>
						 
						 <c:if test="${homeList2[0].cacode != null}">						
							<div class="#7FFF00">
							<img src="${homeList2[0].caimage }">
						     <a href="campingView?cacode=${homeList2[0].cacode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
							</div> 
					     </c:if>		 
					  </div>
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
						
						 <c:if test="${homeList2[1].cacode == null}">
					         <p>아직 HOT한 예약 목록이 없습니다.</p>
						 </c:if>
						    
						 <c:if test="${homeList2[1].cacode != null}">
							<img src="${homeList2[1].caimage }">
						     <a href="campingView?cacode=${homeList2[1].cacode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
						  </c:if>
						</div>
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->
						<div class="block1 wrap-pic-w">
						
						 <c:if test="${homeList2[2].cacode == null}">
					         <p>아직 HOT한 예약 목록이 없습니다.</p>
						 </c:if>
						 
						  <c:if test="${homeList2[2].cacode != null}">
							<img src="${homeList2[2].caimage }">
						     <a href="campingView?cacode=${homeList2[2].cacode }"class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
								<div class="block1-txt-child2 p-b-4 trans-05">
									<div class="block1-link stext-101 cl0 trans-09">Shop Now</div>
								</div>
							 </a>
						  </c:if>
						</div>
					</div>
					
				</div>
			</div>
		</div> 	

	 <div class="sec-banner bg0 p-t-80 p-b-50">
			<div class="container">
				<div class="section-reply-title">
					<h5>캠핑TIP</h5>
				</div>
				
				<div class="row">

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->							
							<iframe width="100%" height="300px"  src="https://www.youtube.com/embed/4aru6TnPDfY" title="캠핑카, 카라반 캠핑 안전상식~!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>									
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->						
							<iframe width="100%" height="300px" src="https://www.youtube.com/embed/gNC-n32JyHI" title="캠핑장 사고예방 안전수칙 함께 알아볼까요?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>						
					</div>

					<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
						<!-- Block1 -->						
							<iframe width="100%" height="300px" src="https://www.youtube.com/embed/NQt_Mem-S6Y" title="과태료가 300만 원? 과태료 피하면서 캠핑하는 방법" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>						
					</div>
					
				</div>
			</div>
         </div>
	</section>
	
	
	
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

</body>
<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
<script>
	$(".js-select2").each(function() {
		$(this).select2({
			minimumResultsForSearch : 20,
			dropdownParent : $(this).next('.dropDownSelect2')
		});
	})
</script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
<script>
	$('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<script>
	$('.gallery-lb').each(function() { // the containers for all your galleries
		$(this).magnificPopup({
			delegate : 'a', // the selector for gallery item
			type : 'image',
			gallery : {
				enabled : true
			},
			mainClass : 'mfp-fade'
		});
	});
</script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		$(this).on('click', function() {
			swal(nameProduct, "is added to wishlist !", "success");

			$(this).addClass('js-addedwish-b2');
			$(this).off('click');
		});
	});

	$('.js-addwish-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().find(
						'.js-name-detail').html();

				$(this).on('click', function() {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});

	/*---------------------------------------------*/

	$('.js-addcart-detail').each(
			function() {
				var nameProduct = $(this).parent().parent().parent().parent()
						.find('.js-name-detail').html();
				$(this).on('click', function() {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
</script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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

<!-- 경고창 표시 -->
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg.length);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
</html>
