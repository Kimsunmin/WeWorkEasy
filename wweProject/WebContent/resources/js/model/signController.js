	/**
	 * 
	 */

	let submitCheck = false; 

	let check_pw = () => {
        let pw = document.getElementById('userPW').value;
        let pw2 = document.getElementById('userPW2').value;
					 
		if(!/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test(pw)){
			showDiv('checkPW');
			document.getElementById('checkPW').innerHTML = '비밀번호는 8-15글자, 숫자/영문/특수기호를 사용하여야 합니다.';
			document.getElementById('checkPW').style.color= 'red';
		}else{
			if(pw == pw2){
				hideDiv('checkPW');
				submitCheck = true;
			}else{
				document.getElementById('checkPW').innerHTML = '비밀번호가 일치하지 않습니다.';
				document.getElementById('checkPW').style.color= 'red';
				submitCheck = false;
			}
		}

        
                                        	
	}

	let check_birth = () => {
        let birth = document.getElementById('userBirth').value;
					 
		if(!/^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/.test(birth)){
			showDiv('checkBirth');
			document.getElementById('checkBirth').innerHTML = '생년월일을 올바르게 입력해 주십시오.';
			document.getElementById('checkBirth').style.color= 'red';
			submitCheck = false;
		}else{
			hideDiv('checkBirth');
			submitCheck = true;
		}

	}

	let check_tell = () => {
		let tell = document.getElementById('userTell').value;
		var checkTell = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

					 
		if(!checkTell.test(tell)){
			showDiv('checkTell');
			document.getElementById('checkTell').innerHTML = '핸드폰 번호를 올바르게 입력해 주십시오.';
			document.getElementById('checkTell').style.color= 'red';
			submitCheck = false;
		}else{
			hideDiv('checkTell');
			submitCheck = true;
		}

	}

	function confirmSave(){
		var isRemember;
		let checkbox = document.getElementById('rememberCheck');
		if(checkbox.checked){
			isRemember = confirm("저장하면 아이디 비번 유출 될 수도 있어욥");
		}

		if(!isRemember){
			checkbox.checked = false;
		}
	}

	 function setCookie(name, value, expiredays) //쿠키 저장함수
    {
        var todayDate = new Date();
        todayDate.setDate(todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires="
                + todayDate.toGMTString() + ";"
	}
	
	function getCookie(Name) { // 쿠키 불러오는 함수
        var search = Name + "=";
        if (document.cookie.length > 0) { // if there are any cookies
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // if cookie exists
                offset += search.length; // set index of beginning of value
                end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                if (end == -1)
                    end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
        }
    }
	
    function checkCookie() {
        if (document.getElementById('rememberCheck').checked == true) { // 아이디 저장을 체크 하였을때
            setCookie("rememberID", document.getElementById('userID').value, 7); //쿠키이름을 rememberID로 아이디입력필드값을 7일동안 저장
            setCookie("rememberPW", document.getElementById('userPW').value, 7); //쿠키이름을 rememberPW로 비번입력필드값을 7일동안 저장
        } else { // 아이디 저장을 체크 하지 않았을때
            setCookie("rememberID", document.getElementById('userID').value, 0); //날짜를 0으로 저장하여 쿠키삭제
            setCookie("rememberPW", document.getElementById('userPW').value, 0); //날짜를 0으로 저장하여 쿠키삭제
        }
    }

	


	let signin = () => {

				checkCookie();
				const url = '/member/signinimpl';
				let paramObj = new Object();
				paramObj.userID = userID.value;
				paramObj.userPW = userPW.value;


				let headerObj = new Headers();
				//headerObj.append('content-type', 'application/json');
				headerObj.append('content-type', 'application/x-www-form-urlencoded');
				
				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)

				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert("ID / PW를 확인하세요");
					}
					else{
						//로그인 성공
						location.href= "/project/loadpro";
					}
				}).catch(error => {
					error.alertMessage();
				});
	}

	let signup = () => {
				const url = '/member/signupimpl';
				let paramObj = new Object();
				paramObj.userID = userID.value;
				paramObj.userPW = userPW.value;
				paramObj.userEmail = userEmail.value;
				paramObj.userName = userName.value;
				paramObj.userAdd = userAdd.value;
				paramObj.userTell = userTell.value;
				paramObj.userBirth = userBirth.value;
				
				let headerObj = new Headers();
				//headerObj.append('content-type', 'application/json');
				headerObj.append('content-type', 'application/x-www-form-urlencoded');
				
				if(submitCheck = false){
					window.alert("회원가입 항목이 정상적으로 작성되지 않았습니다.");
					return;
				}

				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)

				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert("ID / PW를 확인하세요");
					}else{
						
						//location.href = "/index";
						location.href= "/member/signin";
					}
				}).catch(error => {
					error.alertMessage();
				});
	}

	let findID = () => {
				const url = '/member/findidimpl';
				let paramObj = new Object();
				paramObj.userEmail = userEmailForID.value;

				let headerObj = new Headers();
				//headerObj.append('content-type', 'application/json');
				headerObj.append('content-type', 'application/x-www-form-urlencoded');

				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)
		
				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert("해당되는 Email이 없슴둥");
					}else{
						
						//location.href = "/index";
						location.href= "/member/findresult";
					}
				}).catch(error => {
					error.alertMessage();
				});
	}

	let findPW = () => {

				const url = '/member/findpwimpl';
				let paramObj = new Object();
				paramObj.userID = userID.value;
				paramObj.userEmail = userEmailForPW.value;
				

				let headerObj = new Headers();
				//headerObj.append('content-type', 'application/json');
				headerObj.append('content-type', 'application/x-www-form-urlencoded');
				
				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)

				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert("ID / PW를 확인하세요");
					}else{
						
						//location.href = "/index";
						location.href= "/member/findresult";
					}
				}).catch(error => {
					error.alertMessage();
				});
	}
	let sendForSignUp = () => {
		sendMail(userEmail.value, authCodeCheck.value);
	}

	let sendForFindID = () => {
		sendMail(userEmailForID.value, authCodeCheck.value);
	}

	let sendForFindPW = () => {
		sendMail(userEmailForPW.value, authCodeCheck.value);
	}
	

	let sendMail = function(userEmail, authCodeCheck){
		
				hideDiv('mailCheckBefore');
				showDiv('mailCheckAfter');
				showDiv('mailAuth');
				showDiv('checkEmail');

				const url = '/member/mailsender';
				let paramObj = new Object();
				paramObj.userEmail = userEmail;
				paramObj.userAuthCode = authCodeCheck;
				
				let headerObj = new Headers();
				headerObj.append('content-type', 'application/x-www-form-urlencoded');

				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)
		
				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert('mail전송 실패!');
					}else{
						
						//location.href = "/index";
						//location.href= "/member/findresult";
						window.alert('mail전송 성공!');
					}
				}).catch(error => {
					error.alertMessage();
				});
	
	}



	let mailAuthSuccess = () => {
		
		let authMailCode = document.getElementById('authCodeCheck').value;
		let checkAuthCode = document.getElementById('userEmailAuth').value;

        if(authMailCode == checkAuthCode){
			document.getElementById('checkEmail').innerHTML = '인증번호가 일치합니다.';
			document.getElementById('checkEmail').style.color= 'blue';
			submitCheck = true;

			if(document.getElementById('findBtnForID') != null){
				showDiv('findBtnForID');
			}
			if(document.getElementById('findBtnForPW') != null){
				showDiv('findBtnForID');
			}
        }else{
            document.getElementById('checkEmail').innerHTML = '인증번호가 일치하지 않습니다.';
			document.getElementById('checkEmail').style.color= 'red';
			submitCheck = false;

			if(document.getElementById('findBtnForID') != null){
				hideDiv('findBtnForID');
			}
			if(document.getElementById('findBtnForPW') != null){
				hideDiv('findBtnForID');
			}
		}
		
	}

	let modifyProfile = () => {
				const url = '/member/modifyimpl';
				let paramObj = new Object();
				paramObj.userID = userID.value;
				paramObj.userPW = userPW.value;
				paramObj.userEmail = userEmail.value;
				paramObj.userName = userName.value;
				paramObj.userAdd = userAdd.value;
				paramObj.userTell = userTell.value;
				paramObj.userBirth = userBirth.value;
				
				let headerObj = new Headers();
				//headerObj.append('content-type', 'application/json');
				headerObj.append('content-type', 'application/x-www-form-urlencoded');
				
				if(submitCheck = false){
					window.alert("회원가입 항목이 정상적으로 작성되지 않았습니다.");
					return;
				}

				fetch(url, {
					
					method : "post",
					headers : headerObj,		
					body:"data="+ JSON.stringify(paramObj)

				}).then(response => {
					//response.ok : 상태코드 200~209 사이라면 ok = true
					if(response.ok){
						return response.text();
					}	
					//200번대 코드가 아니라면 에러를 발생시켜서 catch 블록으로 이동
					
							
				})	
				.then((text) => {
					if(text == "fail"){
						window.alert("회원정보 수정 실패");
					}else{
						//location.href = "/index";
						location.href= "/member/mypage";
					}
				}).catch(error => {
					error.alertMessage();
				});
	}



	let hideDiv = function(divID){
		document.getElementById(divID).style.display = 'none';
		document.getElementById(divID).style.visibility = 'hidden';
		
	}

	let showDiv = function(divID){
		document.getElementById(divID).style.display = 'block';
		document.getElementById(divID).style.visibility = 'visible';
	}

	let setDivFirstSet = () => {
		hideDiv('whale-LeftPic');
		hideDiv('whale-RightID');
		hideDiv('whale-RightPW');
		
		showDiv('whale-LeftFirstSet');
		showDiv('whale-RightFirstSet');
	}

	let hideLeftRight = () => {
		hideDiv('whale-LeftFirstSet');
		showDiv('whale-LeftPic');
		hideDiv('whale-RightFirstSet');
	}

	let showFindID = () => {
		hideLeftRight();
		showDiv('whale-RightID');
		hideDiv('whale-RightPW');
	}

	let showFindPW = () => {
		hideLeftRight();
		showDiv('whale-RightPW');
		hideDiv('whale-RightID');
	}
	
	let showManageProfile = () => {
		setProfileProjectFirstSet();
		showDiv('manageProfile');
		hideDiv('manageFileCloud');
		hideDiv('manageProject');
	}

	let showManageCloud = () => {
		setProfileProjectFirstSet();
		showDiv('manageFileCloud');
		hideDiv('manageProfile');
		hideDiv('manageProject');
	}

	let showManageProject = () => {
		setProfileProjectFirstSet();
		showDiv('manageProject');
		hideDiv('manageFileCloud');
		hideDiv('manageProfile');
	}

	let showModifyProfile = () => {
		setProfileProjectFirstSet();
		showDiv('modifyProfile');
		hideDiv('showProfile');
	}

	let showModifyProject = () => {
		setProfileProjectFirstSet();
		showDiv('modifyProject');
		hideDiv('showProject');	
	}

	let setProfileProjectFirstSet = () => {
		showDiv('showProfile');
		showDiv('showProject');
		hideDiv('modifyProfile');
		hideDiv('modifyProject');
	}
	
	
	