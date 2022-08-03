<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<!-- 회원가입 모달 -->
	<form action="memberJoin" method="post" id="joinForm"
		onsubmit="return memberCheck()">
		<div class="modal fade" id="JoinModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
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
							<input type="text" id="inputMid" class="form-control validate"
								placeholder="아이디" name="mid"
								onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');">
							<span id="idCheckMsg" style="font-size: 13px"></span>
						</div>

						<div class="md-form mb-3">
							<input type="password" id="inputMpw"
								class="form-control validate" placeholder="비밀번호" name="mpw">
						</div>
						<div class="md-form mb-3">
							<input type="password" id="inputMpwCheck"
								class="form-control validate" placeholder="비밀번호 확인"> <span
								id="pwCheckMsg" style="font-size: 13px"></span>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="inputMname" class="form-control validate"
								placeholder="이름" name="mname"
								onkeyup="this.value=this.value.replace(/[^ㄱ-ㅎ|가-힣]/g,'');">
							<span id="nameCheckMsg" style="font-size: 13px"></span>
						</div>
						<div class="md-form mb-3">
							<input type="number" id="inputMtel" class="form-control validate"
								placeholder="전화번호 / 숫자만 입력해주세요" name="mtel">
						</div>
						<div class="row">
							<div class="col-sm-8 md-form mb-3">
								<input type="email" id="inputMemail"
									class="form-control validate" placeholder="이메일" name="memail">
								<input type="hidden" id="inputCheckNum"
									class="form-control validate" placeholder="인증번호 입력"> <span
									id="emailCheckMsg"></span>
							</div>

							<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark" type="button"
									id="mail_check_button">인증번호 발송</button>
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="date" id="inputBirth"
								class="form-control validate date_empty placeholder-date"
								name="mbirth" data-placeholder="생년월일">
						</div>
						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_postcode"
									class="form-control validate postcode" placeholder="우편번호"
									name="mpostcode">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
						<div class="md-form mb-3">
							<input type="text" id="sample6_address"
								class="form-control validate address" placeholder="주소"
								name="maddress">
						</div>

						<div class="row">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_detailAddress"
									class="form-control validate detailAddr" placeholder="상세주소"
									name="mdetailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_extraAddress"
									class="form-control validate extraAddr" placeholder="참고항목"
									name="mextraAddr"> <input class="form-control validate"
									type="hidden" id="inputKakaokey" name="mkakaokey">
							</div>
						</div>
					</div>

					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-dark" type="submit">회원가입</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 회원가입 모달 끝 -->

	<!-- 로그인 모달 -->
	<form action="memberLogin" method="post">
		<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog"
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
							alt="IMG-LOGO" style="width: 50%">
						</a>
					</div>
					<div class="modal-body mx-3">

						<div class="md-form mb-3">
							<input type="text" class="form-control validate loginInput"
								placeholder="아이디" name="mid">
						</div>

						<div class="md-form mb-3">
							<input type="password" class="form-control validate loginInput"
								placeholder="비밀번호" name="mpw" onkeyup="checkCapsLock(event)">
							<span id="capslockCheckMsg"></span>
						</div>
						<div class="md-form mb-1 text-center">
							<button class="btn btn-dark">로그인</button>
							<br> <br> <a class="small" id="kakaoLoginBtn"></a>
						</div>
						<div class="md-form mb-1 text-center">
							<a href="#" onclick="findIdForm();">아이디 찾기</a> | <a href="#"
								onclick="findPwForm();">비밀번호 찾기</a> | <a href="#"
								onclick="memberJoin();">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 로그인 모달 끝 -->

	<!-- 내정보 모달 -->

	<div class="modal fade" id="InfoModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 1200">
		<div class="modal-dialog" role="document">

			<form action="modifyMemberInfo" method="post">
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
							<label class="small mb-1" for="mid">아이디</label> <input
								class="form-control" id="infoMid" name="mid" type="text"
								readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<input type="button" id="modifyBtn"
								class="btn btn-dark btn-user btn-block" value="비밀번호 변경"
								onclick="openModifyInput();"> <input type="hidden"
								id="modifySubmitBtn" class="btn btn-dark btn-user btn-block"
								value="비밀번호 변경하기" onclick="modifyPw('${sessionScope.loginId}')">
						</div>

						<div class="md-form mb-3">
							<input type="hidden" class="form-control modifyNowPw"
								id="loginPw" name="mpw" type="password" placeholder="현재 비밀번호">
							<input type="hidden" class="form-control modifyPw"
								id="modifyPwInput" name="mpw" type="password"
								placeholder="새 비밀번호"> <input type="hidden"
								class="form-control modifyPw" id="modifyPwInputCheck" name="mpw"
								type="password" placeholder="새 비밀번호 확인"> <span
								id="modifyPwCheckMsg" style="font-size: 13px"></span>
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1">이름</label> <input class="form-control"
								id="infoMname" name="mname" type="text" readonly="readonly">
						</div>

						<div class="md-form mb-3">
							<label class="small mb-1">전화번호</label> <input type="text"
								id="infoMtel" class="form-control" name="mtel"
								readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1">이메일</label> <input type="text"
								id="infoMemail" class="form-control" placeholder="이메일"
								name="memail" readonly="readonly">
						</div>
						<div class="md-form mb-3">
							<label class="small mb-1">생년월일</label> <input type="text"
								id="infoMbirth" class="form-control" name="mbirth"
								readonly="readonly">
						</div>
						<div class="md-form mb-3" id="memberInfoAddr_Div">
							<label class="small mb-1">주소</label> <input type="text"
								id="infoMaddr" class="form-control" name="maddr"
								readonly="readonly">
						</div>

						<div class="row modifyAddrForm" style="display: none">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_postcode2"
									class="form-control postcode" placeholder="우편번호"
									name="mpostcode">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="button" class="btn btn-dark btn-user btn-block"
									onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
						<div class="md-form mb-3 modifyAddrForm" style="display: none">
							<input type="text" id="sample6_address2"
								class="form-control address" placeholder="주소"
								name="maddress">
						</div>

						<div class="row modifyAddrForm" style="display: none">
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_detailAddress2"
									class="form-control detailAddr" placeholder="상세주소"
									name="mdetailAddr">
							</div>
							<div class="col-sm-6 md-form mb-3">
								<input type="text" id="sample6_extraAddress2"
									class="form-control extraAddr" placeholder="참고항목"
									name="mextraAddr">
							</div>
						</div>


					</div>
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-dark" id="modifyFormOpen_Btn" type="button"
							onclick="modifyMemberInfoForm();">정보수정</button>
						<button class="btn btn-dark" id="memberDelete_Btn" type="button"
							onclick="deleteMemberCheck();">회원탈퇴</button>
						<button class="btn btn-dark" id="modifyMemberInfo_Btn"
							hidden="hidden" type="submit">정보수정 완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	<!-- 내정보 모달 끝 -->

	<!-- 회원탈퇴 모달-->
	<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="z-index: 5000">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="font-weight: bold">정말로 회원탈퇴
						하시겠습니까?</h5>

				</div>
				<div class="modal-body">
					사용하고 계신 아이디 <span style="color: green;">
						(${sessionScope.loginId })</span> 는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <span
						style="color: red;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게
						선택하시기 바랍니다.</span>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/deleteMember?loginId=${sessionScope.loginId}">회원탈퇴</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원탈퇴 모달 끝 -->

	<!-- 아이디 찾기 모달 -->
	<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="z-index: 5000">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<button class="close text-right font-weight-bold mt-2 mr-2"
					type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">x&nbsp;</span>
				</button>
				<div class="modal-header text-center">
					<a class="modal-title w-100 font-weight-bold"> <img
						src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
						alt="IMG-LOGO" style="width: 50%">
					</a>

				</div>
				<div class="modal-body mx-3">
					<div class="row">
						<div class="col-sm-8 md-form mb-3">
							<input type="text" id="findId_inputName"
								class="form-control validate findId" placeholder="이름 "
								name="mid">
						</div>
					</div>
					<div class="row">
						<div class="col-sm-8 md-form mb-3">
							<input type="email" id="findId_inputEmail"
								class="form-control validate findId" placeholder="이메일"
								name="memail"> <input type="hidden" id="findId_CheckNum"
								class="form-control validate findId" placeholder="인증번호 입력">
							<span id="findId_EmCheckMsg"></span>
						</div>

						<div class="col-sm-4 md-form mb-3">
							<button class="btn btn-dark" type="button"
								id="findId_emailCheck_btn">인증번호 발송</button>
						</div>
					</div>

					<div class="md-form mb-3">
						<input type="hidden" id="findIdSuccessText"
							class="form-control validate" readonly="readonly">
					</div>

					<div class="md-form mb-1 text-center">
						<button class="btn btn-dark" id="findIdBtn">아이디 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 모달 -->
	<!-- <form id="findPwForm2"> -->
		<div class="modal fade" id="findPwModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="z-index: 5000">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<button class="close text-right font-weight-bold mt-2 mr-2"
						type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">x&nbsp;</span>
					</button>
					<div class="modal-header text-center">
						<a class="modal-title w-100 font-weight-bold"> <img
							src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
							alt="IMG-LOGO" style="width: 50%">
						</a>

					</div>
					<div class="modal-body mx-3">
						<div class="row">
							<div class="col-sm-8 md-form mb-3">
								<input type="text" id="findPw_inputId"
									class="form-control validate findPw" placeholder="아이디 입력">
							</div>
							<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark btn-block" type="button"
									id="findPwNext_Btn" onclick="findPwNext();">다음</button>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-8 md-form mb-3">
								<input type="hidden" id="findPw_inputEmail"
									class="form-control validate findPw" placeholder="이메일"
									readonly="readonly">
							</div>

							<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark" type="button"
									id="findPw_emailCheck_btn" hidden="hidden">인증번호 발송</button>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-8 md-form mb-3">
								<input type="hidden" id="findPw_CheckNum"
									class="form-control validate findPw" placeholder="인증번호 입력">
								<span id="findPw_EmCheckMsg"></span>
							</div>
							<div class="col-sm-4 md-form mb-3">
								<button class="btn btn-dark btn-block" type="button"
									id="findPwCheckNext" hidden="hidden">다음</button>
							</div>
						</div>

						<div class="md-form mb-3">
							<input type="hidden" class="form-control validate findPw_newPw findPw"
								id="findPw_newPw" placeholder="새 비밀번호"> <input
								type="hidden" class="form-control validate findPw_newPw findPw"
								id="findPw_newPwCheck" placeholder="새 비밀번호 확인"> <span
								id="findPw_PwCheckMsg" style="font-size: 13px"></span>
						</div>

						<div class="md-form mb-1 text-center">
							<button class="btn btn-dark" id="findPw_newPw_Btn"
								hidden="hidden">비밀번호 변경</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- </form> -->


</body>

<!-- 다음 우편번호 서비스-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/daumPostCode.js"></script>	
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
<!-- 카카오 로그인 api -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/kakaoLogin.js"></script> 
	
<!-- member 스크립트 연동 -->
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>