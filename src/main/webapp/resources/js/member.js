  $(document).ready(function(){
  var now_utc = Date.now() // 지금 날짜를 밀리초로
//getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
//new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
$("#inputBirth").attr("max", today);
  });

	    /* 회원가입 모달 호출 */
		function memberJoin(){
			$("#JoinModal").modal('show');
		}
		/* 로그인 모달 호출 */
		function memberLogin(){
			$("#LoginModal").modal('show');
		}
		/* 회원탈퇴 모달 호출 */
		function deleteMemberCheck(){
			$("#deleteMember").modal('show');
		  }
		/* 아이디 찾기 모달 호출 */
		function findIdForm(){
			$("#LoginModal").modal('hide');
			$("#findIdModal").modal('show');
		}
		/* 아이디 찾기 모달 호출 */
		function findPwForm(){
			$("#LoginModal").modal('hide');
			$("#findPwModal").modal('show');
		}
		/* 내 정보 모달 호출*/
		function memberInfo(loginId){
			$.ajax({
				type : "get",
				url : "memberInfo",
				data : { "loginId" : loginId},
				dataType : "json",
				success: function(memberInfo){
					console.log("내 정보 모달");
				    console.log(memberInfo);
					 $("#infoMid").val(memberInfo.mid);
					 $("#infoMname").val(memberInfo.mname);
					 $("#infoMtel").val(memberInfo.mtel);
					 $("#infoMemail").val(memberInfo.memail);
					 $("#infoMbirth").val(memberInfo.mbirth);
					 $("#infoMaddr").val(memberInfo.maddr);	
				}
				
			})
			$("#InfoModal").modal('show');
			
		}
	
		$('.modal').on('hidden.bs.modal', function (e) {
			console.log("모달창 초기화!");
			/* 로그인 모달 초기화 */
			$(".loginInput").val("");
			/* 회원가입 모달 초기화  */
		    $("#joinForm")[0].reset();
	        $("#idCheckMsg").text(""); 
		    $("#pwCheckMsg").text("");
		    $("#nameCheckMsg").text("");
		    $("#emailCheckMsg").text("");
		    $("#inputCheckNum").prop("type","hidden");
			/* 내정보 모달 초기화  */
			$(".modifyNowPw").prop("type", "hidden");
			$(".modifyPw").prop("type", "hidden");
			$("#modifyBtn").prop("type", "button");
			$("#modifySubmitBtn").prop("type", "hidden");
		    $(".modifyNowPw").val("");
		    $(".modifyPw").val("");
		    $("#modifyPwCheckMsg").text("");
		    // 내정보 수정 폼 모달 초기화
		    $("#infoMtel").attr("readonly","readonly");
	        $("#memberInfoAddr_Div").show();
	        $(".modifyAddrForm").hide();
	        $("#modifyFormOpen_Btn").removeAttr("hidden");
	        $("#modifyMemberInfo_Btn").attr("hidden","hidden");
	        $("#memberDelete_Btn").removeAttr("hidden");
	        $(".validate").val("");
		    
		    /* 아이디 찾기 모달 초기화 */
		    $(".findId").val("");
		    $("#findId_CheckNum").prop("type", "hidden");
		    $("#findId_EmCheckMsg").text("");
		    $("#findIdSuccessText").prop("type", "hidden");
		    /* 비밀번호 찾기 모달 초기화 */
		    $(".findPw").val("");
		    $("#findPw_PwCheckMsg").text("");
		    $("#findPw_EmCheckMsg").text("");
		    $("#findPw_emailCheck_btn").attr("hidden","hidden")
		    $("#findPwCheckNext").prop("hidden","hidden")
		    $("#findPw_newPw_Btn").attr("hidden","hidden")
		    $(".findPw").prop("type","hidden")
		    $("#findPw_inputId").prop("type","text")
		    $("#findPwNext_Btn").removeAttr("hidden")
		    $("#findPw_inputId").removeAttr("readonly")
		    $("#findPw_CheckNum").removeAttr("readonly")
		    $("#findPw_PwCheckMsg").text("")
		    
		    
		    
		});



	var inputIdCheck = false;
	var inputpwCheck = false;
	var inputNameCheck = false;
    $(document).ready(function (){
	
	$("#inputMid").focusout(function(){
		var inputId = $("#inputMid").val();
		console.log("inputId : " +inputId);
		
		/* 아이디 길이 확인 */
		if( inputId.length == 0){
			$("#idCheckMsg").text("아이디를 입력 해주세요!").css("color","red");
			inputIdCheck = false;
		} else if (inputId.length < 5 || inputId.length > 10) {
            $("#idCheckMsg").text("아이디는 5 ~ 10자리 입니다.").css("color", "red")
            inputIdCheck = false;
        }
		
	   /* 아이디 중복 확인*/
		else {
			$.ajax({
				type : "get",
				url : "memberIdCheck",
				data : { "inputId" : inputId },
				success : function(result){
					console.log("result : " + result);
					if( result == "OK" ){
						$("#idCheckMsg").text("사용가능한 아이디입니다.").css("color","green");
						inputIdCheck = true;
					} else {
						$("#idCheckMsg").text("이미 사용중인 아이디입니다.").css("color","red");
						inputIdCheck = false;
					}
				}
			});
		}
	});
});
	/* 비밀번호 일치 확인*/
    	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
    $("#inputMpwCheck , #inputMpw").focusout(function(){
    	/* 비밀번호 정규식 */
    	var txt = $("#inputMpw").val();
    	if( !reg.test(txt) ) {
    		$("#pwCheckMsg").text("영문과 숫자를 포함한 6~10자리를 입력해주세요.").css("color","red")
    		return false;
    	}
    	
    	if($("#inputMpwCheck").val().length != 0){
    		
		if( $("#inputMpwCheck").val() == $("#inputMpw").val() ){
			$("#pwCheckMsg").text("비밀번호가 일치합니다.").css("color","green")
			inputpwCheck = true;
		} else {
			$("#pwCheckMsg").text("비밀번호가 일치하지 않습니다.").css("color","red")
			inputpwCheck = false;
		}
    		
    	} else {
    		$("#pwCheckMsg").text("")
    	}
    	/* 아이디와 비밀번호가 같을 시 예외처리 */
    	if($("#inputMid").val() == $("#inputMpw").val() ){
    		$("#pwCheckMsg").text("아이디와 비밀번호는 동일할 수 없습니다.").css("color","red")
    		inputpwCheck = false;
    	}
    });
	
    $("#inputMname").change(function(){
    	if( $("#inputMname").val().length <= 5){
    		$("#nameCheckMsg").text("");
    	}
    });
	function memberCheck() {
		/* 아이디 입력 확인 */
		if( !inputIdCheck ){
			alert("아이디를 확인 해주세요!");
			$("#inputMid").focus();
			return false;
		}
		/* 비밀번호 입력 확인 */
		if( $("#inputMpw").val().length == 0 || inputpwCheck == false){
			alert("비밀번호를 확인 해주세요!");
			$("#inputMpw").focus();
			return false;
		}
		
		
		/* 이름 입력 확인 */
		if( $("#inputMname").val().length == 0 ){
			alert("이름을 입력 해주세요!");
			$("#inputMname").focus();
			return false;
		}
		/* 이름 길이 확인 */
		if( $("#inputMname").val().length > 5){
			$("#nameCheckMsg").text("이름은 5글자 이하만 입력 가능합니다.").css("color","red");
			$("#inputMname").focus();
			return false;
		} 
		
		/* 전화번호 입력 확인 */
		if( $("#inputMtel").val().length == 0 ){
			alert("전화번호를 입력 해주세요!");
			$("#inputMtel").focus();
			return false;
		}
		
		/* 이메일 입력 확인 */
		if( $("#inputMemail").val().length == 0 ){
			alert("이메일를 입력 해주세요!");
			$("#inputMemail").focus();
			return false;
		}
		
		/* 생년월일 입력 확인 */
		if( $("#inputBirth").val().length == 0 ){
			alert("생년원일을 입력 해주세요!");
			$("#inputBirth").focus();
			return false;
		}
		
		/* 우편번호 입력 확인 */
		if( $("#sample6_postcode").val().length == 0 ){
			alert("우편번호를 입력 해주세요!");
			$("#sample6_postcode").focus();
			return false;
		}
		
		/* 주소를 입력 확인 */
		if( $("#sample6_address").val().length == 0 ){
			alert("주소를 입력 해주세요!");
			$("#sample6_address").focus();
			return false;
		}
		
		/* 상세주소 입력 확인 */
		if( $("#sample6_detailAddress").val().length == 0 ){
			alert("상세주소를 입력 해주세요!");
			$("#sample6_detailAddress").focus();
			return false;
		}
		
		
		if (checkEmail == "NO"){
			alert("이메일 인증을 확인해주세요!");
			$("#inputCheckNum").focus();
			return false;
		}
		
	}
	
		<!-- 생년월일 placeholder 적용  -->
      $("input[type=date].placeholder-date").on("change", (e) => {
	  const target = $(e.target);
	  if (target.val() == "") target.addClass("date_empty");
	  else target.removeClass("date_empty");
	});
	
	function checkCapsLock(event)  {
	  if (event.getModifierState("CapsLock")) {
	    $("#capslockCheckMsg").text("Caps Lock이 켜져 있습니다.").css("color","red")
	  }else {
		  $("#capslockCheckMsg").text("")
	  }
	}
	
	function openModifyInput(){
	console.log("비밀번호 변경폼 호출")
	$(".modifyNowPw").removeAttr("type");
	$(".modifyPw").prop("type", "password");
	/* $("#modifyBtn").val("비밀번호 변경하기") */
	$("#modifyBtn").prop("type", "hidden");
	$("#modifySubmitBtn").prop("type", "button");
	
}

