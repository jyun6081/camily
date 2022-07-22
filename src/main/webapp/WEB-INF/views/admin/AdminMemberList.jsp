<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camily</title>
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
<!--===============================================================================================-->
<script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
</head>
<body class="animsition">

	<!-- TopBar-->
	<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp"%>
	<!-- End TopBar-->
	
	<!-- memberModal -->
	<%@ include file="/WEB-INF/views/member/memberModal.jsp"%>
	<!-- EndmemberModal -->

	<!-- <!-- Shoping Cart -->
		<!-- <div class="container">
			<div class="row">
				<div class="" >
					<div class="">
						<div class="wrap-table-shopping-cart">
						
                            
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">상품정보</th>
									<th class="column-2"></th>
									<th class="column-3">상품가격</th>
									<th class="column-4">상품수량</th>
									<th class="column-5">총금액</th>
									<th class="column-6">주문주소</th>
									<th class="column-7"></th>
								</tr>
								<tr class="table_row">
									<td class="column-1">
										<div class="how-itemcart1">
										</div>
									</td>
									<td class="column-2"></td>
									<td class="column-3"></td>
									<td class="column-4">개</td>
									<td class="column-5">원</td> 
									<td class="column-6"></td>
									<th class="column-7" > 
									</th>
								</tr>
							</table>
						</div>
	
					</div>
				</div>

			</div>
		</div>		 -->
 
		
	<section class="section-slide" style="margin-top: 100px;">
					<!-- Page Heading -->
				

					<!-- Content Row -->
					<div class="row" style="margin:0 auto; ">
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4" style="margin:0 auto; ">
						<h1 class="h3 mb-0 text-gray-800">관리자 회원관리 페이지 - AdminMemberList.jsp</h1>
					</div>
                      <div class="card shadow mb-8 col-sm-10" style="margin:0 auto; ">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
                        </div>
                        <div class="card-body" >
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">아이디</th>
                                            <th class="align-middle text-center font-weight-bold">이름</th>
                                            <th class="align-middle text-center font-weight-bold">생년월일</th>
                                            <th class="align-middle text-center font-weight-bold">이메일</th>
                                            <th class="align-middle text-center font-weight-bold">관리</th>  
                                        </tr>
                                    </thead>
                                   <!--  <tfoot>
                                        <tr>
                                            <th class="align-middle text-center font-weight-bold">아이디</th>
                                            <th class="align-middle text-center font-weight-bold">이름</th>
                                            <th class="align-middle text-center font-weight-bold">생년월일</th>
                                            <th class="align-middle text-center font-weight-bold">이메일</th>
                                            <th class="align-middle text-center font-weight-bold">관리</th>  
                                        </tr>
                                    </tfoot> -->
                                    <tbody>
                                  		<c:forEach items="${memberList }" var="member" >
	                                        <tr class="font-weight-bold">
	                                        	<td class="align-middle">
	                                        		${member.mid }
	                                        	</td>
	                                            <td class="align-middle font-weight-bold" >
	                                            	${member.mname }
	                                            </td>
	                                            <td class="align-middle font-weight-bold" >
	                                            	${member.mbirth }
	                                            </td>
	                                            <td class="align-middle">${member.memail }</td>
	                                            <td class="align-middle text-center">
	                                				<button class="btn btn-success font-weight-bold" onclick="adminMemberViewShow('${member.mid }')">
	                                    					상세정보
	                                				</button>                                            	
	                                            	
	                                            		<c:if test="${member.mstate == 'GN00' }">
	                                            			<button  class="btn btn-danger font-weight-bold" onclick="modifyMemberState(this,'${member.mid }')">중지됨</button>
	                                            		</c:if>
	                                            		<c:if test="${member.mstate == 'GN01' }">
	                                            			<button class="btn btn-primary font-weight-bold" onclick="modifyMemberState(this,'${member.mid }')">사용중</button>
	                                            		</c:if>
	                                            		<c:if test="${member.mstate == 'GN99' }">
	                                            			<button class="btn btn-warning font-weight-bold" onclick="modifyMemberState(this,'${member.mid }')">탈퇴됨</button>
	                                            		</c:if>
	                                            	
	                                            </td>
	                                        </tr>
	                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- Pagination 시작 -->
								<div class="flex-c-m flex-w w-full p-t-45" style="margin-top: auto; margin-right: auto;">
									<c:choose>
										<c:when test="${pageDto.page <= 1}">
											<span>[이전]</span>
										</c:when>
										<c:otherwise>
											<span><a href="adminMemberList?page=${pageDto.page - 1}">[이전]</a></span>
										</c:otherwise>
									</c:choose>
									<c:forEach begin="${pageDto.startPage }" end="${pageDto.endPage }" var="num" step="1">
										<c:choose>
											<c:when test="${pageDto.page == num}">
												<span><a href="#" class="flex-c-m how-pagination1 trans-04 m-all-7 active-pagination1">${num}</a></span>
											</c:when>
											<c:otherwise>
												<span><a href="adminMemberList?page=${num}" class="flex-c-m how-pagination1 trans-04 m-all-7">${num}</a></span>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pageDto.page > pageDto.endPage || pageDto.page == pageDto.maxPage}">
											<span>[다음]</span>
										</c:when>
										<c:otherwise>
											<span><a href="adminMemberList?page=${pageDto.page + 1}">[다음]</a></span>
										</c:otherwise>
									</c:choose>
								</div>
							<!-- Pagination 종료 -->
                        </div>
                    </div>	
                    </div>	
                    </section>
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- End of Footer -->
	    <!-- adminMvViewModal Modal-->
    <div class="modal fade" id="adminMemberViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" style="z-index: 1200" >
        <div class="modal-dialog" role="document" >
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
                           <label class="small mb-1" for="mid">아이디</label>
                           <input class="form-control" id="mid" name="mid" type="text"  readonly="readonly" value="">
                        </div>
						<div class="md-form mb-3">
                           <label class="small mb-1" for="mpw">비밀번호</label>
                           <input class="form-control" id="mpw" name="mpw" type="password"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="mname">이름</label>
                           <input class="form-control" id="mname" name="mname" type="text"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="mtel">전화번호</label>
                           <input class="form-control" id="mtel" name="mtel" type="text"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="memail">메일</label>
                           <input class="form-control" id="memail" name="memail" type="text"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="mbirth">생일</label>
                           <input class="form-control" id="mbirth" name="mbirth" type="date"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="maddr">주소</label>
                           <input class="form-control" id="maddr" name="maddr" type="text"  readonly="readonly" value="">
                        </div>
                        <div class="md-form mb-3">
                           <label class="small mb-1" for="mstate">상태</label>
                           <input class="form-control" id="mstate" name="mstate" type="text"  readonly="readonly" value="">
                        </div>
				</div>
			</div>
        </div>
    </div> 
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
		<script type="text/javascript">
		function modifyMemberState(btnObj, mid){
			console.log("아이디 : " + mid);
			console.log($(btnObj).text());
			if($(btnObj).hasClass("btn-primary")){
				var mstate = 'GN00';
			} else if($(btnObj).hasClass("btn-danger")){
				var mstate = 'GN01';
			} else if($(btnObj).hasClass("btn-warning")){
				var mstate = 'GN01';
			}
			console.log("mstate" + mstate);
			$.ajax({
				type : "get",
				url : "adminModifyMemberState",
				data : { "mid" : mid, "mstate" : mstate },
				success : function(result){
					console.log("result : " + result);
					if( result == '1' ){
						if( mstate == 'GN01'){
							$(btnObj).text("사용중");
							$(btnObj).removeClass("btn-warning");
							$(btnObj).removeClass("btn-danger");
							$(btnObj).addClass("btn-primary");
						} else if( mstate == 'GN00'){
							$(btnObj).text("중지됨");
							$(btnObj).removeClass("btn-primary");
							$(btnObj).addClass("btn-danger");
						}
						/* $(btnObj).toggleClass("btn-primary");
						$(btnObj).toggleClass("btn-danger"); */
					}
				}
			});
		}
		
		function adminMemberViewShow(mid){
			
			//ajax 회원 정보 조회
			$.ajax({
				url : "adminGetMemberInfo",
				type : "get",
				data : { "mid" : mid },
				dataType : "json",
				async:false,
				success: function(result){
					$("#mid").val(result.mid);
					$("#mpw").val(result.mpw);
					$("#mname").val(result.mname);
					$("#mtel").val(result.mtel);
					$("#memail").val(result.memail);
					$("#mbirth").val(result.mbirth);
					$("#maddr").val(result.maddr);
					$("#mstate").val(result.mstate);
					
				}
			});
			$("#adminMemberViewModal").modal('show');
		}
	
		$("#adminThViewModal").on('hide.bs.modal', function(){
			/* alert("모달창 닫히기 전!"); */
		});		

		$("#adminThViewModal").on('hidden.bs.modal', function(){
			/* alert("모달창 닫힌 후!"); */
		});
		
		$("#adminThViewModal").on('show.bs.modal', function(){
			/* alert("모달창 열리기 전!"); */
		});		
		
		$("#adminThViewModal").on('shown.bs.modal', function(){
			/* alert("모달창 열린 후!"); */
		});
	</script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>

		
</html>
