<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://kit.fontawesome.com/e9a5166904.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->

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

<header>
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
					<c:if test="${sessionScope.loginId != null }">
						${sessionScope.loginId }님 환영합니다.
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
							<a href="#" class="flex-c-m trans-04 p-lr-25"
								onclick="memberInfo('${sessionScope.loginId}')">내정보</a>
							<a href="memberLogout" class="flex-c-m trans-04 p-lr-25">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>


			</div>
		</div>
		<div class="wrap-menu-desktop">
			<nav class="limiter-menu-desktop container">

				<!-- Logo desktop -->
				<a href="${pageContext.request.contextPath }/" class="logo"> <img
						src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png" alt="IMG-LOGO"></a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li><a href="campingList">캠핑장</a></li>
						<li><a href="campingShopPage">캠핑용품</a></li>
						<li><a href="#">후기</a>
							<ul class="sub-menu" style="z-index: 1100">
								<li><a href="cgreviewpage">캠핑장 후기</a></li>
								<li><a href="goreviewpage">캠핑용품 후기</a></li>
							</ul>
						</li>
						<li><a href="boardList">자유게시판</a></li>

						<li><a href="FAQList">FAQ</a></li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<c:choose>
						<c:when test="${sessionScope.loginId != null}">
							<a href="myReservationList" style="font-size: 25px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="fa-solid fa-tent"></i></a>
							<a href="detailinformation" style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="zmdi zmdi-shopping-cart"></i></a>
							<button style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart" onclick="cartselect('${sessionScope.loginId}')"> <i class="zmdi zmdi-favorite-outline"></i></button>
							<a href="CampingPurchaseListPage" style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="fa-brands fa-wpforms"></i></a>
						</c:when>
						<c:otherwise>
							<i class="fa-solid fa-tent cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 23px; cursor: pointer;"></i>
							<i class="zmdi zmdi-shopping-cart cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
							<i class="zmdi zmdi-favorite-outline cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
							<i class="fa-brands fa-wpforms cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
						</c:otherwise>
					</c:choose>

				</div>
			</nav>
		</div>
	</div>
	<!-- Header Mobile -->
	<div class="wrap-header-mobile">
		<!-- Logo moblie -->
		<div class="logo-mobile">
			<a href="${pageContext.request.contextPath }/"><img src="${pageContext.request.contextPath}/resources/images/icons/logo-01.png"
					alt="IMG-LOGO"></a>
		</div>

		<!-- Icon header -->
		<div class="wrap-icon-header flex-w flex-r-m m-r-15">
			<c:choose>
				<c:when test="${sessionScope.loginId != null}">
					<a href="myReservationList" style="font-size: 25px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="fa-solid fa-tent"></i></a>
					<a href="detailinformation" style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="zmdi zmdi-shopping-cart"></i></a>
					<button style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-cart" onclick="cartselect('${sessionScope.loginId}')"> <i class="zmdi zmdi-favorite-outline"></i></button>
					<a href="CampingPurchaseListPage" style="font-size: 30px" class="cl2 hov-cl1 trans-04 p-l-22 p-r-11"> <i class="fa-brands fa-wpforms"></i></a>
				</c:when>
				<c:otherwise>
					<i class="fa-solid fa-tent cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 23px; cursor: pointer;"></i>
					<i class="zmdi zmdi-shopping-cart cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
					<i class="zmdi zmdi-favorite-outline cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
					<i class="fa-brands fa-wpforms cl2 hov-cl1 trans-04 p-l-22 p-r-11" onclick="msg('로그인 후 사용가능합니다.')" style="font-size: 30px; cursor: pointer;"></i>
				</c:otherwise>
			</c:choose>
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
				<c:if test="${sessionScope.loginId != null }">
					<div class="left-top-bar" style="float: left;">${sessionScope.loginId}님 환영합니다.</div>				
				</c:if>
				<div class="right-top-bar flex-w h-full" style="display: flex; justify-content: end;">

					<c:choose>
						<c:when test="${sessionScope.loginId == null }">
							<a href="#" class="flex-c-m p-lr-10 trans-04" onclick="memberJoin();">회원가입</a>
							<a href="#" class="flex-c-m p-lr-10 trans-04" onclick="memberLogin();">로그인</a>
						</c:when>

						<c:otherwise>
							<a href="#" class="flex-c-m p-lr-10 trans-04"
								onclick="memberInfo('${sessionScope.loginId}')">내정보</a>
							<a href="memberLogout" class="flex-c-m p-lr-10 trans-04">로그아웃</a>
						</c:otherwise>
					</c:choose>
				</div>
			</li>

		</ul>

		<ul class="main-menu-m">
			<li><a href="campingList">캠핑장</a></li>
			<li><a href="campingShopPage">캠핑용품</a>
			<li><a  href="#">후기</a>
				<ul class="sub-menu-m">
					<li><a href="cgreviewpage">캠핑장 후기</a></li>
					<li><a href="goreviewpage">캠핑용품 후기</a></li>
				</ul> <span class="arrow-main-menu-m"> <i class="fa fa-angle-right" aria-hidden="true"></i>
				</span>
			</li>

			<li><a href="boardList">자유게시판</a></li>

			<li><a href="FAQList">FAQ</a></li>

		</ul>
	</div>

