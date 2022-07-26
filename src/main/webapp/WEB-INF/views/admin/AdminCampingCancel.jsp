<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>AdminCamily</title>
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
						<h1 class="h3 mb-0 text-gray-800">관리자 캠핑용품 취소관리 페이지 - AdminCampingSendProduckt.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-10" style="margin:0 auto; ">
                        <div class="card-body" >
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable">
                                  <thead>
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">주문상품코드</th>
                                            <th class="align-middle text-center font-weight-bold">주문코드</th>
                                            <th class="align-middle text-center font-weight-bold">주문자아이디</th>
                                            <th class="align-middle text-center font-weight-bold">주문자일자</th>
                                            <th class="align-middle text-center font-weight-bold">정보</th>
                                            <th class="align-middle text-center font-weight-bold">주문자주소</th>
                                            <th class="align-middle text-center font-weight-bold">이름</th>
                                            <th class="align-middle text-center font-weight-bold">수량</th>
                                            <th class="align-middle text-center font-weight-bold">가격</th>
                                            <th class="align-middle text-center font-weight-bold">취소사유</th>
                                            <th class="align-middle text-center font-weight-bold">취소상태</th>
                                            <th class="align-middle text-center font-weight-bold">활성화상태</th>
                                        </tr>
                                   </thead>                                 
                                    <c:forEach items="${AdminCampingCancel}" var="CampingCancel">  
                                  <tbody>                      
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.gogcode }</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.gocode }</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.gomid }</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.godate }</th>
                                            <th class="align-middle text-center font-weight-bold">
                                            <img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${CampingCancel.goimage }" height="50px" style="text-align: center;">                                           
                                            </th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.gomaddr }</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.goname }</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.goamount }개</th>
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.goprice }원</th> 
                                            <th class="align-middle text-center font-weight-bold">${CampingCancel.gocancel }</th> 
                                            <th class="align-middle text-center font-weight-bold">       
                                                <button class="btn btn-danger p-2" onclick="cancelOk(this,'${CampingCancel.gocode }')">취소승인</button>
                                                <button class="btn btn-primary p-2" onclick="cancelNo(this,'${CampingCancel.gocode }')">취소거절</button>                                                                                                        
                                            </th> 
                                            <th class="align-middle text-center font-weight-bold">
                                            	<div id="${CampingCancel.gocode}">
                                                <c:if test="${CampingCancel.gostate == 7}">
                                                  <i class="fa-solid fa-check" style="font-size: 30px;"></i>
                                                </c:if>
                                            
                                                <c:if test="${CampingCancel.gostate == 9}">
                                                  <i class="fa-solid fa-ban" style="font-size: 30px;"></i>
                                                </c:if>
                                            	</div>
                                            </th>                                   
                                        </tr>
                                  </tbody>     
                                    </c:forEach>                                                                                                                          
                                </table>
                            </div>
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
function productmodify(thisVal, gcode){
	location.href = "productmodify?gcode="+gcode;
}
</script>

<!-- 취소승인 = STATE7 -->
<script type="text/javascript">
 function cancelOk(thisVal,gocode){
	console.log("thisVal :"+ thisVal);
	console.log("gocode :"+ gocode);
	
	$.ajax({
		type : "post",
		url : "cancelOk",
		data : {"gocode" : gocode },
		success : function(result){					      
		   if(result.length > 0){		
			   console.log(result);
			   $("#"+result).html("");
			   var output = '<i class="fa-solid fa-check" style="font-size: 30px;" id="sendCar"></i>';
			   $("#"+result).html(output);
	         //$("#sendCar").addClass("fa-solid fa-car-side");		   		  
		   }					   
		}
			
	});
	
}
</script>

<!-- 취소승인 거절 = STATE9 -->
<script type="text/javascript">
 function cancelNo(thisVal,gocode){
	console.log("thisVal :"+ thisVal);
	console.log("gocode :"+ gocode);
	
	$.ajax({
		type : "post",
		url : "cancelNo",
		data : {"gocode" : gocode },
		success : function(result){			
			   if(result.length > 0){		
			        console.log(result);
				      $("#"+result).html("");
				      var output = '<i class="fa-solid fa-ban" style="font-size: 30px;" id="sendCar"></i>';
				      $("#"+result).html(output);
		      }
	  }
	});
	
}
</script>		
</html>
