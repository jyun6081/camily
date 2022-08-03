<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Admin | Camily</title>
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
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
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
		<form action="modifyCampingInfo" method="post"
			enctype="multipart/form-data">
			<div class="row" style="margin: 0 auto;">
				<div
					class="d-sm-flex align-items-center justify-content-between mb-4 col-sm-6"
					style="margin: 0 auto;">
					<h1 class="h3 mb-0 text-gray-800">관리자 캠핑장 상세 페이지 -
						AdminCampingInfo.jsp</h1>
				</div>
				<div class="card shadow mb-8 col-sm-7" style="margin: 0 auto;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">캠핑장 상세정보
							(${campingInfo.cacode })</h6>
						<input type="hidden" name="cacode" value="${campingInfo.cacode }">
					</div>
					<div class="card-body">
						<div class="md-form mb-2">
							<input type="text" class="form-control validate" name="caname"
								value="${campingInfo.caname }">
						</div>
						<div class="md-form mb-2">
							<input type="text" class="form-control validate"
								name="calinecontents" value="${campingInfo.calinecontents }">
						</div>
						<div class="md-form mb-2">
							<textarea class="form-control validate" name="cacontents"
								rows="15" cols="50">${campingInfo.cacontents }</textarea>
						</div>
						<div class="md-form mb-3">
							<input type="text" class="form-control validate" name="cainfo"
								value="${campingInfo.cainfo }">
						</div>
						<div class="md-form mb-2">
							<label style="display: inline-block"><input
								type="checkbox" name="catype" value="일반야영장"
								style="display: inline-block" id="checkbox1">일반야영장</label>&nbsp;
							<label style="display: inline-block"><input
								type="checkbox" name="catype" value="자동차야영장"
								style="display: inline-block" id="checkbox2">자동차야영장</label>&nbsp;
							<label style="display: inline-block"><input
								type="checkbox" name="catype" value="글램핑"
								style="display: inline-block" id="checkbox3">글램핑</label>&nbsp; <label
								style="display: inline-block"><input type="checkbox"
								name="catype" value="카라반" style="display: inline-block"
								id="checkbox4">카라반</label>
						</div>


						<div class="row">
							<div class="md-form mb-3">
								<c:set var="campIMG" value="${campingInfo.caimage}" />
								<c:choose>
									<c:when test="${fn:substring(campIMG,0,4) == 'http'}">
										<img src="${campingInfo.caimage }" height="100px" id="preview">
										<br>
										<br>
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/resources/caimageUpload/${campingInfo.caimage }"
											height="100px" id="preview">
										<br>
										<br>
									</c:otherwise>
								</c:choose>
								<input type="file" id="updateCampingImg" name="cafile"
									onchange="readURL(this);">
							</div>

							<!-- 해당 날짜에 가능한 객실 타입목록 표시 -->
							<div class="col-sm-6">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">객실타입</div>

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
									<div class="size-203 flex-c-m respon6">객실번호</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="numSel" id="numSel"
												onchange="checkRoomBtn()">
												<option>객실번호 선택</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<div class="text-right">
									<button class="btn-sm btn-primary mt-3" id="cpRoomStopBtn"
										type="button"
										onclick="modifyCpRoomState(this,'${campingInfo.cacode}')">객실상태</button>
									<button class="btn-sm btn-info" type="button"
										onclick="modifyCpRoomForm();">객실수정</button>
									<button class="btn-sm btn-success" type="button"
										onclick="addCpRoomForm('${campingInfo.cacode}');">객실추가</button>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn-lg btn-dark" type="submit">수정하기</button>
					</div>
				</div>
			</div>
		</form>
	</section>



  <!-- 객실 수정 modal -->
	<form action="modifyCpRoomInfo" method="post" id="modifyCpRoom"
		enctype="multipart/form-data">
		<div class="modal fade" id="modifyCpRoomModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1500">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width: 35%">
						</a>
					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-3">
							<input type="text" class="form-control validate" name="crcacode"
								readonly="readonly" value="${campingInfo.cacode }"> <span
								id="idCheckMsg" style="font-size: 13px"></span>
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="cpRoomInfo_crname" readonly="readonly"
									name="crname" class="form-control validate detailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="cpRoomInfo_crnum" readonly="readonly"
									name="crnum" class="form-control validate extraAddr">
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4 md-form mb-3">
								<span>가격</span> <input type="text" id="cpRoomInfo_crprice"
									name="crprice" class="form-control validate detailAddr">
							</div>
							<div class="col-sm-4 md-form mb-3">
								<span>최소 인원</span> <input type="text"
									id="cpRoomInfo_crstnpeople" name="crstnpeople"
									class="form-control validate extraAddr">
							</div>
							<div class="col-sm-4 md-form mb-3">
								<span>최대 인원</span> <input type="text"
									id="cpRoomInfo_crmaxpeople" name="crmaxpeople"
									class="form-control validate extraAddr">
							</div>
						</div>

						<div class="md-form mb-3">
							<img id="cpRoomInfo_crimage" height="100px" class="mb-3"> <input
								type="file" onchange="modifyCpRoomImage(this);" name="crfile">
						</div>

					</div>

					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-info" type="submit">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
	  <!-- 객실 추가 modal -->
	<form action="adminAddCpRoom" method="post" id="addCpRoom"
		enctype="multipart/form-data">
		<div class="modal fade" id="addCpRoomModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 1500">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width: 35%">
						</a>
					</div>
					<div class="modal-body mx-3">
						<div class="md-form mb-3">
							<input type="text" class="form-control validate" name="crcacode"
								readonly="readonly" value="${campingInfo.cacode }"> <span
								id="idCheckMsg" style="font-size: 13px"></span>
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
							 <span>객실타입</span>
								<input type="text" id="cpRoomAdd_crname"
									name="crname" class="form-control validate detailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<span>가격</span> <input type="text" id="cpRoomInfo_crprice"
									name="crprice" class="form-control validate detailAddr">
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<span>최소 인원</span> <input type="text"
									id="cpRoomInfo_crstnpeople" name="crstnpeople"
									class="form-control validate extraAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<span>최대 인원</span> <input type="text"
									id="cpRoomInfo_crmaxpeople" name="crmaxpeople"
									class="form-control validate extraAddr">
							</div>
						</div>

						<div class="md-form mb-3">
							<img id="cpRoomAdd_crimage" height="100px" class="mb-3"> 
							<input type="file" onchange="addCpRoomImage(this);" name="crfile" id="roomImg">
						</div>

					</div>

					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-info" type="submit">등록하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
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
$('.modal').on('hidden.bs.modal', function (e) {
	console.log("관리자 모달창 초기화!");
	$("#modifyCpRoom")[0].reset();
	$("#addCpRoom")[0].reset();
   });


     function modifyCpRoomImage(input) {
      	  if (input.files && input.files[0]) {
      	    var reader = new FileReader();
      	    reader.onload = function(e) {
      	      document.getElementById('cpRoomInfo_crimage').src = e.target.result;
      	    };
      	    reader.readAsDataURL(input.files[0]);
      	  } else {
      	    document.getElementById('cpRoomInfo_crimage').src = "";
      	  }
      	}
     
     function addCpRoomImage(input) {
     	  if (input.files && input.files[0]) {
     	    var reader = new FileReader();
     	    reader.onload = function(e) {
     	      document.getElementById('cpRoomAdd_crimage').src = e.target.result;
     	    };
     	    reader.readAsDataURL(input.files[0]);
     	  } else {
     	    document.getElementById('cpRoomAdd_crimage').src = "";
     	  }
     	}
