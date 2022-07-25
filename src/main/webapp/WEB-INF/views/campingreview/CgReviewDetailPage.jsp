<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>캠핑장 상세보기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png"/>
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

<script src="https://kit.fontawesome.com/d70fa0d402.js" crossorigin="anonymous"></script>
<style type="text/css">
#bobtn {
	text-align: right;
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
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">
						
						<h4 class="ltext-109 cl2 p-b-28">
								제목 : ${CampingReview.cgrvtitle } 
							</h4>
						
							
						
						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19">
								<span>
									<span class="cl4"></span><i class="fa-regular fa-user"></i> ${CampingReview.cgrvmid }  
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>

								<span>
									<i class="fa-regular fa-calendar"></i> ${CampingReview.cgrvdate }
									<span class="cl12 m-l-4 m-r-6">|</span>
								</span>
								<span> <i class="fa-regular fa-eye"></i> 조회수 ${CampingReview.cgrvhits }</span>
							</span>	
							
							<p class="stext-116 cl4">
								제품명 : ${CampingReview.recrname}
							</p>
							
							<p class="mt-1"> 별점 : 
								   <c:if test="${CampingReview.cgstarating == 1 }">
								   <i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${CampingReview.cgstarating == 2 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${CampingReview.cgstarating == 3 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${CampingReview.cgstarating == 4 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								   <c:if test="${CampingReview.cgstarating == 5 }">
								   <i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i>
								   </c:if>
								</p>
							
							
							
							
							
							
							
							
							<div>					
							<p class="stext-115 p-b-26" style="color: black;">
								${CampingReview.cgrvcontents }
							
							</p>
							</div>	
							<div id="bobtn">
								<a class="btn btn-success" href="cgreviewpage">목록</a> 
							<c:if test="${sessionScope.loginId == CampingReview.cgrvmid || sessionScope.loginId  == 'admin'}">
								<a class="btn btn-info" href="cgReviewModify?cgrvcode=${CampingReview.cgrvcode }">수정</a> 
								<a class="btn btn-danger" href="cgReviewDelete?cgrvcode=${CampingReview.cgrvcode }">삭제</a>
							</c:if>				
							</div>
						</div>

						

						<!--  -->
						
					</div>
				</div>
			  </div>
			</div>
	</section>	
	
		

	<!-- Footer -->
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
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>
</body>
</html>