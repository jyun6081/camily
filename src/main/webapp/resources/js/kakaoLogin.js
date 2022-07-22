    // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('3d5ec1cc165dcd56f1d206d4a7dc177c');

    // SDK 초기화 여부를 판단합니다.
    console.log(Kakao.isInitialized());

     Kakao.Auth.createLoginButton({
	 container: '#kakaoLoginBtn',
	 size: 'large',
     success: function(response) {
		console.log(response);
		// 사용자 정보 가져오기
		Kakao.API.request({
		  url: '/v2/user/me',
		  success: function(res) {
		    console.log(res);
		    console.log("res.id : " + res.id);
		    console.log("res.kakao_account.email : " + res.kakao_account.email);
		    console.log("res.kakao_account.profile.nickname : " + res.kakao_account.profile.nickname);
		    
/* 			    kakaoLogin(res.id, res.kakao_account.email, res.kakao_account.profile.nickname, res.kakao_account.profile.profile_image_url); */
		    //아이디, 이메일, 닉네임, 프로필
		    //controller >> service 아이디로 회원정보 조회
		    //조회되는 회원 정보가 있으면 로그인 처리 후 메인페이지로
		    //조회되는 회원 정보가 없으면 아이디, 이메일, 닉네임, 프로필, 회원가입 처리 >> 로그인 페이지로
		    $.ajax({
		        type : "get",
		        url : "kakaoidSelect",
		        data : {"kakaokey" : res.id},
		        dataType : "json",
		        async : false,
		        success :function(kakaoMember){
		        	console.log(kakaoMember);
		        	console.log(res.id);
		        	if( kakaoMember == null){
		        	    alert("일치하는 회원정보가 없습니다. 회원가입 후 이용 가능합니다.")
		        		$("#JoinModal").modal('show');
		        		$("#inputKakaokey").val(res.id);
		        		$("#inputMname").val(res.kakao_account.profile.nickname);
		        		$("#inputMemail").val(res.kakao_account.email);
		        	} else {
		        		location.href = "memberLogin?mid=" + kakaoMember.mid + "&mpw=" + kakaoMember.mpw
		        	}
		        }
		    })
		  },
		  fail: function(error) {
		    console.error(error)
		  }
		})
     },
	 fail: function(error) {
	  console.log(error);
		},
	 });