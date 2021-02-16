<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/css/sb-admin-2.css" rel="stylesheet">
<script>
    	window.onload = function(){
    		if(getCookie("rememberID") && getCookie("rememberPW")){
    			document.getElementById('userID').value = getCookie("rememberID");
    			document.getElementById('userPW').value = getCookie("rememberPW");
    			document.getElementById('rememberCheck').checked = true;
    		}
    	}
    </script>
</head>

<body class="bg-gradient-primary">
	<c:choose>
		<c:when test="${sessionScope.user == null}">
			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
									<div class="col-lg-6">
										<div class="p-5">
											<div class="text-center">
												<h1 class="h4 text-gray-900 mb-4">★Welcome Buddy★</h1>
											</div>

											<!-- login용 ID 와 PW 받기 -->
											<form class="user" action="${context}/member/signin"
												method="post" id="loginForm" name="loginform">
												<div class="form-group">
													<input type="text" class="form-control form-control-user"
														id="userID" name="userID" placeholder="ID">
												</div>
												<div class="form-group">
													<input type="password"
														class="form-control form-control-user" id="userPW"
														name="userPW" placeholder="Password">
												</div>
												<div class="form-group">
													<div class="custom-control custom-checkbox small">
														<input type="checkbox" class="custom-control-input"
															id="rememberCheck" name="rememberCheck"
															onclick="confirmSave()"> <label
															class="custom-control-label" for="rememberCheck">Remember
															Me</label>
													</div>
												</div>
												<a onclick="signin()"
													class="btn btn-primary btn-user btn-block"> Login </a>
												<hr>

												<a
													href="https://kauth.kakao.com/oauth/authorize?
										client_id=aede6a7de778e3191a75f6f270b8e947&
										redirect_uri=http://localhost:9393/member/kakao&
										response_type=code"
													class="btn btn-kakao btn-user btn-block"> <i
													class="fab fa-kickstarter-k fa-fw"></i> Login with Kakao
												</a>


											</form>
											<hr>
											<div class="text-center">
												<a class="small" href="${context}/member/find"
													onclick="setDivFirstSet()">Forgot ID / Password?</a>
											</div>
											<div class="text-center">
												<a class="small" href="${context}/member/signup">Create
													an Account!</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>
		</c:when>
		<c:otherwise>
			<script>
				location.href= "/member/mypage";
			</script>
		</c:otherwise>
	</c:choose>

	<!-- Bootstrap core JavaScript-->
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/js/sb-admin-2.min.js"></script>
	<script src="../resources/js/model/signController.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</body>

</html>