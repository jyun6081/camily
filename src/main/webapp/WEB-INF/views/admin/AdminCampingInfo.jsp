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
					<form action="modifyCampingInfo" method="post" enctype="multipart/form-data">
					<div class="row" style="margin:0 auto; ">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4 col-sm-6" style="margin:0 auto; ">
						<h1 class="h3 mb-0 text-gray-800">관리자 캠핑장 상세 페이지 - AdminCampingInfo.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-7" style="margin:0 auto; ">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">캠핑장 상세정보 (${campingInfo.cacode })</h6>
                            <input type="hidden" name="cacode" value="${campingInfo.cacode }">
                        </div>
                        <div class="card-body" >
                           <div class="md-form mb-2">
							  <input type="text" class="form-control validate" name="caname" value="${campingInfo.caname }">
						  </div>
						   <div class="md-form mb-2">
							  <input type="text" class="form-control validate" name="calinecontents" value="${campingInfo.calinecontents }">
						  </div>
						  <div class="md-form mb-2">
							  <textarea class="form-control validate" name="cacontents" rows="15" cols="50">${campingInfo.cacontents }</textarea>
						  </div>
						  <div class="md-form mb-3">
							  <input type="text" class="form-control validate" name="cainfo" value="${campingInfo.cainfo }">
						  </div>
						  <div class="md-form mb-2">
						      <label style="display:inline-block"><input type="checkbox" name="catype" value="일반야영장" style="display:inline-block" id="checkbox1">일반야영장</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="자동차야영장" style="display:inline-block" id="checkbox2">자동차야영장</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="글램핑" style="display:inline-block" id="checkbox3">글램핑</label>&nbsp;
                              <label style="display:inline-block"><input type="checkbox" name="catype" value="카라반" style="display:inline-block" id="checkbox4">카라반</label>
						  </div>
						  <div class="md-form mb-3">
						       <c:set var="campIMG" value="${campingInfo.caimage}" />
						       <c:choose>
						         <c:when test="${fn:substring(campIMG,0,4) == 'http'}">
						             <img src="${campingInfo.caimage }" height="100px" id="preview"><br> <br>
						         </c:when>
						         <c:otherwise>
							        <img src="${pageContext.request.contextPath}/resources/caimageUpload/${campingInfo.caimage }" height="100px" id="preview"><br> <br>
						         </c:otherwise>
						       </c:choose>
							   <input type="file" id="updateCampingImg" name="cafile" onchange="readURL(this);"> 
						  </div>
                        </div>
                        
                       <div class="modal-footer d-flex justify-content-center">
						<button class="btn-lg btn-dark" type="submit">수정하기</button>
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



		
</html>
