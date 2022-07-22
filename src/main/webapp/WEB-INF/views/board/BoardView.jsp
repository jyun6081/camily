<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camily - 게시판상세보기</title>
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
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--===============================================================================================-->
<script src="https://kit.fontawesome.com/d70fa0d402.js"
	crossorigin="anonymous"></script>
<style type="text/css">
#bobtn {
	text-align: right;
}

.section-reply-title {
	margin-bottom: 30px;
}

.section-reply-title h5 {
	color: black;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Oswald", sans-serif;
}

.section-reply-title h5:after {
	position: absolute;
	left: 0;
	top: -6px;
	height: 32px;
	width: 4px;
	background: #ff8000;
	content: "";
}

.reply-item {
	overflow: hidden;
	margin-bottom: 15px;
}

.reply-item-text {
	overflow: hidden;
	background: #f5f5f9;
	padding: 18px 30px 16px 20px;
	border-radius: 10px;
	margin-bottom: 15px;
}

.reply-item-text h6 {
	color: black;
	font-weight: 700;
	margin-bottom: 10px;
}

.reply-item-text span {
	color: black;
	font-weight: 700;
}

.reply-item-text p {
	color: black;
	line-height: 23px;
	margin-bottom: 0;
	font-size: 15px;
	font-family: "Mulish", sans-serif;
	font-weight: 500;
	margin: 0 0 15px 0;
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

	<!-- Content page -->
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-45 p-r-0-lg">

						<h4 class="ltext-109 cl2 p-b-28">${boardView.botitle }</h4>

						<div class="p-t-32">
							<span class="flex-w flex-m stext-111 cl2 p-b-19"> <span>
									<span> <i class="fa-regular fa-user"></i>
										${boardView.bomid }
								</span> <span class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> <i class="fa-regular fa-calendar"></i>
									${boardView.bodate } <span class="cl12 m-l-4 m-r-6">|</span>
							</span> <span> <i class="fa-regular fa-eye"></i> 조회수
									${boardView.bohits }
							</span>
							</span>
							<hr>
							<div>
								<p class="stext-117 cl6 p-b-26">${boardView.bocontents }</p>
							</div>


							  <div id="bobtn">
								<c:if test="${boardView.bomid == sessionScope.loginId}">
								<button class="btn btn-dark"  onclick="boardModify('${boardView.bocode }')">수정</button> 
								<button class="btn btn-dark"  onclick="boardDelete('${boardView.bocode }')">삭제</button>
								</c:if>	
							 </div> 
						</div>

						<!--  -->
						<div class="p-t-40">

							<hr>
							<div class="section-reply-title">
								<h5>댓글</h5>
							</div>
							<div class="reply-item" id="replyList">
								<c:forEach items="${replyList }" var="reply">
									<div class="reply-item-text">
										<h6>
											<i class="fa-regular fa-user"></i> ${reply.rpmid } - <span>
												<i class="fa-regular fa-calendar"></i> ${reply.rpdate }
											</span>
										</h6>
										<p>${reply.rpcontents }</p>
											<button type="button" class="btn btn-outline-success"
												id="${reply.rpcode }" onclick="replyModifyInfo('${reply.rpcode }')">수정</button>
											<button type="button" class="btn btn-outline-success"
												id="${reply.rpcode }" onclick="replyDelete()">삭제</button>	
									</div>

								</c:forEach>
							</div>
							<input type="hidden" name="rpbocode" value="${boardView.bocode }">
							<div class="bor19 m-b-20">
								<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
									name="rpcontents" id="contents" placeholder="댓글작성하기..."></textarea>
							</div>
							<button type="button" class="btn btn-outline-secondary m-2"
								onclick="replyWrite()">댓글작성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="modal fade" id="replyInfoModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 1200">
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
							 <input class="form-control" id="rpcode" name="rpcode" type="hidden" readonly="readonly">
						</div>
						
						<div class="md-form mb-3">
							<label class="small mb-1" for="rpmid">댓글 작성자</label> <input
								class="form-control" id="rpmid" name="rpmid" type="text"
								readonly="readonly">
						</div>							
						
						<div class="md-form mb-3">
							<label class="small mb-1" for="rpdate">댓글 작성일</label> <input class="form-control"
								id="rpdate" name="rpdate" type="text" readonly="readonly">
						</div>

						<div class="md-form mb-3">
							<label class="small mb-1" for="rpcontents">댓글 내용</label> <textarea 
								id="rpcontents" class="form-control validate" name="rpcontents"
								readonly="readonly"></textarea>
						</div>

					</div>
					
					<div class="modal-footer d-flex justify-content-center">	
						<button class="btn btn-dark" id="modifyFormDelete_Btn" type="button"
							onclick="replyModify()">수정하기</button>			
					</div>
					
				</div>
		</div>
	</div>
	
	<!-- Footer -->
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
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if (checkMsg.length > 0) {
			alert(checkMsg);
		}
	</script>
	<script type="text/javascript">
		function boardModify(bocode) {
			var modifyCheck = confirm("게시글을 수정하시겠습니까?");
			if (modifyCheck == true) {
				location.href = "boardModify?bocode=${boardView.bocode }"
			} else {
				return;
			}
		}
	</script>

	<script type="text/javascript">
		function boardDelete(bocode) {
			var delectCheck = confirm("게시글을 삭제하시겠습니까?");
			if (delectCheck == true) {
				location.href = "boardDelete?bocode=${boardView.bocode }"
			} else {
				return;
			}
		}
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			selectReplyList();

		});

		function selectReplyList(bocode) {
			console.log("selectReplyList() 호출");
			var bocode = '${boardView.bocode}';
			console.log("bocode : " + bocode);

			$
					.ajax({
						type : "get",
						url : "replyList",
						data : {
							"bocode" : bocode
						},
						dataType : "json",
						async : false,
						success : function(result) {
							var output = "";
							console.log(result);
							for (var i = 0; i < result.length; i++) {
								output += '<div class="reply-item">';
								output += '<div class="reply-item-text">';
								output += '<h6>';
								output += '<i class="fa-regular fa-user"></i> ' + result[i].rpmid + ' -';
								output += '<span>';
								output += ' <i class="fa-regular fa-calendar"></i> ' + result[i].rpdate + '';
								output += '</span>';
								output += '</h6>';	
								output += '<p>' + result[i].rpcontents + '</p>';
								if (result[i].rpmid == "${sessionScope.loginId}") {
								output += '<button type="button" class="btn btn-dark" id="' + result[i].rpcode + '" onclick="replyModifyInfo(' + result[i].rpcode + ')">수정</button>';
								output += '<button type="button" class="btn btn-dark" id="' + result[i].rpcode + '" onclick="replyDelete(' + result[i].rpcode + ',' + result[i].bocode + ')">삭제</button>';
								}
								output += '</div>';
								output += '</div>';
							}

							$("#replyList").html(output);
						}
					});

		}
	</script>

	<script type="text/javascript">
		function replyWrite() {
			console.log("replyWrite() 호출");
			var rpbocode = '${boardView.bocode}';
			var rpmid = '${sessionScope.loginId}';
			var rpcontents = $("#contents").val();

			if (rpmid == "") {
				alert("로그인후 이용 해주세요.");
				return;
			} else if (rpcontents == "") {
				alert("내용을 입력해주시요.");
			}

			$.ajax({
				type : "get",
				url : "replyWrite",
				data : {
					"rpbocode" : rpbocode,
					"rpmid" : rpmid,
					"rpcontents" : rpcontents
				},
				async : false,
				dataType : "json",
				success : function(result) {
					$("#contents").val("");
					alert("댓글이 등록되었습니다.");
					selectReplyList();
				}

			});

		}
	</script>


	<script type="text/javascript">
		function replyDelete(delRno) {
			console.log("replyDelete() 호출");
			console.log("delRno : " + delRno);
			var replyDelete_check = confirm("댓글을 삭제하시겠습니까?");

			if (replyDelete_check == true) {
				$.ajax({
					type : "get",
					url : "replyDelete",
					data : {
						"delRno" : delRno
					},
					async : false,
					dataType : "json",
					success : function(result) {
						selectReplyList();
						alert("댓글이 삭제 되었습니다.");
					}
				});
			}

		}
	</script>
	
	<script type="text/javascript">
	function replyModifyInfo(rpcode){
			console.log(rpcode);
			
			$.ajax({
				url : "replyModifyInfo",
				type : "get",
				data : { "rpcode" : rpcode },
				dataType : "json",
				async:false,
				success: function(result){
					console.log(result);
					$("#rpcode").attr("readonly","readonly");
					$("#rpmid").attr("readonly","readonly");
					$("#rpdate").attr("readonly","readonly");
					$("#rpcontents").removeAttr("readonly");
					$("#modifyFormDelete_Btn").addClass("btn_dNone");
					
					$("#rpcode").val(result.rpcode);
					$("#rpmid").val(result.rpmid);
					$("#rpdate").val(result.rpdate);
					$("#rpcontents").val(result.rpcontents);
					replyInfoVal = result;
				}
			});
			$("#replyInfoModal").modal('show');
		}
		var replyInfoVal = "";
		
		function replyModify(){
			var rpcode = $("#rpcode").val();
			var rpmid = $("#rpmid").val();
			var rpdate = $("#rpdate").val();
			var rpcontents = $("#rpcontents").val();
			console.log(rpcode);
			console.log(rpmid);
			console.log(rpdate);
			console.log(rpcontents);
			
			
			$.ajax({
				url : "replyModify",
				type : "get",
				data : { "rpcode" : rpcode, "rpmid" : rpmid, "rpdate" : rpdate, "rpcontents" : rpcontents },
				async:false,
				success: function(result){
					console.log(result);
					replyInfoVal.rpcode = rpcode;
					replyInfoVal.rpmid = rpmid;
					replyInfoVal.rpdate = rpdate;
					replyInfoVal.rpcontents = rpcontents;
					alert("정보가 수정 되었습니다.");
					$("#replyInfoModal").modal('hide');
					selectReplyList();
				}
			});
		}
		</script>
</body>
</html>