/* 비밀번호 변경 스크립트 */
 
    $("#modifyPwInput , #modifyPwInputCheck").focusout(function(){
    	var txt = $("#modifyPwInput").val();
    	if( !reg.test(txt) ) {
    		$("#modifyPwCheckMsg").text("영문과 숫자를 포함한 6~10자리를 입력해주세요.").css("color","red")
    		modifyPwCheck = false;
    	} else {
    		$("#modifyPwCheckMsg").text("")
    	}
    });

var modifyPwCheck = true;
function modifyPw(loginId){
var modifyPassword = $("#modifyPwInput").val();
	$.ajax({
		type : "get",
		url : "modifyPwCheck",
		data : { "loginId" : loginId },
		success : function(loginPw){
			console.log("비밀번호 변경 호출");
			console.log("현재 비밀번호 : " + loginPw);
			
			if( $("#loginPw").val() != loginPw ){
				alert("현재 비밀번호가 일치하지 않습니다.")
				$("#loginPw").focus();
				modifyPwCheck = false;
			} else if( $("#modifyPwInput").val() != $("#modifyPwInputCheck").val() ){
	    		/* $("#modifyPwCheckMsg").text("비밀번호가 일치하지 않습니다.").css("color","red") */
	    		alert("비밀번호가 일치하지 않습니다.")
	    		modifyPwCheck = false;
	    	} else if( $("#modifyPwInput").val() == loginId || $("#modifyPwInputCheck").val() == loginId){
				console.log("아이디와 비밀번호 동일");
				alert("아이디와 비밀번호는 동일할 수 없습니다.")
				modifyPwCheck = false;
			} else {
				modifyPwCheck = true;
			}
			
			
	    	if( modifyPwCheck ){
	    		console.log("비밀번호 변경 허용");
	    		console.log(modifyPassword);
	    		$.ajax({
	    			type : "get",
	    			url : "modifyMemberPw",
	    			data : { "loginId" : loginId, "modifyPw" : modifyPassword },
	    			success : function(result){
	    				console.log("updateResult : " + result)
	    				
	    				if (result > 0){
	    					console.log("비밀번호 변경 완료");
	    					alert("비밀번호가 변경되었습니다.");
	    					$(".modifyPw").prop("type","hidden");
	    					$("#modifyBtn").prop("type", "button");
	    					$("#modifySubmitBtn").prop("type", "hidden");
	    					
	    					$("#InfoModal").modal('hide');
	    					window.location.href = '';
	    					
	    				} else {
	    					$("#MemberModifyForm")[0].reset();
	    					alert("비밀번호 변경에 실패하였습니다.")
	    				}
	    			}
	    		})
	    	}
		}
	});
}

