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
							  
								<div class="item-slick3" data-thumb="${campingDetail.gimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${campingDetail.gimage }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${campingDetail.gsideimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${campingDetail.gsideimage }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="${campingDetail.gbackimage }">
									<div class="wrap-pic-w pos-relative">
										<img src="${campingDetail.gbackimage }" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
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
								       <img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" style="width: 75%">
						</button>
						<div class="mtext-106 cl2">
						$: ${campingDetail.gprice }원 
						</div>

						<p class="stext-102 cl3 p-t-23">
							Nulla eget sem vitae eros pharetra viverra. Nam vitae luctus ligula. Mauris consequat ornare feugiat.
						</p>
						
						<!-- 구매페이지 전송 -->
					    <form action="campingpurchase" method="post">
                        <input type="hidden" name="gcode" value="${campingDetail.gcode }">                            
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
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
                                    <div class="col-6">
                                    <button type="button" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1" 
                                            onclick="shoppingbasket('${campingDetail.gcode }','${campingDetail.gname }','${campingDetail.gimage }',
                                            '${campingDetail.gprice }')">
								        장바구니
								    </button>									
                                    </div>
                                    <div class="col-6">
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1">
								        구매하기
									</button>
                                    </div>
							</div>	
						</div>
					 </form>
					</div>
				</div>
			</div>


			<div class="bor10 m-t-50 p-t-43 p-b-40">
			<img src="${campingDetail.gdetailimage }" alt="" >
			</div>

		</div>
	</section>
	
	
	
			<!-- Load more -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					위로가기(◦'⌣'◦)
				</a>
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
 function kakaoshare(gcompanyname,gname,gprice,gimage,gcontents,gcategory){
	 console.log("gcompanyname :"+ gcompanyname);	
	 console.log("gname :"+ gname);	
	 console.log("gprice :"+ gprice);	
	 console.log("gimage :"+ gimage);	
	 console.log("gcontents :"+ gcontents);	
	 console.log("gcategory :"+ gcategory);	
	 Kakao.init('ff44da0c10c3fe434ba307170a916ce5')
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: gname,
	        description: gcompanyname+"#"+gprice,
	        imageUrl:
	        	gimage,
	        link: {
	          mobileWebUrl: '121.65.47.77',
	          webUrl: 'https://developers.kakao.com',
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
</html>
