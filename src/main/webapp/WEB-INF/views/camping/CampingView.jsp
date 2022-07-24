<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Home</title>
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
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<style type="text/css">
		.dp-highlight .ui-state-default {
			background: #ff8800;
			color: #FFF;
		}

		.ui-datepicker.ui-datepicker-multi {
			width: 100% !important;
		}

		.ui-datepicker-multi .ui-datepicker-group {
			float: none;
		}

		#datepicker {
			height: 300px;
			overflow-x: scroll;
		}

		.ui-widget {
			font-size: 100%
		}

		.ui-datepicker {
			width: 100%;
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

	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<img src="${campingInfo.caimage}" alt="캠핑장 대표 이미지" style="width: -webkit-fill-available;">
						
					</div>
				</div>

				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							${campingInfo.caname}
						</h4>


						<!-- <span class="mtext-106 cl2">
							가격 : 
						</span> -->

						<p class="stext-102 cl3 p-t-23">
							${campingInfo.calinecontents}
						</p>

						<!--  -->
						<form action="campingReservationPage" method="post">
							<input type="hidden" name="cacode" value="${campingInfo.cacode}">
							<div class="p-t-33">
								<!-- 예약 날짜 선택 -->
								<div class="p-b-10">
									<input type="hidden" name="startday" id="startday" size="10">
									<input type="hidden" name="endday" id="endday" size="10">
									<div class="datepicker"></div>
								</div>
								<!-- 해당 날짜에 가능한 객실 타입목록 표시 -->
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										객실타입
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="roomSel" id="roomSel"
												onchange="checkRoomNum()">
												<option>캠핑장 종류 선택</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<!-- 해당 타입의 가능한 객실 번호 표시 -->
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										객실번호
									</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="numSel" id="numSel" onchange="checkpeople()">
												<option>객실번호 선택</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<!-- 인원선택 -->
								<div class="flex-w flex-r-m p-b-10" style="justify-content: space-between;">
									<div class="size-203 flex-c-m respon6">
										인원
									</div>

									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input id="people" class="mtext-104 cl3 txt-center num-product" type="number" name="people" value="1" min="1" max="6" readonly="readonly">
											
										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>
								</div>
								
								<!-- 가격 표시 -->
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">
										예약 가격
									</div>
									<div class="size-204 respon6-next" id="totalPrice" style="font-size: 20px; font-weight: bold; text-align: end">0원</div>
								</div>
								<!-- 예약하기 버튼 -->
								<div class="flex-w flex-r-m p-b-10" style="justify-content: center;">
									<div class="size-204 flex-w flex-m respon6-next" style="justify-content: center;">
										<button class="flex-c-m stext-101 cl0 size-101 bg1 hov-btn1 p-lr-15 trans-04" style="border-radius: 10px;">예약하기</button>
									</div>
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>

			<div class="bor10 m-t-50 p-t-43 p-b-40">
				<!-- Tab01 -->
				<div class="tab01">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#roomtype" role="tab">객실정보</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link active" data-toggle="tab" href="#description" role="tab">캠핑장 소개</a>
						</li>

						<li class="nav-item p-b-10">
							<a class="nav-link" data-toggle="tab" href="#information" role="tab" onclick="drawMap('${campingInfo.calatitude}', '${campingInfo.calongitude}', '${campingInfo.caname}')">캠핑장 정보</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content p-t-43">

						<!-- - -->
						<div class="tab-pane fade" id="roomtype" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<!-- Review -->
										<c:forEach items="${campingRoomTypeList}" var="campingRoomType">
											<div class="flex-w flex-t p-b-68">
												<div class="wrap-pic-s size-109 bor0 of-hidden m-r-18 m-t-6" style="width: 200px; height: 200px;">
													<img src="${campingRoomType.crimage}" alt="객실사진">
												</div>

												<div class="size-207" style="width: calc(100% - 218px);">
													<div class="flex-w flex-sb-m p-b-17">
														<span class="mtext-107 cl2 p-r-20 p-l-20" style="font-size: 30px;">
															${campingRoomType.crname}
														</span>
													</div>

													<p class="stext-102 cl6 p-l-40" style="font-size: 20px;">
														평일가격 : <fmt:formatNumber value="${campingRoomType.crprice}" pattern=""/>원
													</p>
													<p class="stext-102 cl6 p-l-40" style="font-size: 20px;">
														주말가격 : <fmt:formatNumber value="${campingRoomType.crprice * 1.2}" pattern=""/>원
													</p>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade show active" id="description" role="tabpanel">
							<div class="how-pos2 p-lr-15-md">
								<p class="stext-102 cl6">${campingInfo.cacontents}</p>
							</div>
						</div>

						<!-- - -->
						<div class="tab-pane fade" id="information" role="tabpanel">
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div class="p-b-30 m-lr-15-sm">
										<div>
											<!-- 캠핑장 문의 -->
											<c:forEach items="${campingQuestionList}" var="campingQustionInfo">
												<div class="p-b-68" id="${campingQustionInfo.cqcode}">
													<!-- 캠핑장 문의글 -->
													<div>
														<form action="questionWrite" method="post" id="${campingQustionInfo.cqcode}_questionModify">
															<div class="flex-w flex-sb-m">
																<span class="mtext-107 cl2 p-r-20" id="questionId">
																	${campingQustionInfo.cqmid}
																</span>
																<span id="${campingQustionInfo.cqcode}_qustionBtn">
																	<button class="btn btn-success m-r-10" onclick="modifyQuestionForm('${campingQustionInfo.cqcode}')">수정</button><button class="btn btn-danger" onclick="deleteQuestion('${campingQustionInfo.cqcode}')">삭제</button>
																</span>
															</div>
															<div class="p-b-17" style="font-size: 12px;">${campingQustionInfo.cqdate}</div>
															<textarea class="stext-102 cl6" id="${campingQustionInfo.cqcode}_questionContents" name="questionContents" style="width: 100%; resize: none;" readonly="readonly">${campingQustionInfo.cqcontents}</textarea>
														</form>
													</div>
													<!-- 답글 -->
													<div class="flex-w flex-t">
														<div class="wrap-pic-s size-109 bor0 m-r-18 m-t-6" style="text-align: center;">
															<i class="fa-solid fa-turn-up" style="transform: rotate(90deg); font-size: 30px;"></i>
														</div>
														<div class="size-207">
															<div class="flex-w flex-sb-m p-b-17">
																<span class="mtext-107 cl2 p-r-20">
																	Camily
																</span>
															</div>
															<textarea class="stext-102 cl6" id="answer" name="answer" style="width: 100%; resize: none;">문의하신 내용에 답변 드립니다.</textarea>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
										


										<!-- 문의글 작성하기 -->
										<form action="questionWrite" id="cqform">
											<input type="hidden" id="cqmid" name="cqmid" value="${sessionScope.loginId}">
											<input type="hidden" name="cqcacode" value="${campingInfo.cacode}">
											<div class="row p-b-25">
												<div class="col-12 p-b-5">
													<label class="stext-102 cl3" for="review">문의글 작성</label>
													<textarea class="size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10" id="cqcontents" name="cqcontents" style="resize: none;"></textarea>
												</div>
											</div>
											<button type="button" class="flex-c-m stext-101 cl0 size-112 bg7 bor11 hov-btn3 p-lr-15 trans-04 m-b-10" onclick="cqsubmit();">
												작성
											</button>
										</form>
									</div>
								</div>
							</div>
							
							
							
							
							
							<div class="row">
								<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
									<div id="map" style="width: 500px; height: 400px;"></div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


	</section>

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
				minimumResultsForSearch: 100,
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10d14c6ccf8a5da29debf326077676e3">
	</script>
	<script type="text/javascript">
		function drawMap(calatitude, calongitude, caname) {
			console.log("calatitude : " + calatitude);
			console.log("calongitude : " + calongitude);
			console.log("caname : " + caname);
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(calatitude, calongitude),
				level: 3
			};

			var map = new kakao.maps.Map(container, options);

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(calatitude, calongitude);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">' + caname +
				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwPosition = new kakao.maps.LatLng(calatitude, calongitude); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				position: iwPosition,
				content: iwContent
			});
		}
	</script>
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
</body>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(".datepicker").datepicker({
		minDate: 0,
		numberOfMonths: [1, 1],
		dayNames: [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		showMonthAfterYear: true,
		beforeShowDay: function (date) {
			var date1 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#startday").val());
			var date2 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#endday").val());
			return [true, date1 && ((date.getTime() == date1.getTime()) || (date2 && date >= date1 && date <=
				date2)) ? "dp-highlight" : ""];
		},
		onSelect: function (dateText, inst) {
			var date1 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#startday").val());
			var date2 = $.datepicker.parseDate($.datepicker._defaults.dateFormat, $("#endday").val());
			if (!date1 || date2) {
				$("#startday").val(dateText);
				$("#endday").val("");
				$(this).datepicker();
			} else {
				$("#endday").val(dateText);
				checkRoomType();
				$(this).datepicker();
			}
		}
	});
</script>
<script type="text/javascript">
	var ableRoom = [];

	function checkRoomType() {
		var cacode = '${campingInfo.cacode}';
		console.log("cacode : " + cacode);
		var startday = $("#startday").val();
		console.log("startday : " + startday);
		var endday = $("#endday").val();
		console.log("endday : " + endday);
		if (startday < endday) {
			$.ajax({
				type: "get",
				url: "checkRoomType",
				data: {
					"cacode": cacode,
					"startday": startday,
					"endday": endday
				},
				dataType: "json",
				async: false,
				success: function (result) {
					ableRoom = result;
					console.log(result);

					var roomtype = [];


					for (var i = 0; i < result.length; i++) {
						//console.log(roomtype.includes(result[i].crname));
						if (!roomtype.includes(result[i].crname)) {
							roomtype.push(result[i].crname);
						}
						/*
						if(i == 0){
							roomtype[0] = result[0].crname;
						}else{
							for(var j = 0; j < roomtype.length; j++){
								if(result[i].crname == roomtype[j]){
									break;
								}else{
									roomtype.push(result[i].crname);									
								}
							}							
						}
						*/
					}
					roomtype.sort();
					//console.log(roomtype);
					var output = '<option>캠핑장 종류 선택</option>';
					for (var i = 0; i < roomtype.length; i++) {
						output += '<option value="' + roomtype[i] + '">' + roomtype[i] + '</option>'
					}
					$("#roomSel").html(output);
				}
			})
		}

	}

	function checkRoomNum() {
		var roomSel = $("#roomSel").val();
		console.log("roomSel : " + roomSel);
		console.log(ableRoom);
		var output = "<option>객실번호 선택</option>";
		for (var i = 0; i < ableRoom.length; i++) {
			//console.log("ableRoom[i].crname : " + ableRoom[i].crname);
			if (ableRoom[i].crname == roomSel) {
				output += '<option value="' + ableRoom[i].crnum + '">' + ableRoom[i].crnum + '</option>'
			}
		}
		
		$("#numSel").html(output);
	}
	function checkpeople(){
		for(var i = 0; i < ableRoom.length; i++){
			if(ableRoom[i].crname == $("#roomSel").val() && ableRoom[i].crnum == $("#numSel").val()){
				$("#people").attr("max", ableRoom[i].crmaxpeople);
				alert("최대 인원은 " + ableRoom[i].crmaxpeople + "명 입니다.");
			}
		}

		var startday = $("#startday").val();
		console.log("startday : " + startday);
		var endday = $("#endday").val();
		console.log("endday : " + endday);
		var roomSel = $("#roomSel").val();
		console.log("roomSel : " + roomSel);
		var numSel = $("#numSel").val();
		console.log("numSel : " + numSel);
		var crprice = "";
		for(var i = 0; i < ableRoom.length; i++){
			if(ableRoom[i].crname == roomSel && ableRoom[i].crnum == numSel){
				crprice = ableRoom[i].crprice;
			}
		}
		console.log("crprice : " + crprice);
		$.ajax({
				type: "get",
				url: "checkTotalPrice",
				data: {
					"crprice": crprice,
					"startday": startday,
					"endday": endday
				},
				dataType: "json",
				async: false,
				success: function (result) {
					console.log(result);
					
					$("#totalPrice").text(result + "원");
					

				}
			});
	}
</script>
<script type="text/javascript">
	function cqsubmit(){
		if($("#cqmid").val().length > 0){
			$("#cqform").submit();
		}else{
			alert("로그인후 이용 바랍니다.");
			memberLogin();
		}
	}

	function modifyQuestionForm(cqcode){
		console.log("수정 하기");
		$("#"+cqcode+"_questionContents").removeAttr("readonly");
		$("#"+cqcode+"_questionContents").addClass("size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");
		var output = "";
		output += '<button class="btn btn-success m-r-10" onclick="modifyQuestion(\'' + cqcode + '\')">수정</button>';
		output += '<button class="btn btn-danger" onclick="cancelQuestion(\'' + cqcode + '\')">취소</button>'
		$("#"+cqcode+"_qustionBtn").html(output);
		
	}

	function cancelQuestion(cqcode){
		console.log("수정 취소");
		$("#"+cqcode+"_questionContents").attr("readonly", "readonly");
		$("#"+cqcode+"_questionContents").removeClass("size-110 bor8 stext-102 cl2 p-lr-20 p-tb-10");
		var output = "";
		output += '<button class="btn btn-success m-r-10" onclick="modifyQuestionForm(\'' + cqcode + '\')">확인</button>';
		output += '<button class="btn btn-danger" onclick="deleteQuestion(\'' + cqcode + '\')">삭제</button>';
		$("#"+cqcode+"_qustionBtn").html(output);
	}

	function modifyQuestionForm(){
		$("#"+cqcode+"_questionModify").submit();
	}

	function deleteQuestion(cqcode){

	}
</script>
<script type="text/javascript">
	var checkMsg = '${msg}';
	console.log(checkMsg.length);
	if (checkMsg.length > 0) {
		alert(checkMsg);
	}
</script>
</html>