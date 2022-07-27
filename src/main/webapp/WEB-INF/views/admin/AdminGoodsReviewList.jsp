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
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
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
	href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->
			
	<section class="section-slide" style="margin-top: 100px;">
					<!-- Page Heading -->
			
					<!-- Content Row -->
					<div class="row" style="margin:0 auto; ">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4" style="margin:0 auto; ">
						<h1 class="h3 mb-0 text-gray-800">관리자 캠핑용품 리뷰관리 페이지 - AdminGoodsReviewList.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-10" style="margin:0 auto; ">
                        <div class="card-body" >
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                  <thead>
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">리뷰코드</th>
                                            <th class="align-middle text-center font-weight-bold">작성자</th>
                                            <th class="align-middle text-center font-weight-bold">리뷰쓴 상품코드</th>
                                            <th class="align-middle text-center font-weight-bold">리뷰 제목</th>
                                            <th class="align-middle text-center font-weight-bold">작성일</th>
                                            <th class="align-middle text-center font-weight-bold">리뷰상태</th>
                                        </tr>
                                   </thead>                                 
                                    <c:forEach items="${adminGoodsReviewList}" var="GoReviewList">  
                                  <tbody>                      
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">${GoReviewList.gorvcode }</th>
                                            <th class="align-middle text-center font-weight-bold">
                                            ${GoReviewList.gorvmid }                                           
                                            </th>
                                            <th class="align-middle text-center font-weight-bold">                                       
	                                           <a href="campingDetailPage?gcode=${GoReviewList.gorvgcode }">${GoReviewList.gorvgcode }</a>                                              		
                                            </th>
                                            <th class="align-middle text-center font-weight-bold">
                                            <c:if test="${GoReviewList.gorvstate == 0 }">
	                                            			${GoReviewList.gorvtitle }
	                                            		</c:if>
	                                            		<c:if test="${GoReviewList.gorvstate == 1 }">
	                                            			<a href="goreviewdetailpage?gorvcode=${GoReviewList.gorvcode }">${GoReviewList.gorvtitle }</a>
	                                            		</c:if>	
	                                        </th>    		
                                            <th class="align-middle text-center font-weight-bold">${GoReviewList.gorvdate }</th>                                            
                                            
                                            <th class="align-middle text-center font-weight-bold">
                                            			<c:choose>
                                            			<c:when test="${GoReviewList.gorvstate == 0 }">
	                                            			<button  class="btn btn-danger font-weight-bold" onclick="modifyGoodsReviewState(this,'${GoReviewList.gorvcode }')">정지</button>
	                                            		</c:when>
	                                            		<c:otherwise>
	                                            			<button class="btn btn-primary font-weight-bold" onclick="modifyGoodsReviewState(this,'${GoReviewList.gorvcode }')">사용</button>
	                                            		</c:otherwise>
                                            			</c:choose>
                                            </th>
                                        </tr>
                                  </tbody>     
                                    </c:forEach>                                                                                                                          
                                </table>
                            </div>
                            <!-- Pagination 시작 -->
								<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
									<c:choose>
										<c:when test="${pageDto.page <= 1}">
											<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-left"></i></span>
										</c:when>
										<c:otherwise>
											<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><a href="adminboardList?page=${pageDto.page - 1}"><i class="fa-solid fa-angle-left"></i></a></span>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
										<c:choose>
											<c:when test="${pageDto.page == num}">
												<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
											</c:when>
											<c:otherwise>
												<span><a href="adminboardList?page=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a></span>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
											<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-right"></i></span>
										</c:when>
										<c:otherwise>
											<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><a href="adminboardList?page=${pageDto.page + 1}"><i class="fa-solid fa-angle-right"></i></a></span>
										</c:otherwise>
									</c:choose>
								</div>
							<!-- Pagination 종료 -->
                        </div>
                       </div>	
                     </div>	
                   </section>
                   
                  
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

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
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/slick/slick.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/parallax100/parallax100.js"></script>
	<script>
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script
		src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
				function() {
					var nameProduct = $(this).parent().parent().find(
							'.js-name-b2').html();
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
					var nameProduct = $(this).parent().parent().parent()
							.parent().find('.js-name-detail').html();
					$(this).on('click', function() {
						swal(nameProduct, "is added to cart !", "success");
					});
				});
	</script>
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
</body>
<script type="text/javascript">
     function modifyGoodsReviewState(btnObj,gorvcode){
    	 
    	 if( $(btnObj).hasClass("btn-primary") ){
    		 var gorvstate = '0';
    	 } else if ( $(btnObj).hasClass("btn-danger") ){
    		 var gorvstate = '1';
    	 }
    	 console.log("gorvstate : " + gorvstate);
    	 $.ajax({
    		 type : "get",
    		 url : "modifyGoodsReviewState",
    		 data : {"gorvcode" : gorvcode, "gorvstate" : gorvstate},
    		 success : function(result){
    			 if(result == 1){
    					$(btnObj).toggleClass("btn-primary");
    					$(btnObj).toggleClass("btn-danger");
    					
    					if( gorvstate == '0'){
    						$(btnObj).text("정지")
    					} else if (gorvstate == '1'){
    						$(btnObj).text("사용")
    					}
    			 }
    			 
    		 }
    		 
    		 
    	 })
    	 
    	 
     }





</script>
	

		
</html>
