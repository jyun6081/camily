<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>AdminMain</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->
</head>
<body class="animsition">
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>



	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->

	<!-- Slider -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
			
				<c:forEach items="${bannerList}" var="bannerInfo">
					<div id="${bannerInfo.bncode}">
						<div class="item-slick1" style="background-image: url(${pageContext.request.contextPath}/resources/bannerUpload/${bannerInfo.bnimage});">
						<button class="btn btn-danger" style="float: right; margin: 20px" onclick="bannerModDelForm('${bannerInfo.bncode}','${bannerInfo.bnimage}','${bannerInfo.bntitle}','${bannerInfo.bncontents}','${bannerInfo.bnlink}')">수정/삭제하기</button>
						<button class="btn btn-primary" style="float: right; margin: 20px" onclick="bannerAddForm()">추가하기</button>
							<div class="container h-full">
								<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bntitleeffect}" data-delay="0">
										<span class="ltext-101 cl2 respon2" style="color: white; text-shadow: 1px 1px 1px #000;">${bannerInfo.bntitle}</span>
									</div>
		
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bncontentseffect}" data-delay="800">
										<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" style="color: white; text-shadow: 1px 1px 1px #000;">${bannerInfo.bncontents}</h2>
									</div>
		
									<div class="layer-slick1 animated visible-false" data-appear="${bannerInfo.bnlinkeffect}" data-delay="1600">
										<a href="${bannerInfo.bnlink}" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">보러가기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->



	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Banner Modal -->
	<form action="" method="post" enctype="multipart/form-data" id="bannerForm">
		<div class="modal fade" id="BannerModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1200">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<h5 style="margin: auto; font-size: 25px; font-weight: bold;" id="modaltitle">Banner 수정</h5>
					</div>
					<div class="modal-body mx-3">
						<div class="row">
							<input type="hidden" name="type" id="bntype">
							<input type="hidden" name="bncode" id="bncode">
							<div class="col-6">
								<div class="p-t-10 p-b-10">
									<h6 style="font-size: 20px;font-weight: bold;padding-bottom: 10px;">배경 이미지</h6>
									<img alt="" src="" id="bannerImage" style="width: 100%">
									<input type="file" name="bnimagefile" id="bnimagefile" onchange="readURL(this);" style="width: 100%;">
								</div>
							</div>
							<div class="col-6">
								<div class="p-t-10 p-b-10">
									<h6 style="font-size: 20px;font-weight: bold;padding-bottom: 10px;">배너 윗글</h6>
									<label for="bntitle">내용</label>
									<input class="form-control m-b-10" type="text" name="bntitle" id="bntitle" style="height: 45px;">
									<label for="bntitleeffect">효과</label>
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="bntitleeffect" id="bntitleeffect">
											<option value="">없음</option>										
											<option value="fadeInDown">fadeInDown</option>
											<option value="fadeInUp">fadeInUp</option>
											<option value="zoomIn">zoomIn</option>
											<option value="rollIn">rollIn</option>
											<option value="lightSpeedIn">lightSpeedIn</option>
											<option value="slideInUp">slideInUp</option>
											<option value="rotateInDownLeft">rotateInDownLeft</option>
											<option value="rotateInUpRight">rotateInUpRight</option>
											<option value="rotateIn">rotateIn</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
								<div class="p-t-10 p-b-10">
									<h6 style="font-size: 20px;font-weight: bold;padding-bottom: 10px;">배너 본문</h6>
									<label for="bncontents">내용</label>
									<input class="form-control m-b-10" type="text" name="bncontents" id="bncontents" style="height: 45px;">
									<label for="bncontentseffect">효과</label>
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="bncontentseffect" id="bncontentseffect">
											<option value="">없음</option>										
											<option value="fadeInDown">fadeInDown</option>
											<option value="fadeInUp">fadeInUp</option>
											<option value="zoomIn">zoomIn</option>
											<option value="rollIn">rollIn</option>
											<option value="lightSpeedIn">lightSpeedIn</option>
											<option value="slideInUp">slideInUp</option>
											<option value="rotateInDownLeft">rotateInDownLeft</option>
											<option value="rotateInUpRight">rotateInUpRight</option>
											<option value="rotateIn">rotateIn</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
								<div class="p-t-10 p-b-10">
									<h6 style="font-size: 20px;font-weight: bold;padding-bottom: 10px;">버튼</h6>
									<label for="bnlink">링크</label>
									<input class="form-control m-b-10" type="text" name="bnlink" id="bnlink" style="height: 45px;">
									<label for="bnlinkeffect">효과</label>
									<div class="rs1-select2 bor8 bg0">
										<select class="js-select2" name="bnlinkeffect" id="bnlinkeffect">
											<option value="">없음</option>										
											<option value="fadeInDown">fadeInDown</option>
											<option value="fadeInUp">fadeInUp</option>
											<option value="zoomIn">zoomIn</option>
											<option value="rollIn">rollIn</option>
											<option value="lightSpeedIn">lightSpeedIn</option>
											<option value="slideInUp">slideInUp</option>
											<option value="rotateInDownLeft">rotateInDownLeft</option>
											<option value="rotateInUpRight">rotateInUpRight</option>
											<option value="rotateIn">rotateIn</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
							</div>
						</div>
						<div style="text-align: end;">
							<button type="button" class="btn btn-primary" style="display: none;" id="addBtn" onclick="addBanner()">등록하기</button>
							<button type="button" class="btn btn-warning" style="display: none;" id="modifyBtn" onclick="modifyBanner()">수정하기</button>
							<button type="button" class="btn btn-danger" style="display: none;" id="deleteBtn" onclick="deleteBanner()">삭제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
</body>
<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
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
<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/sweetalert/sweetalert.min.js"></script>
<script>
	$('.js-addwish-b2').on('click', function(e) {
		e.preventDefault();
	});

	$('.js-addwish-b2').each(function() {
		var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
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
				var nameProduct = $(this).parent().parent().parent().parent()
						.find('.js-name-detail').html();
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

<!-- 경고창 표시 -->
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg.length);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>


<script type="text/javascript">
function bannerModDelForm(bncode, bnimage, bntitle, bncontents, bnlink) {
	console.log(bncode + " - 배너 수정/삭제");
	$("#modaltitle").text(bncode + "수정/삭제");
	$("#bncode").val(bncode);
	$("#bannerImage").attr("src", bnimage);
	$("#bntitle").val(bntitle);
	$("#bncontents").val(bncontents);
	$("#bnlink").val(bnlink);
	$("#addBtn").attr("style","display:none");
	$("#modifyBtn").removeAttr("style");
	$("#deleteBtn").removeAttr("style");
	$("#BannerModal").modal("show");
}
function bannerAddForm(){
	console.log("배너 추가");
	$("#modaltitle").text("배너 추가");
	$("#bncode").val("");
	$("#bannerImage").removeAttr("src");
	$("#bntitle").val("");
	$("#bncontents").val("");
	$("#bnlink").val("");
	$("#addBtn").removeAttr("style");
	$("#modifyBtn").attr("style","display:none");
	$("#deleteBtn").attr("style","display:none");
	$("#BannerModal").modal("show");
}

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('bannerImage').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('bannerImage').src = "";
	  }
}

function addBanner(){
	$("#bannerForm").attr("action", "bannerAdd");
	$("#bannerForm").submit();
}

function modifyBanner(){
	$("#bannerForm").attr("action", "bannerModify");
	$("#bannerForm").submit();
}

function deleteBanner(){
	$("#bannerForm").attr("action", "bannerDelete");
	$("#bannerForm").submit();
}
</script>
</html>