</header>
<script type="text/javascript"> 
  function cartselect(loginId){
	  console.log("loginId :" + loginId);
	  $.ajax({
			type : "post",
			url : "cartselect",
			data : { "loginId" :  loginId},
			dataType : "json",
			success : function(result){
				var output = "";
				console.log(result)
				for(var z = 0; z < result.length; z++){
					output += '<li class="header-cart-item flex-w flex-t m-b-12" id="' + result[z].gocode + '">';
					output += '<div class="header-cart-item-img">';
					output += '<img src="${pageContext.request.contextPath}/resources/campingShopfileUpLoad/'+ result[z].goimage + '" alt="IMG">';
					output += '</div>';
					output += '<div class="header-cart-item-txt p-t-8">';
					output += '<a href="campingDetailPage?gcode='+result[z].gogcode+'"'+' class="header-cart-item-name m-b-18 hov-cl1 trans-04">';
					output += result[z].goname;
					output += '</a>';
					output += '<span cartselect="header-cart-item-info">';
					output += '<span>' + result[z].goprice + '원 </span>';
				    output += '<button onclick="calldibs(this,'+"\'"+result[z].gocode+"\'"+')" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1">삭제하기</button>';
					output += '</span>';
					output += '</div>';
					output += '</li>';
				}
				$("#zzz").html(output);
			}
	 });
  } 
</script>

<script type="text/javascript">
function calldibs(thisval,gocode){
	  console.log("thisval: "+ thisval);
	  console.log("gocode: "+ gocode);
	  
	  $.ajax({
			type : "get",
			url : "calldibs",
			data : { "gocode" :  gocode},
			success : function(result){					 
			 console.log("result :"+ result);
            if(result != null){				
             alert("찜 삭제 성공!");	  
             $("#"+gocode).remove(); 
            }else{
          	 alert("찜 삭제 실패!");
            }
			}
			
	 });
	  
}
</script>
<!-- Channel Plugin Scripts -->
<script type="text/javascript">
var uid = '${sessionScope.loginId}';
if( uid.length > 0){
	


/* $(document).ready(function(){
	console.log("loginId : " + '${sessionScope.loginId}');
	console.log('${sessionScope.loginId}'.length); */

console.log(uid);
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "c6b0ebce-628a-468b-97ca-ce77ecbdb593", //please fill with your plugin key
    "memberId": uid, //fill with user id
    "profile": {
        "name": uid //fill with user name
/*       "mobileNumber": "010-2305-3935", //fill with user phone number
      "CUSTOM_VALUE_1": "VALUE_1", //any other custom meta data
      "CUSTOM_VALUE_2": "VALUE_2"    */
    } 
  });
/* })
 */
}
</script>

<!-- Cart -->
  <div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					찜목록
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full" id="zzz">
					
				</ul>
				

			</div>
		</div>
	</div>	
<!-- Cart 끝 -->
<script type="text/javascript">
	function msg(message) {
		var checkMsg = message;
		console.log(message.length);
		if (message.length > 0) {
			alert(message);
			if(message == "로그인 후 사용가능합니다."){
				memberLogin()
			}
		}
	}
</script>
