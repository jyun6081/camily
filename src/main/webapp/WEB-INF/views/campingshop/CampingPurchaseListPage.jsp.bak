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
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
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
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->
	
	<!-- breadcrumb 시작-->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				캠핑목록
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
                구매목록					
			</span>
		</div>
	</div>
	<!-- breadcrumb 끝-->

	<!-- Shoping Cart -->
	<div class="bg0 m-t-23 p-b-140" style="margin-top: 100px;">
		<div class="container">
			<div class="row">
				<div class="" >
					<div class="">
						<div class="wrap-table-shopping-cart">
						
                            <c:forEach items="${PurchaseList }" var="Purchase">
                            
							<table class="table-shopping-cart">
								<tr>
									<th colspan="7" style="font-weight: bold;">
										<div>주문번호 : ${Purchase.gocode}</div>
										<div>주문일자 : ${Purchase.godate}</div>
									</th>
								</tr>
								<tr class="table_head">
									<th class="column-1">상품정보</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">상품수량</th>
									<th class="column-5">총금액</th>
									<th class="column-6">주문주소</th>
									<th class="column-7"></th>
								</tr>
								<tr class="table_row" id="${Purchase.gocode}">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="${Purchase.goimage }" alt="IMG">
										</div>
									</td>
									<td class="column-2">${Purchase.goname }</td>
									<td class="column-3">${Purchase.goprice }</td>
									<td class="column-4">총 : ${Purchase.goamount }개</td>
									<td class="column-5">총 : ${Purchase.goprice}원</td> <!-- 총 가격 -->
									<td class="column-6">${Purchase.gomaddr }</td>
									<th class="column-7" > 
									<button style="margin-top: 100px"
									 class="flex-c-m stext-101 cl5 size-80 bg2 bor1 hov-btn1 p-lr-15 trans-04">후기</button>
									 <button style="margin-top: 100px" type="button"
									 onclick="deleteph(this,'${Purchase.gocode}')" class="flex-c-m stext-101 cl5 size-80 bg2 bor1 hov-btn1 p-lr-15 trans-04">삭제</button>
									</th>
								</tr>
							</table>
								</c:forEach>
						</div>
	
					</div>
				</div>

			</div>				
	<!-- Load more 시작 -->
	<div class="flex-c-m flex-w w-full p-t-45">
				<!-- Pagination 시작 -->
				<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
					<c:choose>
						<c:when test="${pageDto.page <= 1}">
							<span>[이전]</span>
						</c:when>
						<c:otherwise>
							<span><a href="CampingPurchaseListPage?page=${pageDto.page - 1}">[이전]</a></span>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
						<c:choose>
							<c:when test="${pageDto.page == num}">
								<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
							</c:when>
							<c:otherwise>
								<span><a href="CampingPurchaseListPage?page=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a></span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
							<span>[다음]</span>
						</c:when>
						<c:otherwise>
							<span><a href="CampingPurchaseListPage?page=${pageDto.page + 1}">[다음]</a></span>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Pagination 종료 -->
	          </div>	
	          <!-- Load more 종료 -->
			</div>
		</div>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>

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
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>

<script type="text/javascript">
 function deleteph(thisval,gocode){
	 console.log("thisval :"+ thisval);
	 console.log("gocode :"+ gocode);
	 
	 $.ajax({
			type : "get",
			url : "deleteph",
			data : { "gocode" :  gocode},
			success : function(result){					 
			 console.log("result :"+ result);
              if(result != null){				
                 alert("상품 삭제 성공!");	  
                 $("#"+gocode).prev().remove();
                 $("#"+gocode).remove(); 
              }else{
            	 alert("상품 삭제 실패!");
              }
			}
			
	 });
 }

</script>
		
</html>
