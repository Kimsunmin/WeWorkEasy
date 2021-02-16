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
                                        <c:choose>
                                        <c:when test = "${sessionScope.user.userPW == null }">
                                        	<h1 class="h4 text-gray-900 mb-4">ID 까먹지 마세요... ${sessionScope.user.userID}</h1>
                                        </c:when>
                                        
                                        <c:otherwise>
                                        	<h1 class="h4 text-gray-900 mb-4">PW도 까먹지 마세요... ${sessionScope.user.userPW}</h1>
                                        </c:otherwise>
                                        </c:choose>
                                    </div>
                                        <hr>
                                        <a onclick = "logout()" href = "/member/signin"class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                        <hr>
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