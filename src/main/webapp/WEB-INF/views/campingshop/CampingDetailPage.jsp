<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Camily</title>
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
<!--===============================================================================================-->

</head>
<body class="animsition">

    <!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->
	
	<!-- breadcrumb 시작 -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				전체메뉴
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<a href="#" class="stext-109 cl8 hov-cl1 trans-04">
				${campingDetail.gcategory }
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
			    ${campingDetail.gname }
			</span>
		</div>
	</div>
	<!-- breadcrumb 끝 -->
	
	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
							  
								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gimage }" alt="IMG-PRODUCT" style="border-radius: 20px;">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gimage }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gsideimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gsideimage }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gsideimage }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gbackimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gbackimage }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gbackimage }">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-5 p-b-30">
				 <div class="p-r-50 p-t-5 p-lr-0-lg">
			
						<h4 class="mtext-105 cl2 js-name-detail p-b-14" style="display: inline-block;">
						   ${campingDetail.gname }
						</h4>
						<button type="button" onclick="kakaoshare(
									'${campingDetail.gcompanyname}','${campingDetail.gname }','${campingDetail.gprice }','${campingDetail.gimage }',
									'${campingDetail.gcontents }','${campingDetail.gcategory }')" style="float: right;">
								       <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 75%;">
						</button>
						<div class="mtext-106 cl2">
						 <c:choose>
						  <c:when test="${campingDetail.gstate == 0}">
						    해당상품은 임시 비활성화 상품입니다.
						  </c:when>
	                       
	                      <c:otherwise>
					        ${campingDetail.gprice }원 	                      
	                      </c:otherwise>					 
						 </c:choose>
						</div>

						<p class="stext-102 cl3 p-t-23">
							이 제품은 케밀리 전용 제품입니다.
						</p>
						
						<!-- 구매페이지 전송 -->
					    <form action="campingpurchase" method="post">
                        <input type="hidden" name="gcode" value="${campingDetail.gcode }">                            
						<div class="p-t-30">
							<div class="flex-w p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>
										<input class="mtext-104 cl3 txt-center num-product" type="number" name="gamount" readonly="readonly" value="1" id="diamoubt" min="1" max="5">
										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</div>
									</div>
                             <div class="row">                                                               
                               	<c:choose>
						           <c:when test="${campingDetail.gstate == 0}">
						                 <input class="mtext-104 cl3 txt-center num-product" readonly="readonly" value="점검중입니다.">
						           </c:when>
	                       
	                              <c:otherwise>
                                 	<div class="col-6">
									<button style="border-radius: 10px;" class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn1 p-lr-15 trans-04">
								        구매하기
									</button>
                                    </div>
                                 
                                    <div class="col-6">
                                    <button type="button"  style="border-radius: 10px;" class="flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn1 p-lr-15 trans-04" 
                                            onclick="shoppingbasket('${campingDetail.gcode }','${campingDetail.gname }','${campingDetail.gimage }',
                                            '${campingDetail.gprice }')">
								        장바구니
								    </button>									
                                    </div>	                                                        
	                             </c:otherwise>					 
						       </c:choose>
                                    
						    </div>	
						</div>
					 </form>
					</div>
				</div>
			</div>


			<div class="bor10 m-t-50 p-t-43 p-b-40 text-center">
			<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/${campingDetail.gdetailimage }" alt="" >
			</div>

		</div>
	</section>


	<div class="row">
		<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
			<h3 style="text-align: center">문의하기</h3>
			<div class="p-b-30 m-lr-15-sm">
				<div id="goodsQnAList_div">
					<!-- 캠핑장 문의 -->
					<c:forEach items="${goodsQuestionList}" var="goodsQuestionInfo">
						<div class="p-b-68" id="${goodsQuestionInfo.gqcode}">
							<c:choose>
								<c:when test="${goodsQuestionInfo.gqstate != 0}">
									<!-- 캠핑장 문의글 -->
									<div id="${goodsQuestionInfo.gqcode}_question">
										<div class="flex-w flex-sb-m">
											<span class="mtext-107 cl2 p-r-20" id="questionId">
												${goodsQuestionInfo.gqmid}
											</span>
											<c:if test="${goodsQuestionInfo.gqmid == sessionScope.loginId}">
												<span id="${goodsQuestionInfo.gqcode}_qustionBtn">
													<button class="btn btn-success m-r-10" onclick="modifyGoodsQuestionForm('${goodsQuestionInfo.gqcode}')">수정</button>
													<button type="button" class="btn btn-danger" onclick="deleteGoodsQuestion('${goodsQuestionInfo.gqcode}', '${goodsQuestionInfo.gqgcode}')">삭제</button>
												</span>
											</c:if>
										</div>
										<div class="p-b-17" style="font-size: 12px;">${goodsQuestionInfo.gqdate}</div>
										<textarea class="stext-102 cl6 autoTextarea" id="${goodsQuestionInfo.gqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">${goodsQuestionInfo.gqcontents}</textarea>
									</div>
									<!-- 답글 -->
									<div id="${goodsQuestionInfo.gqcode}_answer">
										<c:if test="${goodsQuestionInfo.gwcode != null}">
											<div class="flex-w flex-t">
												<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">
													<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>
												</div>
												<div class="size-207">
													<div class="flex-w flex-sb-m">
														<span class="mtext-107 cl2 p-r-20">
															Camily
														</span>
													</div>
													<div class="p-b-17" style="font-size: 12px;">${goodsQuestionInfo.gwdate}</div>
													<textarea class="stext-102 cl6 autoTextarea" id="${goodsQuestionInfo.gwcode}_answerForm" name="answer" style="width: 100%; resize: none;" readonly="readonly">${goodsQuestionInfo.gwcontents}</textarea>
												</div>
											</div>
										</c:if>
									</div>
								</c:when>
								<c:otherwise>
									<div id="${goodsQuestionInfo.gqcode}_question">
										<div class="flex-w flex-sb-m">
											<span class="mtext-107 cl2 p-r-20" id="questionId">
												${goodsQuestionInfo.gqmid}
											</span>
										</div>
										<div class="p-b-17" style="font-size: 12px;">${goodsQuestionInfo.gqdate}</div>
										<textarea class="stext-102 cl6 autoTextarea" id="${goodsQuestionInfo.gqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</c:forEach>
				</div>
				<!-- Pagination 시작 -->
				<div id="pageQnA" class="flex-c-m flex-w w-full p-t-45">
					<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
						<c:choose>
							<c:when test="${pageDto.page <= 1}">
								<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-left"></i></span>
							</c:when>
							<c:otherwise>
								<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="prevPage('${pageDto.page}', '${campingDetail.gcode }', '${pageDto.maxPage}', '${pageDto.startPage}', '${pageDto.endPage}')" style="cursor: pointer;"><i class="fa-solid fa-angle-left"></i></span>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
							<c:choose>
								<c:when test="${pageDto.page == num}">
									<span><a href="#tabList" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
								</c:when>
								<c:otherwise>
									<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="selPage('${num}', '${campingDetail.gcode }', '${pageDto.maxPage}', '${pageDto.startPage}', '${pageDto.endPage}')" style="cursor: pointer;">${num}</span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
								<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-right"></i></span>
							</c:when>
							<c:otherwise>
								<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="nextPage('${pageDto.page}', '${campingDetail.gcode }', '${pageDto.maxPage}', '${pageDto.startPage}', '${pageDto.endPage}')" style="cursor: pointer;"><i class="fa-solid fa-angle-right"></i></span>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!-- Pagination 종료 -->
				<c:if test="${sessionScope.loginId != null}">
					<!-- 문의글 작성하기 -->
					<form action="goodsQuestionWrite" id="gqform">
						<input type="hidden" id="gqmid" name="gqmid"
							value="${sessionScope.loginId}"> <input type="hidden"
							name="gqgcode" value="${campingDetail.gcode}">
						<div class="row p-b-25">
							<div class="col-12 p-b-5">
								<label class="stext-102 cl3" for="review">문의글 작성</label>
								<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10"
									id="cqcontents" name="gqcontents" style="resize: none;"></textarea>
							</div>
						</div>
						<button type="button"
							class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10"
							onclick="cqsubmit();">작성</button>
					</form>
				</c:if>
			</div>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
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

