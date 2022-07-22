<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>

<style type="text/css">


</style>
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
					<form action="adminCampingRegister" method="post" enctype="multipart/form-data">
					<div class="row" style="margin:0 auto; ">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4 col-sm-6" style="margin:0 auto; ">
						<h1 class="h3 mb-0 text-gray-800">관리자 캠핑장 등록 페이지 - AdminCampingInsert.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-7" style="margin:0 auto; ">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">캠핑장 등록 </h6>
                            <input type="hidden" name="cacode" >
                        </div>
                        <div class="card-body" >
                           <div class="md-form mb-2">
							  <input type="text" class="form-control validate" name="caname" placeholder="캠핑장 이름">
						  </div>
						   <div class="md-form mb-2">
							  <input type="text" class="form-control validate" name="calinecontents" placeholder="캠핑장 한줄소개">
						  </div>
						  <div class="md-form mb-2">
							  <textarea class="form-control validate" name="cacontents" rows="15" cols="50" placeholder="캠핑장 소개"></textarea>
						  </div>
						  <div class="md-form mb-3">
							  <input type="text" class="form-control validate" name="cainfo" placeholder="캠핑장 시설정보 ex)전기,온수,놀이터">
						  </div>
						  <div class="md-form mb-2">
						      <label style="display:inline-block"><input type="checkbox" name="catype" value="일반야영장" style="display:inline-block" id="checkbox1">일반야영장</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="자동차야영장" style="display:inline-block" id="checkbox2">자동차야영장</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="글램핑" style="display:inline-block" id="checkbox3">글램핑</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="카라반" style="display:inline-block" id="checkbox4">카라반</label>
						  </div>
						  <div class="md-form mb-3">
						       <img src="" height="100px" id="preview">
							   <input type="file" id="updateCampingImg" name="cafile" onchange="readURL(this);"> 
						  </div>
						  
						  <div class="row mb-3">
						  <div class="col-sm-6 md-form mb-3">
							<input type="text" id="sample6_address"
								class="form-control validate address" placeholder="주소"
								name="maddress" onkeyup="test()">
						   </div>
						  	<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_execDaumPostcodeTest()" value="우편번호 찾기">
							</div>
						  </div>
						  
						  <p style="margin-top:-12px">
                          <em class="link">
                          </em>
                          </p>
						  <div id="map" style="width:100%;height:350px;"></div>
                            <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
                            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
                            </a>
						   <input type="hidden" id="inputCalatitude" name="calatitude">
						   <input type="hidden" id="inputCalongitude" name="calongitude">
						  
                        </div>
                        
                       <div class="modal-footer d-flex justify-content-center">
						<button class="btn-lg btn-dark" type="submit">등록하기</button>
					</div>
                    </div>	
                    </div>	
                    </form>
                    </section>
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
     function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var reader = new FileReader();
    	    reader.onload = function(e) {
    	      document.getElementById('preview').src = e.target.result;
    	    };
    	    reader.readAsDataURL(input.files[0]);
    	  } else {
    	    document.getElementById('preview').src = "";
    	  }
    	}
     </script>
     
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10d14c6ccf8a5da29debf326077676e3&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

/* // 주소로 좌표를 검색합니다
geocoder.addressSearch('인천광역시 경인로252번길 16', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
        console.log("위도 : " + result[0].y)
        console.log("경도 : " + result[0].x)
        
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});     */
</script>
<script type="text/javascript">
	function test() {
		var addr = $("#sample6_address").val();
		
		geocoder.addressSearch(addr , function(result, status) {
			
			if (status === kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				console.log("위도 : " + result[0].y);
		        console.log("경도 : " + result[0].x);
		        $("#inputCalatitude").val(result[0].y);
		        $("#inputCalongitude").val(result[0].x);
		        
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        map.setCenter(coords);
			}
			
		})
		
	}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcodeTest() {
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
						/* document.getElementById("sample6_extraAddress").value = extraAddr; */
						$(".extraAddr").val(extraAddr);

					} else {
					/* 	document.getElementById("sample6_extraAddress").value = ''; */
						$(".extraAddr").val('');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
				/* 	document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr; */
					$(".postcode").val(data.zonecode);
					$(".address").val(addr);
					test();
					// 커서를 상세주소 필드로 이동한다.
					/* document.getElementById("sample6_detailAddress")
							.focus(); */
					$(".detailAddress").focus();
				}
			}).open();
}

</script>
		
</html>
