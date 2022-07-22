<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin | Camily</title>
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
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->

	<!-- <!-- Shoping Cart -->
		<!-- <div class="container">
			<div class="row">
				<div class="" >
					<div class="">
						<div class="wrap-table-shopping-cart">
						
                            
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">상품정보</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">상품수량</th>
									<th class="column-5">총금액</th>
									<th class="column-6">주문주소</th>
									<th class="column-7"></th>
								</tr>
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
										</div>
									</td>
									<td class="column-2"></td>
									<td class="column-3"></td>
									<td class="column-4">개</td>
									<td class="column-5">원</td> 
									<td class="column-6"></td>
									<th class="column-7" > 
									</th>
								</tr>
							</table>
						</div>
	
					</div>
				</div>

			</div>
		</div>		 -->
 
		
	<section class="section-slide" style="margin-top: 100px;">
					<!-- Page Heading -->
				

					<!-- Content Row -->
					<div class="row" style="margin:0 auto; ">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4" style="margin:0 auto; ">
						<h1 class="h3 mb-0 text-gray-800">관리자 캠핑관리 페이지 - AdminCamping.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-10" style="margin:0 auto; ">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">캠핑장 리스트</h6>
                        </div>
                        <div class="card-body" >
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="align-middle text-center font-weight-bold" style="min-width: 110px; height: 55px;">캠핑장 코드</th>
                                            <th class="align-middle text-center font-weight-bold">캠핑장 이름</th>
                                            <th class="align-middle text-center font-weight-bold">캠핑장 유형</th>
                                            <th></th>  
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th></th>
                                            <th class="align-middle text-center font-weight-bold" style="min-width: 110px; height: 55px;">캠핑장 코드</th>
                                            <th class="align-middle text-center font-weight-bold">캠핑장 이름</th>
                                            <th class="align-middle text-center font-weight-bold">캠핑장 유형</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                   <c:forEach items="${campingList }" var="cpList">
                                     <c:set var="campIMG" value="${cpList.caimage}" />
                                     
                                    <tr>
                                        <td class="align-middle text-center">
                                        <c:choose>
                                        	<c:when test="${fn:substring(campIMG,0,4) == 'http'}">
                                        	  <img src="${cpList.caimage }" height="50px"> 
                                        	</c:when>
                                        	<c:otherwise>
                                              <img src="${pageContext.request.contextPath}/resources/caimageUpload/${cpList.caimage }" height="50px"> 
                                        	</c:otherwise>
                                        </c:choose>
                                        </td>
                                        <td class="align-middle text-center font-weight-bold">${cpList.cacode }</td>
                                        <td class="align-middle text-center font-weight-bold"> <a href="adminCampingInfo?cacode=${cpList.cacode }">${cpList.caname }</a></td>
                                        <td class="align-middle text-center font-weight-bold">${cpList.catype }</td>
                                        <td class="align-middle text-center"> 
                                        <c:choose>
                                         <c:when test="${cpList.castate == 1}" >
                                           <button class="btn btn-info" type="button" onclick="modifyCampingState(this,'${cpList.cacode}')">이용가능</button>
                                         </c:when>
                                        
                                         <c:otherwise>
                                           <button class="btn btn-danger" type="button" onclick="modifyCampingState(this,'${cpList.cacode}')">이용정지</button>
                                         </c:otherwise>
                                        
                                        </c:choose>
                                        
                                        
                                        
                                        
                                        </td>
                                    </tr>
                                   </c:forEach>
                                          
                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>	
                    </div>	
                    
				<!-- Pagination 시작 -->
				<div class="flex-c-m flex-w w-full p-t-45" style="margin-bottom: 50px ">
					<c:choose>
						<c:when test="${pageDto.page <= 1}">
							<span>[이전]</span>
						</c:when>
						<c:otherwise>
							<span><a href="adminCamping?page=${pageDto.page - 1}">[이전]</a></span>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
						<c:choose>
							<c:when test="${pageDto.page == num}">
								<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
							</c:when>
							<c:otherwise>
								<span><a href="adminCamping?page=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a></span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
							<span>[다음]</span>
						</c:when>
						<c:otherwise>
							<span><a href="adminCamping?page=${pageDto.page + 1}">[다음]</a></span>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- Pagination 종료 -->
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
     function modifyCampingState(btnObj,cacode){
    	 
    	 if( $(btnObj).hasClass("btn-info") ){
    		 var castate = '0';
    	 } else if ( $(btnObj).hasClass("btn-danger") ){
    		 var castate = '1';
    	 }
    	 console.log(castate);
    	 $.ajax({
    		 type : "get",
    		 url : "modifyCampingState",
    		 data : {"cacode" : cacode, "castate" : castate},
    		 success : function(result){
    			 if(result == 1){
    					$(btnObj).toggleClass("btn-info");
    					$(btnObj).toggleClass("btn-danger");
    					
    					if( castate == '0'){
    						$(btnObj).text("이용정지")
    					} else if (castate == '1'){
    						$(btnObj).text("이용가능")
    					}
    			 }
    			 
    		 }
    		 
    		 
    	 })
    	 
    	 
     }





</script>

		
</html>