<!-- 카카오톡 공유하기 api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
try {
 function kakaoshare(gcompanyname,gname,gprice,gimage,gcontents,gcategory,gcode){
	 console.log("gcompanyname :"+ gcompanyname);	
	 console.log("gname :"+ gname);	
	 console.log("gprice :"+ gprice);	
	 console.log("gimage :"+ gimage);	
	 console.log("gcontents :"+ gcontents);	
	 console.log("gcategory :"+ gcategory);	
	 console.log("gcode :"+ gcode);
	 Kakao.init('ff44da0c10c3fe434ba307170a916ce5')
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: gname,
	        description: gcompanyname+"#"+gprice,
	        imageUrl:
	        	gimage,
	        link: {
	          mobileWebUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	          webUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	        },
	      },
	      social: {
	        likeCount: 286,
	        commentCount: 45,
	        sharedCount: 845,
	      },
	      buttons: [
	        {
	          title: '웹으로 보기',
	          link: {
	            mobileWebUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	            webUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	          },
	        },
	        {
	          title: '앱으로 보기',
	          link: {
	            mobileWebUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	            webUrl:'http://121.65.47.77:7779/controller/campingDetailPage?gcode='+gcode,
	          },
	        },
	      ],
	    })
	  }
	; window.kakaoDemoCallback && window.kakaoDemoCallback() }
	catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
	</script>
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
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
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

