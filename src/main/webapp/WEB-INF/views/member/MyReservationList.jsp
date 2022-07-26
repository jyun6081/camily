<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>캠핑장 예약 상세보기</title>
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
.section-reply-title {
	/* margin-bottom: 30px; */
	/* padding-top: 40px; */
    text-align: center;
}

.section-reply-title h5 {
	color: #000000;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h6 {
	color: #848484;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
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
	
	<c:set var="today" value="<%=new Date() %>"></c:set>
	<!-- End of Topbar -->
	<form class="bg0 p-t-35 p-b-85">
		<div class="section-reply-title">
								<h5>캠핑예약내역⛺</h5><h6>캠핑예약 내역을 확인하세요!</h6>
						</div>
						<c:forEach items="${myReservationList}" var="myReservationInfo">
						<div class="col-9" style="padding-top: 30px; margin: auto; font-family: Poppins-Bold;">
                        <div class="bg-light rounded h-100 p-4">                       
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col" style="border-top : none;">예약번호</th>
                                            <th scope="col" style="border-top : none;">캠핑장 이름</th>
                                            <th scope="col" style="border-top : none;">예약타입</th>
                                            <th scope="col" style="border-top : none;">에약일자</th>
                                            <th scope="col" style="border-top : none;">결제금액</th>
                                            
                                            <th scope="col" style="border-top : none;"></th>
                                           
									 
								
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                        	<td>
                                            <a href="myReservation?recode=${myReservationInfo.recode}">
												${myReservationInfo.recode}
											</a>
											</td>
                                            <td>${myReservationInfo.caname}</td>
                                            <td>${myReservationInfo.recrname} ${myReservationInfo.recrnum}</td>
                                            <td>${myReservationInfo.startday} ~ ${myReservationInfo.endday}</td>
                                            <td>${myReservationInfo.formatsum}원</td>
                                            <td><a href="cpWrite?recacode=${myReservationInfo.recacode }&recode=${myReservationInfo.recode}"
									 class="flex-c-m stext-101 cl0 size-80 bg1 bor1 hov-btn1 trans-04">후기작성</a></td>
                                            				
                                        </tr> 
                                        <c:if test="${fn:length(myReservationList) == 0}">
									<tr class="table_row">
										<th colspan="5" style="text-align: center;"> 예약내역이 존재하지 않습니다.</th>
									</tr>
								</c:if>                                                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                    </div>
                    
                
                    </c:forEach>
		
		
		<%-- <div class="container">
			<div class="m-lr-auto m-b-50">
				<div class="m-l-25 m-r--38 m-lr-0-xl">
					<div class="wrap-table-shopping-cart">
						<table class="table-shopping-cart">
							<tbody>
								<tr class="table_head">
									<th class="column-1">예약번호</th>
									<th class="column-2">캠핑장 이름</th>
									<th class="column-3">예약타입</th>
									<th class="column-4">에약일자</th>
									<th class="column-5">결제금액</th>
								</tr>
								<c:if test="${fn:length(myReservationList) == 0}">
									<tr class="table_row">
										<th colspan="5" style="text-align: center;"> 예약내역이 존재하지 않습니다.</th>
									</tr>
								</c:if>
								<c:forEach items="${myReservationList}" var="myReservationInfo">
									<tr class="table_row" style="height: 50px;" id="">
										<td class="column-1" style="padding-bottom: 0px;">
											<a href="myReservation?recode=${myReservationInfo.recode}">
												${myReservationInfo.recode}
											</a>
										</td>
										<td class="column-2" style="padding-bottom: 0px;">${myReservationInfo.caname}</td>
										<td class="column-3" style="padding-bottom: 0px;">${myReservationInfo.recrname} ${myReservationInfo.recrnum}</td>
										<td class="column-4" style="padding-bottom: 0px;">
											${myReservationInfo.startday} ~ ${myReservationInfo.endday}
										</td>
										<td class="column-5" style="padding-bottom: 0px;">${myReservationInfo.totalprice}원</td>
									</tr>
									<a href="cpWrite?recacode=${myReservationInfo.recacode }&recode=${myReservationInfo.recode}" style="margin-top: 100px"
									 class="flex-c-m stext-101 cl5 size-80 bg2 bor1 hov-btn1 p-lr-15 trans-04">후기</a>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div> --%>
	</form>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

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


</html>