<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Admin | Camily</title>
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
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->

	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->

	<section class="section-slide" style="margin-top: 100px;">
		<!-- Page Heading -->


		<!-- Content Row -->
		<div class="row" style="margin:0 auto; ">
			<div class="d-sm-flex align-items-center justify-content-between mb-4" style="margin:0 auto; ">
				<h1 class="h3 mb-0 text-gray-800">관리자 캠핑예약 페이지 - AdminReservation.jsp</h1>
			</div>
			<div class="card shadow mb-8 col-sm-10" style="margin:0 auto; ">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">캠핑장 리스트</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<c:set var="today" value="<%=new java.util.Date() %>"/>
						<fmt:formatDate var="now" value="${today}" pattern="yyyy-MM-dd"/>
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th></th>
									<th class="align-middle text-center font-weight-bold"
										style="min-width: 110px; height: 55px;">예약번호</th>
									<th class="align-middle text-center font-weight-bold">캠핑장 이름</th>
									<th class="align-middle text-center font-weight-bold">이용기간</th>
									<th class="align-middle text-center font-weight-bold">예약상황</th>
									<th class="align-middle text-center font-weight-bold">취소처리</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th></th>
									<th class="align-middle text-center font-weight-bold"
										style="min-width: 110px; height: 55px;">예약번호</th>
									<th class="align-middle text-center font-weight-bold">캠핑장 이름</th>
									<th class="align-middle text-center font-weight-bold">이용기간</th>
									<th class="align-middle text-center font-weight-bold">예약상황</th>
									<th class="align-middle text-center font-weight-bold">취소처리</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach items="${reservationList}" var="reservationInfo">
									<c:set var="campIMG" value="${reservationInfo.crimage}" />
									<tr>
										<td class="align-middle text-center">
											<c:choose>
												<c:when test="${fn:substring(campIMG,0,4) == 'http'}">
													<img src="${reservationInfo.crimage }" height="50px">
												</c:when>
												<c:otherwise>
													<img src="${pageContext.request.contextPath}/resources/caimageUpload/${reservationInfo.crimage }"
														height="50px">
												</c:otherwise>
											</c:choose>
										</td>
										<td class="align-middle text-center font-weight-bold"><span style="cursor: pointer; color: #007bff;" onclick="reservationInfo('${reservationInfo.recode}')">${reservationInfo.recode }</span></td>
										<td class="align-middle text-center font-weight-bold">${reservationInfo.caname }</td>
										<td class="align-middle text-center font-weight-bold">
											${reservationInfo.startday} ~ ${reservationInfo.endday}
										</td>
										<td class="align-middle text-center font-weight-bold">
											<c:choose>
												<c:when test="${reservationInfo.restate == 0}">
													예약 취소
												</c:when>
												<c:when test="${reservationInfo.startday > now}">
													예약중
												</c:when>
												<c:when test="${reservationInfo.startday < now && reservationInfo.endday > now}">
													숙박중
												</c:when>
												<c:otherwise>
													 숙박완료
												</c:otherwise>
											</c:choose>
										</td>
										<td class="align-middle text-center">
											<c:if test="${reservationInfo.startday > now && reservationInfo.restate > 0}">
												<button class="btn btn-danger" onclick="reserveCancel('${reservationInfo.recode}')">취소</button>
											</c:if>
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
					<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-left"></i></span>
				</c:when>
				<c:otherwise>
					<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="prevPage('${pageDto.page}')" style="cursor: pointer;"><i class="fa-solid fa-angle-left"></i></span>
				</c:otherwise>
			</c:choose>
			<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
				<c:choose>
					<c:when test="${pageDto.page == num}">
						<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
					</c:when>
					<c:otherwise>
						<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="selPage('${num}')" style="cursor: pointer;">${num}</span>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
					<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-right"></i></span>
				</c:when>
				<c:otherwise>
					<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="nextPage('${pageDto.page}')" style="cursor: pointer;"><i class="fa-solid fa-angle-right"></i></span>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- Pagination 종료 -->
	</section>

	<!-- 상세정보 Modal -->
	<div class="modal fade" id="reserveInfo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 1200;">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="reserveCode">Modal title</h5>
					<button class="close text-right font-weight-bold mt-2 mr-2" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-4">
							<img id="reserveImg" src="" alt="" style="width: 100%;">
						</div>
						<div class="col-lg-8">
							<h5 class="p-b-10" id="reserveName"></h5>
							<div id="reserveDate">
								<div class="p-b-5">
									<span>입실 : </span>
									<span id="reserveStartday"></span>
								</div>
								<div class="p-b-5">
									<span>퇴실 : </span>
									<span id="reserveEndday"></span>
								</div>
							</div>
							<div class="p-b-5">
								<span>결제금액 : </span>
								<span id="reservePrice"></span>
							</div>
							<div class="p-b-5">
								<span>예약인원 : </span>
								<span id="reservePeople"></span>
							</div>
							<hr>
							<div id="reserveMember">
								<div class="p-b-5">
									<span>예약자 ID : </span>
									<span id="reserveMid"></span>
								</div>
								<div class="p-b-5">
									<span>예약자 이름 : </span>
									<span id="reserveMname"></span>
								</div>
								<div class="p-b-5">
									<span>예약자 전화번호 : </span>
									<span id="reserveMtel"></span>
								</div>
								<div class="p-b-5">
									<span>예약자 이메일 : </span>
									<span id="reserveMemail"></span>
								</div>
								<hr>
								<div>요청사항</div>
								<textarea class="stext-102 cl6 autoTextarea" id="reserveRequest" readonly="readonly" style="width: 100%; resize: none;"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 취소 확인 Modal -->
	<div class="modal fade" id="cancelReservation" tabindex="-1" aria-hidden="true" style="z-index: 1200;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="cancelTitle"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<span id="cancelComfirm"></span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
					<form action="adminCancelReservation" method="post">
						<input type="hidden" name="recode" id="cancelRecode" value="">
						<button type="submit" class="btn btn-primary" >예</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>

	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function () {
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
	<script src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js">
	</script>
	<script>
		$('.gallery-lb').each(function () { // the containers for all your galleries
			$(this).magnificPopup({
				delegate: 'a', // the selector for gallery item
				type: 'image',
				gallery: {
					enabled: true
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
		$('.js-addwish-b2').on('click', function (e) {
			e.preventDefault();
		});

		$('.js-addwish-b2').each(
			function () {
				var nameProduct = $(this).parent().parent().find(
					'.js-name-b2').html();
				$(this).on('click', function () {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-b2');
					$(this).off('click');
				});
			});

		$('.js-addwish-detail').each(
			function () {
				var nameProduct = $(this).parent().parent().parent().find(
					'.js-name-detail').html();

				$(this).on('click', function () {
					swal(nameProduct, "is added to wishlist !", "success");

					$(this).addClass('js-addedwish-detail');
					$(this).off('click');
				});
			});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(
			function () {
				var nameProduct = $(this).parent().parent().parent()
					.parent().find('.js-name-detail').html();
				$(this).on('click', function () {
					swal(nameProduct, "is added to cart !", "success");
				});
			});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js">
	</script>
	<script>
		$('.js-pscroll').each(function () {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function () {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

</body>
<script>
	function prevPage(page){
		page--;
		location.href = "adminReservationPage?page=" + page;
	}
	
	function selPage(page){
		location.href = "adminReservationPage?page=" + page;
	}
	
	function nextPage(page){
		page++;
		location.href = "adminReservationPage?page=" + page;
	}

	function reservationInfo(recode){
		$.ajax({
			type: "get",
			url: "adminReservationInfo",
			data: {"recode": recode},
			dataType: "json",
			async: "false",
			success(result){
				console.log(result);
				$("#reserveInfo").modal("show");
				$("#reserveCode").text(result.recode);
				$("#reserveImg").attr("src", result.crimage);
				$("#reserveName").text("[" + result.caname.replace(' ', '') + "] " + result.recrname + " - " + result.recrnum);
				$("#reserveStartday").text(result.startday);
				$("#reserveEndday").text(result.endday);
				$("#reservePrice").text(parseInt(result.reprice).toLocaleString() + "원");
				$("#reservePeople").text(result.repeople + "명");
				$("#reserveMid").text(result.remid);
				$("#reserveMname").text(result.remname);
				$("#reserveMtel").text(result.remtel);
				console.log(result.remtel.substring(0,3) + "-" + result.remtel.substring(3,7) + "-" + result.remtel.substring(7,11));
				$("#reserveMemail").text(result.rememail);
				$("#reserveRequest").text(result.rerequest);
				if(result.rerequest == null){
					$("#reserveRequest").text("없음");
				}
				//textareaAutoSize();
			}
		})
	}

	function reserveCancel(recode){
		$("#cancelReservation").modal("show");
		$("#cancelTitle").text(recode);
		$("#cancelComfirm").text("[" + recode + "] 를 취소하시겠습니까?")
		$("#cancelRecode").val(recode);
	}



	function textareaAutoSize(){
		let textarea =  $(".autoTextarea");
		 console.log(textarea);
		for(var i = 0; i < textarea.length; i++){
			if (textarea) {
				console.log("textarea["+i+"] : " + textarea[i])
				textarea[i].style.height = 'auto';
				let height = textarea[i].scrollHeight; // 높이
				console.log(height);
				textarea[i].style.height = ( height + 8 ) + `px`;
			}
		}
	}
</script>
</html>