</script>
<script type="text/javascript">
$(document).ready(function(){
	var catype = '${campingInfo.catype}';
	console.log(catype);
	var catype_list = catype.split(",");
	console.log(catype_list);
	for(var i = 0; i<catype_list.length; i++){
		if(catype_list[i] == '일반야영장'){
			$("#checkbox1").attr("checked","checked")
		} else if(catype_list[i] == '자동차야영장'){
			$("#checkbox2").attr("checked","checked")
		} else if(catype_list[i] == '글램핑'){
			$("#checkbox3").attr("checked","checked")
		} else if(catype_list[i] == '카라반'){
			$("#checkbox4").attr("checked","checked")
		}
		
	}
});
</script>

<script type="text/javascript">
var ableRoom = [];
var crname = "";
var crimage = "";
var crprice = "";
var crstnpeople = "";
var crmaxpeople = "";
var crnum = "";
$(document).ready(function(){
	var cacode = '${campingInfo.cacode}';
	console.log("cacode : " + cacode);
		$.ajax({
			type: "get",
			url: "adminCheckRoomType",
			data: {
				"cacode": cacode
			},
			dataType: "json",
			async: false,
			success: function (result) {
				ableRoom = result;
				console.log(result);

				var roomtype = [];


				for (var i = 0; i < result.length; i++) {
					// console.log(roomtype.includes(result[i].crname));
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
				console.log(roomtype);
				var output = '<option>캠핑장 종류 선택</option>';
				for (var i = 0; i < roomtype.length; i++) {
					output += '<option value="' + roomtype[i] + '">' + roomtype[i] + '</option>'
				}
				output += '<option value="add">객실추가</option>'
				$("#roomSel").html(output);
			}
		})

});

function checkRoomNum() {
	var roomSel = $("#roomSel").val();
	console.log("roomSel : " + roomSel);
	console.log(ableRoom);
	var output = "<option>객실번호 선택</option>";
	for (var i = 0; i < ableRoom.length; i++) {
		console.log("ableRoom[i].crname : " + ableRoom[i].crname);
		if (ableRoom[i].crname == roomSel) {
			console.log(roomSel);
			output += '<option value="' + ableRoom[i].crnum + '">' + ableRoom[i].crnum + '</option>'
			
		}
	}
	
	$("#numSel").html(output);
	$("#cpRoomStopBtn").removeClass("btn-primary");
	$("#cpRoomStopBtn").removeClass("btn-danger");
	$("#cpRoomStopBtn").addClass("btn-warning");
	$("#cpRoomStopBtn").text("선택중");
	$("#cpRoomStopBtn").attr("onclick", "");
}

 function checkRoomBtn(){
	console.log("객실버튼 조회")
	var checkRoom = $("#roomSel").val();
	console.log($("#roomSel").val());
	var checkNum = $("#numSel").val();
	console.log($("#numSel").val());
	for(var i = 0; i<ableRoom.length; i++){
		if(ableRoom[i].crname == checkRoom && ableRoom[i].crnum == checkNum){
			console.log("crstate : " + ableRoom[i].crstate);
			
			crimage = ableRoom[i].crimage;
			crprice = ableRoom[i].crprice;
			crstnpeople = ableRoom[i].crstnpeople;
			crmaxpeople = ableRoom[i].crmaxpeople;
			crname = ableRoom[i].crname;
			crnum = ableRoom[i].crnum;
			
			if(ableRoom[i].crstate == '0'){
				console.log("객실사용")
				$("#cpRoomStopBtn").text("중지됨")
				$("#cpRoomStopBtn").removeClass("btn-warning"); 
				$("#cpRoomStopBtn").removeClass("btn-primary")
		    	$("#cpRoomStopBtn").addClass("btn-danger");
		        $("#cpRoomStopBtn").attr("onclick", "modifyCpRoomState(this,'${campingInfo.cacode}')"); 
			} else{
				console.log("객실중지")
				$("#cpRoomStopBtn").text("사용중")
				$("#cpRoomStopBtn").removeClass("btn-warning"); 
				$("#cpRoomStopBtn").removeClass("btn-danger");
		    	$("#cpRoomStopBtn").addClass("btn-primary");
		        $("#cpRoomStopBtn").attr("onclick", "modifyCpRoomState(this,'${campingInfo.cacode}')"); 
			}
			
			
		}
	}
	/*
	console.log("ableRoom.crstate : " + ableRoom.crstate)
	    if(ableRoom.crstate == '0'){
	    	console.log("객실사용")
		  $("#cpRoomStopBtn").text("객실사용")
	    } else {
	    	console.log("객실중지")
	 	  $("#cpRoomStopBtn").text("객실중지")
	    }
	*/
	var cacode = '${campingInfo.cacode}';
	$.ajax({
		type: "get",
		url: "adminCheckRoomType",
		data: {
			"cacode": cacode
		},
		dataType: "json",
		async: false,
		success: function (result) {
			ableRoom = result;
		}
	});

} 

function modifyCpRoomState(btnObj,cacode){
	var cpRoomSel = $("#roomSel").val();
	var cpNumSel = $("#numSel").val();
	console.log(cacode);
	console.log(cpRoomSel);
	console.log(cpNumSel);
	
	if( $(btnObj).hasClass("btn-primary") ){
		 var crstate = '0';
	 } else if ( $(btnObj).hasClass("btn-danger") ){
		 var crstate = '1';
	 }
	
 	$.ajax({
		type : "get",
		url : "modifyCpRoomState",
		data : {"crname" : cpRoomSel, "crnum" : cpNumSel, "crcacode" : cacode, "crstate" : crstate},
		success: function (result) {
			console.log(result)
			
			if(result == 1){
			  alert("객실 상태가 변경되었습니다.");
			  window.location.href = "${pageContext.request.contextPath}/adminCampingInfo?cacode=" + cacode;
			} else {
				alert("객실을 선택해주세요.")
			}
			 /* if(result == 1){
					$(btnObj).toggleClass("btn-primary");
					$(btnObj).toggleClass("btn-danger");
					
					if( crstate == '0'){
						$(btnObj).text("중지됨")
					} else if (crstate == '1'){
						$(btnObj).text("이용중")
					}
			 } */
			
			
		}
		
	}) 
	
}

</script>

<script type="text/javascript">
function modifyCpRoomForm(){
	
	if($("#roomSel").val() == "캠핑장 종류 선택" || $("#numSel").val() == "객실번호 선택"){
		alert("객실을 선택해주세요!")
	} else {
	    $("#modifyCpRoomModal").modal("show");
	    console.log("crimage : " + crimage);
	    console.log("crprice : " + crprice);
	    console.log("crstnpeople : " + crstnpeople);
	    console.log("crmaxpeople : " + crmaxpeople);
	    console.log("crname : " + crname);
	    
	    $("#cpRoomInfo_crname").val(crname);
	    $("#cpRoomInfo_crnum").val(crnum);
	    $("#cpRoomInfo_crprice").val(crprice);
	    $("#cpRoomInfo_crstnpeople").val(crstnpeople);
	    $("#cpRoomInfo_crmaxpeople").val(crmaxpeople);
	    
	    console.log(crimage.substring(0,4));
	    if (crimage.substring(0,4) == "http"){
	      $("#cpRoomInfo_crimage").attr("src", crimage);
	    } else {
	    	$("#cpRoomInfo_crimage").attr("src", "${pageContext.request.contextPath}/resources/caimageUpload/"+crimage);	
	    }
	}
}

function addCpRoomForm(cacode){
	var roomSel = $("#roomSel").val();
	console.log("roomSel : " + roomSel);
	if(roomSel == "add" || roomSel == "캠핑장 종류 선택"){
		$("#cpRoomAdd_crname").val("");
		$("#cpRoomAdd_crname").removeAttr("readonly");
		$("#cpRoomAdd_crimage").attr("src", "");
		$("#roomImg").removeAttr("disabled");
	}else{
		$("#cpRoomAdd_crname").val(roomSel);
		$("#cpRoomAdd_crname").attr("readonly","readonly");

		$.ajax({
		type: "get",
		url: "getRoomImage",
		data: {"cacode": cacode, "roomSel": roomSel},
		dataType: "json",
		async: false,
		success: function(result){
			console.log(result);
			$("#cpRoomAdd_crimage").attr("src", result.crimage);
			$("#roomImg").attr("disabled","disabled");
		}
		});
	}
	$("#addCpRoomModal").modal("show");
}

</script>



</html>
