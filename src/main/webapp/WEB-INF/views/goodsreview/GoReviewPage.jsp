<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>캠핑용품 후기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
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
.fa-star{
    color:#f9ba48
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
	<section class="bg0 p-t-62 p-b-60" >
		<div class="container">
			<div class="row" >
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						<!-- item blog -->
						<div class="section-reply-title">
								<h5>캠핑용품 REVIEW </h5><h6>캠핑용품을 사용해보시고 후기를 남겨보세요.</h6>
						</div>
						<c:forEach items="${goodsReviewList }" var="gorvList"> 
						<div class="p-b-63">
							<%-- <span class="ltext-108 cl2 hov-cl1 trans-04">NO.${goods.gorvcode }</span> --%>
							<a href="goreviewdetailpage?gorvcode=${gorvList.gorvcode }" class="hov-img0 how-pos5-parent rounded">
								<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${gorvList.goimage }" alt="IMG">	
								
							</a>
	
							<div class="p-t-32">
								<!-- <h4 class="p-b-15">
								
									<a href="goreviewdetailpage" class="ltext-108 cl2 hov-cl1 trans-04">
										 
									
									</a>
								</h4> -->

								<p class="stext-117" style="color: black; font-weight: bolder;">
									제목 : ${gorvList.gorvtitle }
								</p>
								
								<p class="stext-117" style="color: black; font-weight: bolder;">
									제품명 : 🌈${gorvList.goname }🌈 									
								</p>
								
								<p class="mt-1"> 별점 : 
								   <c:if test="${gorvList.gorvstarating == 1 }">
								   <i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${gorvList.gorvstarating == 2 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${gorvList.gorvstarating == 3 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${gorvList.gorvstarating == 4 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${gorvList.gorvstarating == 5 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								</p>
								
								
								
								
								

								<div class="flex-w flex-sb-m p-t-18">
									<span class="flex-w flex-m stext-111 cl2 p-r-30 m-tb-10">
										<span>
											<span class="cl4"></span><i class="fa-regular fa-user"></i> ${gorvList.gorvmid } 
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>
										<span>
											<span class="cl4"></span><i class="fa-regular fa-calendar"></i> ${gorvList.gorvdate }
											<span class="cl12 m-l-4 m-r-6">|</span>
										</span>
										<span>
											<i class="fa-regular fa-eye"></i> 조회수 ${gorvList.gorvhits }
										</span>
									</span>
									<a href="goreviewdetailpage?gorvcode=${gorvList.gorvcode }" class="stext-101 cl2 hov-cl1 trans-04 m-tb-10">
										상세보기

										<i class="fa fa-long-arrow-right m-l-9"></i>
									</a>
								</div>
							</div>
						</div>
						</c:forEach> 		
						
						<!-- Pagination -->
						<div class="flex-l-m flex-w w-full p-t-10 m-lr--7">
							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">
								1
							</a>

							<a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7">
								2
							</a>

						
			
						</div>
					</div>	
				</div>
	
			</div>
		</div>
	</section>	
	
	<!-- footer -->	
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
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
	<script src="https://kit.fontawesome.com/d70fa0d402.js" crossorigin="anonymous"></script>
</body>
</html>