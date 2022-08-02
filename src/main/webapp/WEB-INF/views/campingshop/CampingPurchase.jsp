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
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
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
			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				상품구매
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
                ${campingpurchase.gname }
				
			</span>
		</div>
	</div>
	<!-- breadcrumb 끝-->

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" action="goodsPurchase" method="post" id="goodsform">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">상품정보</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">상품수량</th>
									<th class="column-5">총금액</th>
								</tr>

								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingpurchase.gimage }" alt="IMG">
										</div>
									</td>
									<td class="column-2">${campingpurchase.gname }</td>
									<td class="column-3">${campingpurchase.gprice }</td>
									<td class="column-4">${campingpurchase.gamount }개</td>
									<td class="column-5" >${campingpurchase.gformatter }원</td> <!-- 총 가격 -->
								</tr>
							</table>
						</div>

						
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							구매 정보
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									가격  :
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2">
									${campingpurchase.gprice } 원
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									배송기간  :
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
									결제후 2 ~ 5일 정도 소요될 예정입니다.
								</p>					
							</div>
						</div>
						
						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									주문 수량  :
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
								  ${campingpurchase.gamount }
								</p>					
							</div>
						</div>
						
						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									상품 소재  :
								</span>
							</div>

							<div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
								<p class="stext-111 cl6 p-t-2">
								  ${campingpurchase.gcontents }
								</p>					
							</div>
						</div>
						
						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									배송비  :
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
									 무료
								</span>
							</div>
						</div>	

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									총금액  :
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2">
								   ${campingpurchase.gformatter }원
								</span>
							</div>
						</div>	
												
					</div>
				</div>
			</div>
		</div>
						<!-- <div class="wrap-table-shopping-cart"> -->
							<table class="table-shopping-cart">
								<thead>
								<tr class="table_head">
									<th class="column-1">구매자아이디</th>
									<th class="column-2"> 
									<button type="button" class="cl0 size-60 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" 
									onclick="addCheck()">주소변경</button>&nbsp;&nbsp;&nbsp; 기본주소 :&nbsp;${addselect.maddr }</th>
									<th class="column-3"></th>
								</tr>
								</thead>
								
								<tbody>
								<tr class="table_row">
									<td class="column-1">${sessionScope.loginId }</td>
									<td class="column-2"><input value="${addselect.maddr }" readonly="readonly" id="newadd" class="size-209 p-r-18 p-r-0-sm w-full-ssm"></td>
									<td class="column-3">
									<button type="button"
									 onclick="requestPay('${campingpurchase.gcode}','${campingpurchase.gname }',${totalPrice},
									'${addselect.memail }','${addselect.mname }','${addselect.mtel }','${addselect.maddr }')"
									class="cl0 size-100 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">결제하기</button>
									<input type="hidden" name="loginId" value="${sessionScope.loginId }">
									<input type="hidden" name="addr" id="newdd" value="${addselect.maddr }">
									<input type="hidden" name="gogcode" value="${campingpurchase.gcode }">
									<input type="hidden" name="gamount" value="${campingpurchase.gamount }">
									<input type="hidden" name="totalPrice" value="${totalPrice}">
									<input type="hidden" name="gname" value="${campingpurchase.gname }">
									<input type="hidden" name="gimage" value="${campingpurchase.gimage }">
									</td>
								</tr>
								</tbody>
								
							</table>
						<!-- </div> -->
						
	<!-- Load more -->
	<div class="flex-c-m flex-w w-full p-t-45">
		<a href="#"
			class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
			위로가기(◦'⌣'◦)</a>
	</div>	
	</form>

    <!-- 주소확인 모달 시작 -->
    <div class="modal fade" id="addCheck" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1200">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width:50%">
						</a>
						
					</div>
					<div class="modal-body mx-3">

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="postcode"
									class="form-control validate" placeholder="우편번호" name="mpostcode">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_DaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="address"
								class="form-control validate" placeholder="주소" name="maddress">
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="detailAddress"
									class="form-control validate" placeholder="상세주소" name="mdetailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="extraAddress"
									class="form-control validate" placeholder="참고항목" name="mextraAddr">
							</div>
						</div>
						
						<div class="md-form mb-1 text-center">
							<button class="btn btn-dark" onclick="addChange()">주소 변경</button>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 주소확인 모달 끝 -->
    
	

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img
						src="${pageContext.request.contextPath}/resources/images/icons/icon-close.png"
						alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-01.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-01.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img
												src="${pageContext.request.contextPath}/resources/images/product-detail-03.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">상품이름 :</h4>

							<span class="mtext-106 cl2"> 상품가격 : </span>

							<p class="stext-102 cl3 p-t-23">상품설명 :</p>

							<!-- 모듈 창 -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">추가하기</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Red</option>
												<option>Blue</option>
												<option>White</option>
												<option>Grey</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>	
	<!--===============================================================================================-->
		
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script type="text/javascript">
var IMP = window.IMP;
IMP.init("imp10142481"); 
function requestPay(gcode,gname,total,memail,mname,mtel,maddr) {
	console.log("gcode :"+ gcode);
	console.log("gname :"+ gname);
	console.log("total :"+ total);
	console.log("memail :"+ memail);
	console.log("mname :"+ mname);
	console.log("mtel :"+ mtel);
	console.log("maddr :"+ maddr);	
	
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: gcode, 
        name: gname,
        amount: total,
        buyer_email: memail,
        buyer_name: mname,
        buyer_tel: mtel,
        buyer_addr: maddr
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("결제성공입니다.!!")
            //$("#goodsform").submit();
        } else {
        	alert("결제실패입니다.!!")
        	$("#goodsform").submit();
        }
    });/* function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            // jQuery로 HTTP 요청
            jQuery.ajax({
                url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
                method: "POST",
                headers: { "Content-Type": "application/json" },
                data: {
                    imp_uid: rsp.imp_uid,
                    merchant_uid: rsp.merchant_uid
                }
            }).done(function (data) {
              // 가맹점 서버 결제 API 성공시 로직
            })
          } else {
            alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          }
        }); */
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
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>

	<script type="text/javascript">
	   
		function addCheck(){
			$("#addCheck").modal('show');
		}
		
		</script>
		
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>	
		<!-- 다음 주소api -->
	<script>
		function sample6_DaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress")
									.focus();
						}
					}).open();
		}
	</script>		
		
	<script type="text/javascript">
	
	 function addChange(){
		 
		 var total = "";
		 
		 var postcode2 = $(postcode).val();
		 total = total +  "(" + postcode2 + ")"; 
		 var address2 = $(address).val();
		 total = total + " " +address2;
		 var detailAddress2 = $(detailAddress).val();
		 total = total + " " + detailAddress2;
         var extraAddress2 = $(extraAddress).val();
         total = total + " " + extraAddress2;
         
		 console.log("postcode2 :"+ postcode2);
		 console.log("address2 :"+ address2);
		 console.log("detailAddress2 :"+ detailAddress2);
		 console.log("extraAddress :"+ extraAddress);
		 console.log("total :"+ total);
		 
		 $(newadd).val(total);
		 $(newdd).val(total);
		 $("#addCheck").modal("hide");
		 	
	 }
	</script>
</html>