var checkEmail = "";
var checkNum = "";
/* 인증번호 이메일 전송 */
$("#mail_check_button").click(function(){
	console.log("이메일 인증 시도 확인!");
    var email = $("#inputMemail").val()      // 입력한 이메일
    $.ajax({
    	type : "get",
    	url : "mailCheck",
    	data : { "email" : email},
    	success :function(data){
    		if( email.length > 0){
            $("#inputCheckNum").removeAttr("type");
    		alert("인증번호가 전송되었습니다!");
    		console.log("data : " + data);
    		checkNum = data;
    		} else {
    			$("#inputMemail").focus();
    			alert("이메일을 입력해주세요!");
    		}
    		
$("#inputCheckNum").keyup(function(){
          
    var inputCode = $("#inputCheckNum").val();                            // 입력코드    
    
    if(inputCode == checkNum){                                            // 일치할 경우
    	console.log("인증성공");
    	$("#emailCheckMsg").text("인증번호가 일치합니다.").css("color","green")
        checkEmail = "OK";
    } else if( inputCode != checkNum){                                      // 일치하지 않을 경우
    	console.log("인증실패");
    	$("#emailCheckMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
        checkEmail = "NO";
    }
});
    $("#inputMemail").keyup(function(){
    	console.log("이메일 변경");
    	checkNum = "";
    	checkEmail = "NO";
    	$("#emailCheckMsg").html("인증번호를 다시 확인해주세요.").css("color","red")
    })
    	}
    	
    })
});

var findId_checkEmail = "";
var findId_checkNum = "";

$("#findId_emailCheck_btn").click(function(){
var email = $("#findId_inputEmail").val()      // 입력한 이메일
	console.log("이메일 인증 시도 확인!");
    $.ajax({
    	type : "get",
    	url : "mailCheck",
    	data : { "email" : email},
    	success :function(data){
    		if( email.length > 0){
            $("#findId_CheckNum").removeAttr("type");
    		alert("인증번호를 발송했습니다. 인증번호가 오지 않으면 입력하신 정보가 회원정보와 일치하는지 확인해주세요.");
    		console.log("data : " + data);
    		findId_checkNum = data;
    		} else {
    			$("#findId_inputEmail").focus();
    			alert("이메일을 입력해주세요!");
    		}
    		
    	    $("#findId_CheckNum").keyup(function(){
    			
    		    var inputCode = $("#findId_CheckNum").val();                            // 입력코드    
    		    
    		    if(inputCode == findId_checkNum){                                            // 일치할 경우
    		    	console.log("인증성공");
    		    	$("#findId_EmCheckMsg").text("인증번호가 일치합니다.").css("color","green")
    		        findId_checkEmail = "OK";
    		    } else if( inputCode != findId_checkNum){                                      // 일치하지 않을 경우
    		    	console.log("인증실패");
    		    	$("#findId_EmCheckMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
    		        findId_checkEmail = "NO";
    		    }
    		    
    		          
    		 });
    		    $("#findId_inputEmail").keyup(function(){
    		    	console.log("이메일 변경");
    		    	findId_checkNum = "2323241415667879";
    		    	findId_checkEmail = "NO";
    		    	$("#findId_EmCheckMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
    		    })    		
    	}
    	});	
    });

       $("#findIdBtn").click(function(){
    	   console.log("아이디 찾기!");
    	   var mEmail = $("#findId_inputEmail").val()     // 찾을 아이디에 해당하는 이메일
    	   var name = $("#findId_inputName").val()
    	   if (findId_checkEmail == "NO"){
    		   alert("인증번호를 확인해주세요!");
    		   $("#findId_CheckNum").focus();
    	   } else if ( findId_checkEmail == "OK"){
    		   console.log("아이디 찾기 성공!");
    		   
    		   $.ajax({
    			   type : "get",
    			   url : "getFindId",
    			   data : {"email" : mEmail, "name" : name },
    			   success :function(findId){
    				   console.log("찾은 아이디 : " + findId);
    				   
    				   if( findId.length != 0){
    				   $("#findIdSuccessText").removeAttr("type")
    				   $("#findIdSuccessText").val("회원님의 아이디는 " +findId+ " 입니다.");
    				   } else {
    					   alert("일치하는 아이디가 존재하지 않습니다.");
    				   }
    			   }
    		   })
    	   }
})

var findPw_checkEmail = "";
var findPw_checkNum = "";
var findPw_pwCheck = true;
    function findPwNext(){
    	
    	var findPw_Id = $("#findPw_inputId").val();
    	$.ajax({
    		type : "get",
    		url : "memberInfo",
    		data : {"loginId" : findPw_Id},
    		dataType : "json",
    		success :function(memberInfo){
    			console.log(memberInfo);
    			
    			if( memberInfo != null){
    	          $("#findPw_inputEmail").removeAttr("type")
    	          $("#findPw_emailCheck_btn").removeAttr("hidden") 
    	          $("#findPw_inputId").attr("readonly","readonly")
    	          $("#findPw_inputEmail").val(memberInfo.memail)
    	          $("#findPwNext_Btn").attr("hidden","hidden")
    			} else {
    				alert("아이디가 존재하지 않습니다.");
    				$("#findPw_inputId").focus();
    			}
    		}
    		
    		
    	})
    }
    
    $("#findPw_emailCheck_btn").click(function(){
        var email = $("#findPw_inputEmail").val()      // 입력한 이메일
        	console.log("이메일 인증 시도 확인!");
            $.ajax({
            	type : "get",
            	url : "mailCheck",
            	data : { "email" : email},
            	success :function(data){
            	    console.log("비밀번호 찾기 인증번호 전송 성공!");
            	    console.log("data : "+ data);
            	    findPw_checkNum = data;
            	    alert("인증번호가 전송되었습니다!");
            		$("#findPw_CheckNum").removeAttr("type");
            		$("#findPwCheckNext").removeAttr("hidden")
            		
            		$("#findPw_CheckNum").keyup(function(){
            		var inputCode = $("#findPw_CheckNum").val(); 
            			console.log("inputCode : " +inputCode)
            			console.log("findPw_checkNum : " + findPw_checkNum)
            		 if(inputCode == findPw_checkNum){                                            // 일치할 경우
       		    	console.log("인증성공");
       		    	$("#findPw_EmCheckMsg").text("인증번호가 일치합니다.").css("color","green")
       		        findPw_checkEmail = "OK";
       		    } else {                                      // 일치하지 않을 경우
       		    	console.log("인증실패");
       		    	$("#findPw_EmCheckMsg").text("인증번호를 다시 확인해주세요.").css("color","red")
       		        findPw_checkEmail = "NO";
       		    }
            			
            		});
            		
            	}
            	});	
            });
    
    
    $("#findPwCheckNext").click(function(){
    	var findPw_Id = $("#findPw_inputId").val();
    	
    	if(findPw_checkEmail == "OK"){
    		$("#findPw_CheckNum").attr("readonly","readonly");
    		$(".findPw_newPw").prop("type","password")
    		$("#findPwCheckNext").attr("hidden","hidden");
    		$("#findPw_emailCheck_btn").attr("hidden","hidden"); 
    		$("#findPw_newPw_Btn").removeAttr("hidden");
    		
    	} else {
    		alert("인증번호를 확인해주세요!")
    	}
    	
    });
    	    
    	    $("#findPw_newPw_Btn").click(function(){
    	    	
    	    var findPw_newPw = $("#findPw_newPw").val();
    	    var findPw_Id = $("#findPw_inputId").val();
    	    var findPw_newPwCheck = $("#findPw_newPwCheck").val();
    	    	
    	    if( findPw_newPw == findPw_newPwCheck && findPw_pwCheck == true){
    	    	console.log("비밀번호 일치")
    	    	location.href="findPwModifyPw?mid="+ findPw_Id + "&newPw=" + findPw_newPw
    	    } else {
    	    	console.log("비밀번호 불일치")
    	    	alert("비밀번호를 확인해주세요!")
    	    }
    	    
    	    });
    	    
    
	var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
    $("#findPw_newPw").focusout(function(){
    	var txt = $("#findPw_newPw").val();
    	if( !reg.test(txt) ) {
    		$("#findPw_PwCheckMsg").text("영문과 숫자를 포함한 6~10자리를 입력해주세요.").css("color","red")
    		findPw_pwCheck = false;
    	} else {
    		$("#findPw_PwCheckMsg").text("")
    	}
    });
    
    function modifyMemberInfoForm(){
	console.log("실행")
	$("#infoMtel").removeAttr("readonly");
	$("#memberInfoAddr_Div").hide();
	$(".modifyAddrForm").show();
	$("#modifyFormOpen_Btn").attr("hidden","hidden");
	$("#modifyMemberInfo_Btn").removeAttr("hidden");
	$("#memberDelete_Btn").attr("hidden","hidden");
}
		