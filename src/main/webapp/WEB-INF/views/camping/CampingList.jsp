<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>캠핑장 목록</title>
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
		.grid{
			display: grid;
			grid-template-columns: 1fr 80px
		}
		input:checked + label {
            background-color: #ff880088;
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
	
	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" onclick="campingList(null)">
						모든 캠핑장
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" onclick="campingList('glamping')">
						글램핑
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" onclick="campingList('caravan')">
						카라반
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" onclick="campingList('car')">
						자동차야영장
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" onclick="campingList('site')">
						일반야영장
					</button>

				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4" onclick="campingListInput()" hidden="hidden">
						공공데이터
					</div>
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>

				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<form action="campingList" method="get">
						<div style="display: flex;">
							<input type="checkbox" name="info" id="elect" value="elect" style="display: none;">
							<label for="elect" class="btn btn-light p-2 mr-3" style="font-weight: bold;">전기</label>
							<input type="checkbox" name="info" id="wifi" value="wifi" style="display: none;">
							<label for="wifi" class="btn btn-light p-2 mr-3" style="font-weight: bold;">무선인터넷</label>
							<input type="checkbox" name="info" id="firewood" value="firewood" style="display: none;">
							<label for="firewood" class="btn btn-light p-2 mr-3" style="font-weight: bold;">장작판매</label>
							<input type="checkbox" name="info" id="hotwater" value="hotwater" style="display: none;">
							<label for="hotwater" class="btn btn-light p-2 mr-3" style="font-weight: bold;">온수</label>
							<input type="checkbox" name="info" id="playground" value="playground" style="display: none;">
							<label for="playground" class="btn btn-light p-2 mr-3" style="font-weight: bold;">놀이터</label>
							<input type="checkbox" name="info" id="waterpool" value="waterpool" style="display: none;">
							<label for="waterpool" class="btn btn-light p-2 mr-3" style="font-weight: bold;">물놀이장</label>
							<input type="checkbox" name="info" id="boardwalk" value="boardwalk" style="display: none;">
							<label for="boardwalk" class="btn btn-light p-2 mr-3" style="font-weight: bold;">산책로</label>
							<input type="checkbox" name="info" id="trampoline" value="trampoline" style="display: none;">
							<label for="trampoline" class="btn btn-light p-2 mr-3" style="font-weight: bold;">트렘폴린</label>
							<input type="checkbox" name="info" id="playfield" value="playfield" style="display: none;">
							<label for="playfield" class="btn btn-light p-2 mr-3" style="font-weight: bold;">운동장</label>
							<input type="checkbox" name="info" id="exercise" value="exercise" style="display: none;">
							<label for="exercise" class="btn btn-light p-2 mr-3" style="font-weight: bold;">운동시설</label>
							<input type="checkbox" name="info" id="mart" value="mart" style="display: none;">
							<label for="mart" class="btn btn-light p-2 mr-3" style="font-weight: bold;">마트</label>
						</div>
						<div class="bor8 dis-flex p-l-15">
							<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" id="searchCamp">
								<i class="zmdi zmdi-search"></i>
							</button>
							<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="searchKeyword" placeholder="Search" onkeydown="searchCamp(event)">
							<button type="submit" class="p-2 flex-c-m stext-101 cl0 bg1 hov-btn1 p-lr-15 trans-04" style="border-radius: 3px; width: 100px">검색하기</button>
						</div>
					</form>
				</div>
				
			</div>

			<div class="row isotope-grid">
				<c:forEach items="${campingList}" var="campingInfo">
					<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
						<!-- Block2 -->
						<div class="block2">
							<div class="block2-pic">
								<!--c:set으로 이미지 파일 이름 지정 -->
								 <c:set var="campIMG" value="${campingInfo.caimage}" />
								 
								<c:choose>
									<c:when test="${campingInfo.crprice != null}">
										<a href="campingView?cacode=${campingInfo.cacode}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
											<img src="${campingInfo.caimage}" alt="캠핑장 이미지" style="width: 100%; height: 200px; object-fit: cover;  object-position: bottom;">
										</a>
									</c:when>
									<c:otherwise>
										<img class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" src="${campingInfo.caimage}" alt="캠핑장 이미지" style="width: 100%; height: 200px; object-fit: cover;  object-position: bottom;">
									</c:otherwise>
								</c:choose>

								<!-- <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
									Quick View
								</a> -->
							</div>

							<div class="block2-txt flex-w flex-t p-t-14 grid">
								<div class="block2-txt-child1 flex-col-l ">
									<c:choose>
										<c:when test="${campingInfo.crprice != null}">
											<a href="campingView?cacode=${campingInfo.cacode}"
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												<span style="font-size: 20px; font-weight: bold;">${campingInfo.caname}</span>
											</a>
										</c:when>
										<c:otherwise>
											<span class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6" style="font-size: 20px; font-weight: bold;">${campingInfo.caname}</span>
										</c:otherwise>
									</c:choose>
																		
										
									
									<span class="stext-105 cl3">
										<c:choose>
											<c:when test="${campingInfo.crprice != null}">
												${campingInfo.cformatter}원 부터 ~
												<%-- ${campingInfo.crprice} --%>
											</c:when>
											<c:otherwise>
												준비중
											</c:otherwise>
										</c:choose>
									</span>
								</div>
								<c:if test="${campingInfo.castaravg != null}">
								<div>
									<span style="text-align: end;">⭐ <span style="font-weight: bold;">${campingInfo.castaravg}</span> / 5</span>
								</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			
			<!-- Pagination 시작 -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
					<c:choose>
						<c:when test="${pageDto.page <= 1}">
							<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-left"></i></span>
						</c:when>
						<c:otherwise>
							<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="prevPage('${pageDto.page}', '${type}', '${searchKeyword}')" style="cursor: pointer;"><i class="fa-solid fa-angle-left"></i></span>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
						<c:choose>
							<c:when test="${pageDto.page == num}">
								<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
							</c:when>
							<c:otherwise>
								<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="selPage('${num}', '${type}', '${searchKeyword}')" style="cursor: pointer;">${num}</span>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
							<span class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1"><i class="fa-solid fa-angle-right"></i></span>
						</c:when>
						<c:otherwise>
							<span class="flex-c-m how-pagination1 trans-04 m-all-7" onclick="nextPage('${pageDto.page}', '${type}', '${searchKeyword}')" style="cursor: pointer;"><i class="fa-solid fa-angle-right"></i></span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!-- Pagination 종료 -->
		</div>
	</div>




	<!-- Footer -->
	<%@ include file="../includes/Footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	
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

		$('.js-addwish-b2').each(function () {
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function () {
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function () {
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function () {
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function () {
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
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

<script type="text/javascript	">
	function campingListInput() {
		location.href = "campingListInput";
	}
</script>
<script>
	function campingList(campingtype){
		var type;
		switch(campingtype){
			case "glamping":
				type = "글램핑";
				break;
			case "caravan":
				type = "카라반";
				break;
			case "car":
				type = "자동차야영장";
				break;
			case "site":
				type = "일반야영장";
				break;
			default:
				type = "";
				break;
		}
		console.log("type : " + type);
		if(type.length > 0){
			location.href = "campingList?type=" + type;
		}else{
			location.href = "campingList";
		}
	}
</script>
<script type="text/javascript">
	function searchCamp(event) {
		if(event.key === "Enter"){
//            event.preventDefault();
            $("#searchCamp").click();
        }
	}

	function prevPage(page, type, searchKeyword){
		page--;
		var url = 'campingList?page=' + page;
		if(type.length > 0){
			url += '&type=' + type;
		}
		if(searchKeyword.length > 0){
			url += '&searchKeyword=' + searchKeyword;
		}
		location.href = url;
	}
	function selPage(page, type, searchKeyword){
		var url = 'campingList?page=' + page;
		if(type.length > 0){
			url += '&type=' + type;
		}
		if(searchKeyword.length > 0){
			url += '&searchKeyword=' + searchKeyword;
		}
		location.href = url;
	}
	function nextPage(page, type, searchKeyword){
		page++;
		var url = 'campingList?page=' + page;
		if(type.length > 0){
			url += '&type=' + type;
		}
		if(searchKeyword.length > 0){
			url += '&searchKeyword=' + searchKeyword;
		}
		location.href = url;
	}
</script>
</html>