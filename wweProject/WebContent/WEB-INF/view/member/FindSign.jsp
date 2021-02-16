<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link href="../resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">
 <%!
     public int getAuthCode(){
          int random = 0;
          random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
          return random;
     }
 %>

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                        	
                            <div class="col-lg-6" id = "whale-LeftFirstSet">
                                <div class="p-5">
                                    <div class="text-center">
                                    	<i class="fas fa-user-cog fa-9x" style = "size : 9x;"></i>
                                  		<br><br><br>
                                	</div>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your ID?</h1>
                                    	<br>
                                    </div>
                                    <form class="user">
                                        <a onclick = "showFindID()" class="btn btn-primary btn-user btn-block">
                                            Find ID
                                        </a>
                                        <br>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signup">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signin">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-6" id = "whale-RightFirstSet">
                                <div class="p-5">
                                	<div class="text-center">
                                		<i class="fas fa-user-lock fa-9x"></i>
                                		<br><br><br>
                                	</div>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                    	<br>
                                    </div>
                                    <form class="user">
                                        <a onclick="showFindPW()" class="btn btn-primary btn-user btn-block">
                                            Find Password
                                        </a>
                                        <br>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signup">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signin">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-6 d-none d-lg-block bg-password-image" id = "whale-LeftPic" onclick = "setDivFirstSet()"></div>
                            
                            <!-- Right ID Hidden -->
                             <div class="col-lg-6" id = "whale-RightID">
                                <div class="p-5">
                                    <div class="text-center">
                                    	<i class="fas fa-user-cog fa-5x"></i>
                                    	<br><br><br>
                                    </div>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your ID?</h1>
                                        <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                            and we'll send you a link to reset your password!</p>
                                    </div>
                                    <form class="user" action = "${context}/member/find" method = "post">
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="userEmailForID" name = "userEmailForID" 
                                                placeholder="Enter Email Address...">
                                        </div>
                                        
                                        <!-- 인증번호 입력 -->
                                	<div class="form-group" id="mailAuth">
                                    	<input type="email" class="form-control form-control-user" 
                                    	id="userEmailAuth" name = "userEmailAuth" placeholder="인증번호를 입력하세요..">
                                	</div>
                                
                                	<a onclick = "sendForFindID()" class="btn btn-primary btn-user btn-block" id="mailCheckBefore">
                                    	인증메일 전송
         								<!-- 인증코드 생성 -->                           
                                    	<input type = "hidden" readonly = "readonly" name = "authCodeCheck"
                                		id = "authCodeCheck" value = "<%=getAuthCode()%>"/>
                               		</a>
                               		
                               		<!-- 인증코드 확인 후 입력창 -->
                                	<a onclick = "mailAuthSuccess()" class="btn btn-primary btn-user btn-block" id="mailCheckAfter" onchange = "mailAuthSuccess()">
                                	    인증번호 확인
                               	 	</a>
                               	 	<span class="form-control-user" id = "checkEmail"></span>
                                    
                                    <a onclick = "findID()" class="btn btn-primary btn-user btn-block" id = "findBtnForID">
                                            Find ID
                                    </a>
                                    
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signup">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signin">Already have an account? Login!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" onclick = "setDivFirstSet(); showFindPW();">You wanna find Password?</a>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Right PW Hidden -->
                             <div class="col-lg-6" id = "whale-RightPW">
                                <div class="p-5">
                                    <div class="text-center">
                                    	<i class="fas fa-user-lock fa-5x"></i>
                                    	<br><br><br>
                                    </div>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                                        <p class="mb-4">We get it, stuff happens. Just enter your email address below
                                            and we'll send you a link to reset your password!</p>
                                    </div>
                                    <form class="user" action = "${context}/member/find" method = "post">
                                    	<div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userID" name = "userID"  aria-describedby="emailHelp"
                                                placeholder="Enter ID...">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                id="userEmailForPW" name = "userEmailForPW" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        
                                          <!-- 인증번호 입력 -->
                                	<div class="form-group" id="mailAuth">
                                    	<input type="email" class="form-control form-control-user" 
                                    	id="userEmailAuth" name = "userEmailAuth" placeholder="인증번호를 입력하세요..">
                                	</div>
                                
                                	<a onclick = "sendForFindID()" class="btn btn-primary btn-user btn-block" id="mailCheckBefore">
                                    	인증메일 전송
         								<!-- 인증코드 생성 -->                           
                                    	<input type = "hidden" readonly = "readonly" name = "authCodeCheck"
                                		id = "authCodeCheck" value = "<%=getAuthCode()%>"/>
                               		</a>
                               		
                               		<!-- 인증코드 확인 후 입력창 -->
                                	<a onclick = "mailAuthSuccess()" class="btn btn-primary btn-user btn-block" id="mailCheckAfter" onchange = "mailAuthSuccess()">
                                	    인증번호 확인
                               	 	</a>
                               	 	<span class="form-control-user" id = "checkEmail"></span>
                                        
                                        <a onclick = "findPW()" class="btn btn-primary btn-user btn-block" id = "findBtnForPW">
                                            Find Password
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signup">Create an Account!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="${context}/member/signin">Already have an account? Login!</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" onclick = "setDivFirstSet(); showFindID();">You wanna find ID?</a>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>
    <script src="../resources/js/model/signController.js"></script>

</body>
</html>