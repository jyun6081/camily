<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<style type="text/css">
.section-reply-title {
	/* margin-bottom: 30px; */
    text-align: center;
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
</style>

</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->

	<!-- Shoping Cart -->
	<form class="bg0 p-t-35 p-b-85" action="totalpurchase" method="post" id="goobsform">
			          <div class="section-reply-title">
								<h5>장바구니🛒</h5><h6>구매하고싶은 상품 여러개를 장바구니에 넣어보세요!</h6>
						</div>
			          <c:forEach items="${detailinformation }" var="information">
		                <div class="col-9" style="padding-top: 30px; margin: auto; font-family: Poppins-Bold;">
                        <div class="bg-light rounded p-4">                       
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr >
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">상품정보</th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">구매상품명</th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">상품가격</th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">상품수량</th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">총금액</th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;">주문주소
                                            <button type="button" class="cl0 size-60 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick="addCheck('${information.dicode}')">주소변경</button>
                                            </th>
                                            <th class="align-middle text-center font-weight-bold" style="border-top : none;"></th> 
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold"><img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${information.diimage }" alt="IMG" style="width: 60px;"></th>
                                            <td class="align-middle text-center font-weight-bold" style = "word-break: break-all">${information.diname }</td>
                                            <td class="align-middle text-center font-weight-bold">${information.diprice }원</td>
                                            <td class="align-middle text-center font-weight-bold">${information.diamount }개</td>
                                            <td class="align-middle text-center font-weight-bold">${information.ditotalprice }원</td>
                                            <td id="${information.dicode}1" class="align-middle text-center font-weight-bold">${information.diaddr }</td>
                                           	<td class="align-middle text-center font-weight-bold"><a href="deletepoket?dicode=${information.dicode }" class="btn btn-dark">삭제</a></td>
                                           	<th>
										 	<input type="hidden" value="${sessionScope.loginId }"     name="dimid">
									 		<input type="hidden" value="${information.diaddr }" id="${information.dicode}2" name="diaddr">
									 		<input type="hidden" value="${information.dicode }"       name="dicode">
									 		<input type="hidden" value="${information.diamount }"     name="diamount">
									 		<input type="hidden" value="${information.ditotalprice }" name="ditotalprice" id="ditotal">
									 		<input type="hidden" value="${information.diname }"       name="diname" id="diname">
									 		<input type="hidden" value="${information.diimage }"      name="diimage">
											</th>
									     </tr>  
									                                                                
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>

                    </c:forEach>			        
		                 
    <!-- Load more --> 
	<div class="flex-c-m flex-w w-full p-t-45" >
		<button class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" type="button" 
		onclick="requestPay()">주문하기</button>
	</div>	
			       		          
	                 <c:if test="${fn:length(detailinformation) == 0}">
									<p style="text-align: center;">장바구니 내역이 존재하지않습니다!</p>
								</c:if>     
	<!-- Load more -->
		

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
						<input type="hidden" id = checkdicode>
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
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>

	<script type="text/javascript">
		function addCheck(dicode){
			$("#checkdicode").val(dicode);
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
		
		 var dicode = $("#checkdicode").val();
		 console.log(dicode);
		 console.log(dicode + "1");
		 console.log(dicode + "2");
		 
		 $("#"+dicode+"1").text(total);
		 $("#"+dicode+"2").val(total);
		 $("#addCheck").modal("hide");
		 
		
	 }	
</script>
	
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<!-- 이니시스 결제창 -->
<script type="text/javascript">
var IMP = window.IMP;
IMP.init("imp10142481"); 
function requestPay() {
	var ditotal = $("#ditotal").val();
	var diname = $("#diname").val();
	
	console.log("ditotal :"+ ditotal);
	console.log("diname :"+ diname);
	
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        name: diname,
        amount: ditotal
    }, function (rsp) { // callback
        if (rsp.success) {
            alert("결제성공입니다.");
            //$("#goobsform").submit();
        } else {
        	alert("결제실패입니다.");
        	//$("#goobsform").submit();
        }
    });	
}
</script>
	
</html>
