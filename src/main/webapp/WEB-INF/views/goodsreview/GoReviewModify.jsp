<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camily - 게시글수정</title>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/summernote-lite.js"></script>
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>
<title>글쓰기</title>

<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 작성하세요',
	        minHeight: 400,
	        maxHeight: 400,
	        focus: true, 
	        lang : 'ko-KR',
	        toolbar: [
    		    // [groupName, [list of button]]
    		    ['fontname', ['fontname']],
    		    ['fontsize', ['fontsize']],
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    ['color', ['forecolor','color']],
    		    ['table', ['table']],
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    ['height', ['height']],
    		    ['insert',['picture','link','video']],
    		    ['view', ['fullscreen', 'help']]
    		  ],
    	fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],

	  });
	});
</script>
	<!--===============================================================================================-->

</head>
	
<body class="animsition">

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/TopBar.jsp"%>


	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92"
		style="background-image: url('resources/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">캠핑용품 후기 게시판</h2>
	</section>


	<!-- Content page -->
	<section class="bg0 p-t-62 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<h2 style="text-align: center;">후기글 수정</h2>
					<br> 
					<div style="width: 100%; margin: auto;">
						<form method="post" action="goReviewModifyForm">
							<input type="hidden" name="gorvcode" value="${goodsReview.gorvcode }">
							<input type="hidden" name="gorvmid" value="${goodsReview.gorvmid }">
							<input type="text" name="gorvtitle" value="${goodsReview.gorvtitle }" style="width: 40%;"/> <br>
							<textarea id="summernote"  name="gorvcontents">${goodsReview.gorvcontents}</textarea>
							<br>
							<input id="subBtn" type="button" class="btn btn-info pull-right" value="글 작성"
								style="float: right;" onclick="goWrite(this.form)" />
						</form>
					</div>


					<div class="p-r-45 p-r-0-lg">
						<!-- item blog -->
						<div class="p-b-63"></div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>



	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

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
		src="${pageContext.request.contextPath}/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	

	<script>
		function goWrite(form) {
			var title = form.gorvtitle.value;
			var content = form.gorvcontents.value;
			

			if (title.trim() == '') {
				alert("제목을 입력해주세요");
				return false;
			}
			
			if (content.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			form.submit();
		}
	</script>
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>
</body>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
</html>