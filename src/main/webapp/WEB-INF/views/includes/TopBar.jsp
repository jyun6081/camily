<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
					sessionId님 환영합니다.
				</div>

				<div class="right-top-bar flex-w h-full">
					<!-- <span class="flex-c-m trans-04 p-lr-25">
							sessionId님 환영합니다.
						</span> -->

					<a href="#" class="flex-c-m trans-04 p-lr-25">
						회원가입
					</a>
					<a href="#" class="flex-c-m trans-04 p-lr-25">
						로그인
					</a>

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
				<a href="#" class="logo">
					<img src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li>
							<a href="campingList">캠핑장</a>
							<ul class="sub-menu">
								<li><a href="index.html">글램핑</a></li>
								<li><a href="home-02.html">카라반</a></li>
								<li><a href="home-03.html">자동차야영장</a></li>
								<li><a href="home-03.html">일반야영장</a></li>
							</ul>
						</li>
						<li>
							<a href="index.html">캠핑용품</a>
							<ul class="sub-menu">
								<li><a href="index.html">Homepage 1</a></li>
								<li><a href="home-02.html">Homepage 2</a></li>
								<li><a href="home-03.html">Homepage 3</a></li>
							</ul>
						</li>
						<li>
							<a href="product.html">리뷰</a>
							<ul class="sub-menu">
								<li><a href="index.html">캠핑장 리뷰</a></li>
								<li><a href="home-02.html">상품 리뷰</a></li>
							</ul>
						</li>

						<li class="label1" data-label1="hot">
							<a href="shoping-cart.html">이벤트</a>
						</li>

						<li>
							<a href="blog.html">FAQ</a>
						</li>

						<li>
							<a href="about.html">캠핑TIP</a>
						</li>

						<li>
							<a href="contact.html">고객센터</a>
						</li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<!-- <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div> -->
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2">
						<i class="fa-brands fa-wpforms"></i>
					</div>


					<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>

					<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0">
						<i class="zmdi zmdi-favorite-outline"></i>
					</a>
				</div>
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
			<span class="hamburger-box">
				<span class="hamburger-inner"></span>
			</span>
		</div>
	</div>


	<!-- Menu Mobile -->
	<div class="menu-mobile">
		<ul class="topbar-mobile">
			<li>
				<div class="left-top-bar">
					sessionId님 환영합니다.
				</div>
			</li>

			<li>
				<div class="right-top-bar flex-w h-full">
					<!-- <a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a> -->

					<a href="#" class="flex-c-m p-lr-10 trans-04">
						내정보 보기
					</a>

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
			<li>
				<a href="index.html">캠핑장</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">글램핑</a></li>
					<li><a href="home-02.html">카라반</a></li>
					<li><a href="home-03.html">자동차야영장</a></li>
					<li><a href="home-03.html">일반야영장</a></li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="index.html">캠핑용품</a>
				<ul class="sub-menu-m">
					<li><a href="index.html">Homepage 1</a></li>
					<li><a href="home-02.html">Homepage 2</a></li>
					<li><a href="home-03.html">Homepage 3</a></li>
				</ul>
				<span class="arrow-main-menu-m">
					<i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>
			<li>
				<a href="product.html">게시판</a>
			</li>

			<li>
				<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">이벤트</a>
			</li>

			<li>
				<a href="blog.html">FAQ</a>
			</li>

			<li>
				<a href="about.html">캠핑TIP</a>
			</li>

			<li>
				<a href="contact.html">고객센터</a>
			</li>
		</ul>
	</div>

	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="${pageContext.request.contextPath}/resources/images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search" placeholder="Search...">
			</form>
		</div>
	</div>
</header>