</body>

<script type="text/javascript">
function shoppingbasket(dicode,diname,diimage,diprice){
	var diamount = "";
	diamount = $("#diamoubt").val();
	
	console.log("diamout :"+ diamount);
	console.log("dicode :"+ dicode);
	console.log("diname :"+ diname);
	console.log("diimage :"+ diimage);
	console.log("diprice :"+ diprice);
	if( diamount != 0 ){
	location.href="shoppingbasket?dicode="+dicode+"&diname="+diname+"&diimage="+diimage+"&diamount="+diamount+"&diprice="+diprice;
	} else {
		alert("(재고수량확인)제품은 하나 이상 구매하셔야 합니다.")
	}
}
</script>
<script type="text/javascript">
	function cqsubmit() {
		if ($("#gqmid").val().length > 0) {
			$("#gqform").submit();
		} else {
			alert("로그인후 이용 바랍니다.");
			memberLogin();
		}
	}

	function modifyGoodsQuestionForm(gqcode) {
		console.log("수정 하기");
		$("#" + gqcode + "_questionContents").removeAttr("readonly");
		$("#" + gqcode + "_questionContents").addClass(
				"size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");
		var output = "";
		output += '<button class="btn btn-primary m-r-10" onclick="modifyGoodsQuestion(\''
				+ gqcode + '\')">확인</button>';
		output += '<button class="btn btn-danger" onclick="cancelGoodsQuestion(\''
				+ gqcode + '\')">취소</button>'
		$("#" + gqcode + "_qustionBtn").html(output);

	}

	function cancelGoodsQuestion(gqcode) {
		console.log("수정 취소");
		$("#" + gqcode + "_questionContents").attr("readonly", "readonly");
		$("#" + gqcode + "_questionContents").removeClass(
				"size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");
		var output = "";
		output += '<button class="btn btn-success m-r-10" onclick="modifyGoodsQuestionForm(\''
				+ gqcode + '\')">수정</button>';
		output += '<button class="btn btn-danger" onclick="deleteGoodsQuestion(\''
				+ gqcode + '\')">삭제</button>';
		$("#" + gqcode + "_qustionBtn").html(output);
	}

	function modifyGoodsQuestion(gqcode) {
		var gqcontents = $("#" + gqcode + "_questionContents").val();
		console.log("cqcode : " + gqcode);
		console.log("cqcontents : " + gqcontents);
		$.ajax({
			type : "get",
			url : "goodsQuestionModify",
			data : {"gqcode" : gqcode, "gqcontents" : gqcontents},
			dataType : "json",
			async : false,
			success : function(result) {
			console.log(result);
			if (result != "NG") {
				alert("수정되었습니다.");
				$("#" + gqcode + "_questionContents").val(result.gqcontents);
				$("#" + gqcode + "_questionContents").attr("readonly", "readonly");
				$("#" + gqcode + "_questionContents").removeClass("size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");
				var output = "";
				output += '<button class="btn btn-success m-r-10" onclick="modifyQuestionForm(\'' + gqcode + '\')">수정</button>';
				output += '<button class="btn btn-danger" onclick="deleteGoodsQuestion(\'' + gqcode + '\')">삭제</button>';
				$("#" + gqcode + "_qustionBtn").html(output);
			}
			}
		});
				

	}

	function deleteGoodsQuestion(gqcode, gqgcode) {
		console.log("문의글 삭제")
		console.log("gqcode : " + gqcode)

		$.ajax({
			type : "get",
			url : "deleteGoodsQuestion",
			data : {
				"gqcode" : gqcode
			},
			success : function(result) {
				console.log("삭제 성공")
				if (result > 0) {
					alert("문의글이 삭제되었습니다.")
					window.location.href = "campingDetailPage?gcode=" + gqgcode
				} else {
					alert("삭제에 실패하였습니다.")
				}

			}

		})

	}

	function prevPage(pageNum, gcode, maxPage, startPage, endPage){
		pageNum--;
		selPage(pageNum, gcode, maxPage, startPage, endPage);
	}

	function selPage(pageNum, gcode, maxPage, startPage, endPage){
		console.log("pageNum : " + pageNum);
		console.log("gcode : " + gcode);
		var loginId = '${sessionScope.loginId}';
		$.ajax({
		type: "get",
		url: "selGoodsQnAPage",
		data: {"pageNum": pageNum, "gcode": gcode},
		dataType: "json",
		async: false,
		success: function(result){
			console.log(result);
			var output = "";
			for(var i = 0; i < result.length; i++){
				output += '<div class="p-b-30 p-t-30" id="' + result[i].gqcode + '">';
				if(result[i].gqstate != 0){
					output += '<div id="' + result[i].gqcode + '_question">';
					output += '<div class="flex-w flex-sb-m">';
					output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
					output += result[i].gqmid;
					output += '</span>';
					if(result[i].gqmid == loginId){
						output += '<span id="' + result[i].gqcode + '_qustionBtn">';
						output += '<button class="btn btn-success m-r-10" onclick="modifyQuestionForm(\'' + result[i].gqcode + '\')">수정</button>';
						output += '<button type="button" class="btn btn-danger" onclick="deleteQuestion(\'' + result[i].gqcode + '\', \'' + result[i].gcode + '\')">삭제</button>';
						output += '</span>';
					}
					output += '</div>';
					output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gqdate + '</div>';
					output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">' + result[i].gqcontents + '</textarea>';
					output += '</div>';
					output += '<div id="' + result[i].gqcode + '_answer">';
					if(result[i].gwcode != null){
						output += '<div class="flex-w flex-t">';
						output += '<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">';
						output += '<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>';
						output += '</div>';
						output += '<div class="size-207">';
						output += '<div class="flex-w flex-sb-m">';
						output += '<span class="mtext-107 cl2 p-r-20">';
						output += 'Camily';
						output += '</span>';
						output += '</div>';
						output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gwdate + '</div>';
						output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gwcode + '_answerForm" name="answer" style="width: 100%; resize: none;" readonly="readonly">' + result[i].gwcontents + '</textarea>';
						output += '</div>';
						output += '</div>';
					}
					output += '</div>';
				}else{
					output += '<div id="' + result[i].gqcode + '_question">';
					output += '<div class="flex-w flex-sb-m">';
					output += '<span class="mtext-107 cl2 p-r-20" id="questionId">';
					output += result[i].gqmid;
					output += '</span>';
					output += '</div>';
					output += '<div class="p-b-17" style="font-size: 12px;">' + result[i].gqdate + '</div>';
					output += '<textarea class="stext-102 cl6 autoTextarea" id="' + result[i].gqcode + '_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">[ 삭제된 문의글입니다. ]</textarea>';
					output += '</div>';
				}
				if(i == result.length){
					output += '<hr>';
				}
			}
			$("#goodsQnAList_div").html(output);
			// output 초기화;
			output = "";
			console.log("pageNum : " + pageNum);
			console.log("gcode : " + gcode);
			// 페이징 수 : 5
			var pageNumCount = 5;
			startPage = parseInt(Math.ceil(pageNum/pageNumCount) - 1) * pageNumCount + 1;
			endPage = startPage + pageNumCount - 1;
			if(endPage > maxPage){
				endPage = maxPage;
			}
			console.log("maxPage : " + maxPage);
			console.log("startPage : " + startPage);
			console.log("endPage : " + endPage);
			output += '<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">';
			if(pageNum <= 1){
				output += '<span id="" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-left"></i></span>';
			}else{
				output += '<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="prevPage(\'' + pageNum + '\', \'' + gcode + '\', \'' + maxPage + '\', \'' + startPage + '\', \'' + endPage + '\')" style="cursor: pointer;"><i class="fa-solid fa-angle-left"></i></span>';
			}
			var repeat = 0;
			if(pageNumCount > endPage)

			for(var num = startPage; num <= endPage; num++){
				if(pageNum == num){
					output += '<span><a href="#tabList" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">' + num + '</a></span>';
				}else{
					output += '<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="selPage(\'' + num + '\', \'' + gcode + '\', \'' + maxPage + '\', \'' + startPage + '\', \'' + endPage + '\')" style="cursor: pointer;">' + num + '</span>';
				}
			}
			if(pageNum > endPage || pageNum == maxPage){
				output += '<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-right"></i></span>';
			}else{
				output += '<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="nextPage(\'' + pageNum + '\', \'' + gcode + '\', \'' + maxPage + '\', \'' + startPage + '\', \'' + endPage + '\')" style="cursor: pointer;"><i class="fa-solid fa-angle-right"></i></span>';
			}
			output += '</div>';
			$("#pageQnA").html(output);
		}
		});
	}

	function nextPage(pageNum, gcode, maxPage, startPage, endPage){
		pageNum++;
		selPage(pageNum, gcode, maxPage, startPage, endPage);
	}


</script>
</html>
