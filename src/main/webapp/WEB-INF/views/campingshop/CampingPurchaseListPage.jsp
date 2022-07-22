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

<style type="text/css">
.section-reply-title {
	/* margin-bottom: 30px; */
	padding-top: 40px;
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

#aaa{
	font-weight: bold;




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
						<div class="section-reply-title">
								<h5>구매목록🚚</h5><h6>상품 정보나 배송상태를 확인하세요!</h6>
						</div>
						<c:forEach items="${PurchaseList }" var="Purchase">
						<div class="col-9" style="padding-top: 30px; margin: auto; font-family: Poppins-Bold;">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="d-flex justify-content-between">
	                            <div class="mb-4">주문번호 : ${Purchase.gocode}</div>
	                            <div class="mb-4" style="text-align: end;">주문일자 : ${Purchase.godate}</div>
                            </div>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">상품정보</th>
                                            <th scope="col">구매상품명</th>
                                            <th scope="col">상품가격</th>
                                            <th scope="col">상품수량</th>
                                            <th scope="col">총금액</th>
                                            <th scope="col">주문주소</th>
                                            <th scope="col">상품상태</th>
                                            <th scope="col"></th>                                         									 								
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${Purchase.goimage }" alt="IMG" style="width: 60px;"></th>
                                            <td>${Purchase.goname }</td>
                                            <td>${Purchase.goprice }원</td>
                                            <td>${Purchase.goamount }개</td>
                                            <td>${Purchase.goprice}원</td>
                                            <td>${Purchase.gomaddr }</td>
                                            <td id="aaa">
                                      <c:if test="${Purchase.gostate == 2 }">
									  <p>배송준비중</p>								    
								      <button type="button" class="btn btn-dark" onclick="PurchaseDelete('${Purchase.gocode }')">주문취소</button>
								    </c:if>
								    
								    <c:if test="${Purchase.gostate == 3 }">
									  <p>배송중</p>				
									  <button type="button" class="btn btn-dark" onclick="PurchaseCancel()">취소문의</button>	
									  <input type="hidden" value="${Purchase.gocode }" id="cancelGocode">			    
								    </c:if>
								    
								    <c:if test="${Purchase.gostate == 4 }">
									  <p>배송완료</p>
									 	<button style="margin-top: 100px" type="button" onclick="phDecide('${Purchase.gocode}')"
									    class="btn btn-dark">구매확정</button>															  															    
								    </c:if>
								     
								    <c:if test="${Purchase.gostate == 5 }">
									  <p>구매완료</p>								    
									     <a href="cgWrite?image=${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${Purchase.goimage }&gogcode=${Purchase.gogcode}&gocode=${Purchase.gocode }"
									     class="btn btn-dark">후기</a>	
								    </c:if>
								     
								    <c:if test="${Purchase.gostate == 6 }">
									  <p>취소처리중</p>				
									</c:if>
								     
								    <c:if test="${Purchase.gostate == 7 }">
									  <p style="font-color : red;">취소완료</p>				
									</c:if>
									
								    <c:if test="${Purchase.gostate == 9 }">
									  <p style="font-color : red;">취소거절 관리자 1대1 문의 바람</p>				
									</c:if>
									
									</td>
									<td>				 
								     <button type="button"
									 onclick="deleteph(this,'${Purchase.gocode}','${Purchase.gostate }')" class="btn btn-dark">구매목록삭제</button></td>
                                        </tr>                                                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    
                
                    </c:forEach>
                    					
	<!-- 배송중 주문취소 모달 -->
	<div class="modal fade" id="PurchaseCancelModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 1200">
		<div class="modal-dialog" role="document">
			
				<div class="modal-content">
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width: 35%">
						</a>
					</div>
						<select id="cancelreason" class="">
							<option value="">취소사유를 선택해주세요</option>
							<option value="구매 의사 취소" class="">구매의사취소</option>							
							<option value="다른 상품 잘못 주문" class="">다른 상품 잘못 주문</option>
							<option value="서비스 불만족" class="">서비스 불만족</option>
							<option value="상품정보 상이" class="">상품정보 상이</option>
						</select>
						<button style="margin-top: 100px" class="btn btn-dark" onclick="cancelreasonput()">주문취소요청</button>
				</div>
		</div>
	</div>
	<!-- 배송중 주문취소 모달 끝 -->
								
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
 function deleteph(thisval,gocode,gostate){
	 console.log("thisval :"+ thisval);
	 console.log("gocode :"+ gocode);
	 console.log("gostate :"+ gostate);
	 location.href="deleteph?gocode="+gocode+"&gostate="+gostate;
	 
/* 	 $.ajax({
			type : "get",
			url : "deleteph",
			data : { "gocode" :  gocode, "gostate" : gostate},
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
			
	 }); */
 }
</script>

<!-- 주문취소 -->
<script type="text/javascript">
function PurchaseDelete(gocode){
	 console.log("gocode :"+ gocode);
	 location.href="PurchaseDelete?gocode="+gocode;
}
</script>	

<!-- 구매확정 누르기 STATE = 5 -->
<script type="text/javascript">
function phDecide(gocode){
	var phDecide_Check = confirm("구매확정하겠습니까?");
	location.href="phDecide?gocode="+gocode;
}
</script>

<!-- 구매취소 모달 -->
<script type="text/javascript">
function PurchaseCancel(){
			$("#PurchaseCancelModal").modal('show');
		}
</script>

<!-- 취소요청 -->
<script type="text/javascript">
function cancelreasonput(){
	var cancelGocode = $("#cancelGocode").val();  // 취소할코드
	var cancelreason = $("#cancelreason").val(); // 취소사유
	
	console.log("cancelGocode :"+ cancelGocode);
	console.log("cancelreason :"+ cancelreason);
	
	location.href="cancelreasonput?gocode="+cancelGocode+"&gocancel="+cancelreason;
}
</script>
</html>
