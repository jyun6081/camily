<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
	/* 전화번호 input number 버튼 지우기*/
	/* Chrome, Safari, Edge, Opera */
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}

	/* Firefox */
	input[type=number] {
		-moz-appearance: textfield;
	}

	/* 생년월일 placeholder 적용 */
	.date_empty:before {
		content: attr(data-placeholder);
		width: calc(100%);
	}
</style>
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script> <!-- 아이콘 사용 -->
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
					<c:if test="${sessionScope.loginId != null }">
						${sessionScope.loginId } <span style="color:red">관리자</span>님 환영합니다.
					</c:if>
				</div>

				<div class="right-top-bar flex-w h-full">
					<!-- <span class="flex-c-m trans-04 p-lr-25">
							sessionId님 환영합니다.
						</span> -->

					<c:choose>
						<c:when test="${sessionScope.loginId == null }">
							<a href="#" class="flex-c-m trans-04 p-lr-25" onclick="memberJoin();">회원가입</a>
							<a href="#" class="flex-c-m trans-04 p-lr-25" onclick="memberLogin();">로그인</a>
						</c:when>

						<c:otherwise>
							<a href="memberLogout" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						</c:otherwise>
					</c:choose>

					<!-- <a href="#" class="flex-c-m trans-04 p-lr-25">
							EN
						</a>

						<a href="#" class="flex-c-m trans-04 p-lr-25">
							USD
						</a> -->
				</div>


			</div>
		</div>
		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath }/admin" class="logo"> <img
						src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO"></a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li><a href="adminMemberList">회원관리</a></li>
						<li><a href="#">게시판 관리</a></li>
						<li>
						<a href="#">캠핑용품관리</a>
						    <ul class="sub-menu" style="z-index: 1100">
								<li><a href="adminCampingShop">캠핑용품관리</a></li>
								<li><a href="AdminProductInsert">캠핑용품등록</a></li>
								<li><a href="AdminCampingSendProduckt">캠핑용품배송관리</a></li>
								<li><a href="AdminCampingCancel">캠핑용품취소관리</a></li>
								<li><a href="AdminCampingCancelList">캠핑용품취소목록</a></li>
							</ul>
						</li>						
						<li><a href="#">캠핑장 관리</a>
						     <ul class="sub-menu">
								<li><a href="adminCamping">캠핑장 목록</a></li>
								<li><a href="adminCampingInsertPage">캠핑장 등록</a></li>
							</ul>
						</li>
					</ul>
				</div>

				<!-- Icon header -->
			</nav>
		</div>
	</div>
	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="index.html"><img src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
					alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div> -->

			<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
				data-notify="2">
				<i class="zmdi zmdi-shopping-cart"></i>
			</div>

			<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti"
				data-notify="0">
				<i class="zmdi zmdi-favorite-outline"></i>
			</a>
		</div>

		<!-- Button show menu -->
		<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
			<span class="hamburger-box"> <span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">sessionId님 환영합니다.</div>
			</li>

			<li>
				<div class="right-top-bar flex-w h-full">
					<!-- <a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a> -->

					<a href="#" class="flex-c-m p-lr-10 trans-04"> 내정보 보기 </a>

					<!-- <a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a> -->
				</div>
			</li>
		</ul>

		<ul class="main-menu-m">
			<li><a href="CampingList">캠핑장</a></li>
			<li><a href="campingShopPage">캠핑용품</a>
			<li><a href="#">후기</a>
				<ul class="sub-menu-m">
					<li><a href="cgreviewpage">캠핑장 후기</a></li>
					<li><a href="goreviewpage">캠핑용품 후기</a></li>
				</ul> <span class="arrow-main-menu-m"> <i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li><a href="shoping-cart.html" class="label1 rs1" data-label1="hot">이벤트</a></li>

			<li><a href="boardList">FAQ</a></li>

			<li><a href="about.html">캠핑TIP</a></li>

			<li><a href="contact.html">고객센터</a></li>
		</ul>
	</div>

</header>