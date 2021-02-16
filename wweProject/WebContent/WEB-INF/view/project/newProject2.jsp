<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<head>

      <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>

    
    <!-- fontAwesome -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    
    <!-- CSS -->
    <link href="/resources/css/project/project.css" rel="stylesheet">
	<link href="/resources/css/chatting/chatting.css" rel="stylesheet">

<style>

	.new-pro {
		display: flex;
		justify-content: center;
		margin: 100px auto 140px auto;
	}

	.recent-project {
		height: 300px;
		display: flex;
		justify-content: space-around;
	}



	.divider-custom {
	  margin: 1.25rem 0 1.5rem;
	  width: 100%;
	  display: flex;
	  justify-content: center;
	  align-items: space-around;
	}
	
	.divider-custom .divider-custom-line {
	  width: 100%;
	  max-width: 7rem;
	  height: 0.25rem;
	  background-color: lightgrey;
	  border-radius: 1rem;
	  border-color: #2c3e50 !important;
	}




	#open {
		background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);
	}
	
	#add {
		 background-image: linear-gradient(120deg, #d4fc79 0%, #96e6a1 100%);
	}

	#invited {
		background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
	}
	
	.mytitle {
	    width: 200px;
	    height: 150px;
	    color: white;
	    text-align: center;
	    background-size: cover;
	    background-position: center;
	    border-radius: 10px;
	    border: none;
	    padding-top: 20px;
	    cursor: pointer;
	}
	


</style>


</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

       <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                        <!-- Sidebar - Brand -->
                        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                            <div class="sidebar-brand-icon rotate-n-15">
                                <i class="fas fa-laugh-wink"></i>
                            </div>
                            <div class="sidebar-brand-text mx-3">WeWorkEasy</div>
                        </a>

                        <!-- Divider -->
                        <hr class="sidebar-divider my-0">

                        <!-- Nav Item - Dashboard -->
                        <li class="nav-item">
                            <a class="nav-link" href="${context}/member/mypage">
                                <i class="fas fa-user-alt"></i>
                                <span>My Page</span></a>
                        </li>


                        <!-- Nav Item - Pages Collapse Menu -->
                        <li class="nav-item ">
                            <a class="nav-link" href="${context}/project/loadpro" data-target="#collapseTwo" aria-expanded="true"
                                aria-controls="collapseTwo">
                                <i class="fas fa-home"></i>
                                <span>Main Page</span>
                            </a>
                        </li>



                    </ul>
                <!-- End of Sidebar -->

  			<!-- Content Wrapper -->
                <div id="content-wrapper" class="d-flex flex-column">

                    <!-- Main Content -->
                    <div id="content">

                        <!-- Topbar -->
                        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                            <!-- Sidebar Toggle (Topbar) -->
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>

                            <!-- Topbar Navbar -->
                            <ul class="navbar-nav ml-auto">

                                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                <li class="nav-item dropdown no-arrow d-sm-none">
                                    <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-search fa-fw"></i>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                        aria-labelledby="searchDropdown">
                                       <iframe src="http://localhost:3100"></iframe>
                                    </div>
                                </li>

                                <!-- Nav Item - Alerts -->
								<li class="nav-item dropdown no-arrow mx-1" id="alarmList">
                           <a class="nav-link dropdown-toggle" id="alertsDropdown"
                           role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
                              <span class="badge badge-danger badge-counter">+</span>
                        </a> <!-- Dropdown - Alerts -->
                           <div
                              class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                              aria-labelledby="alertsDropdown" id="alarmBody">
                              <h6 class="dropdown-header">Alerts History Center</h6>


                              <c:forEach var="alarmData" items="${alarmList}" begin="0"
                                 end="4">
                                 <a class="dropdown-item d-flex align-items-center"
                                    id="alarmATag">
                                    <div class="mr-3">
                                       <c:choose>
                                          <c:when test="${alarmData.typeOfAlarm eq '업무'}">
                                             <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:when test="${alarmData.typeOfAlarm eq '인원'}">
                                             <div class="icon-circle bg-success">
                                                <i class="fas fa-user-friends text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:when test="${alarmData.typeOfAlarm eq '파일'}">
                                             <div class="icon-circle bg-secondary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:otherwise>
                                             <div class="icon-circle bg-secondary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
                                    <div>
                                       <div class="small text-gray-500">${alarmData.addDate}</div>
                                       <span class="font-weight-bold">${alarmData.writer}
                                          님이 ${alarmData.typeOfAlarm}을(를) 추가 하셨습니다.</span>
                                    </div>
                                 </a>
                              </c:forEach>

                              <a class="dropdown-item text-center small text-gray-500"
                                 data-toggle="modal" data-target="#alarmModal">Show All
                                 Alerts</a>

                           </div>
                        </li>
                        
                        <div class="modal fade" id="alarmModal" tabindex="-1"
                           role="dialog" aria-labelledby="exampleModalLabel"
                           aria-hidden="true">
                           <div class="modal-dialog" role="document">
                              <div class="modal-content">
                                 <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Alarm
                                       History</h5>
                                    <button class="close" type="button" data-dismiss="modal"
                                       aria-label="Close">
                                       <span aria-hidden="true">×</span>
                                    </button>
                                 </div>
                                 <div class="modal-body">
                                    <c:forEach var="alarmData" items="${alarmList}" begin="0"
                                 end="4">
                                 <a class="dropdown-item d-flex align-items-center"
                                    id="alarmATag">
                                    <div class="mr-3">
                                       <c:choose>
                                          <c:when test="${alarmData.typeOfAlarm eq '업무'}">
                                             <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:when test="${alarmData.typeOfAlarm eq '인원'}">
                                             <div class="icon-circle bg-success">
                                                <i class="fas fa-user-friends text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:when test="${alarmData.typeOfAlarm eq '파일'}">
                                             <div class="icon-circle bg-secondary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:when>
                                          <c:otherwise>
                                             <div class="icon-circle bg-secondary">
                                                <i class="fas fa-file-alt text-white"></i>
                                             </div>
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
                                    <div>
                                       <div class="small text-gray-500">${alarmData.addDate}</div>
                                       <span class="font-weight-bold">${alarmData.writer}
                                          님이 ${alarmData.typeOfAlarm}을(를) 추가 하셨습니다.</span>
                                    </div>
                                 </a>
                              </c:forEach>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                        

                                <!-- Nav Item - Messages -->
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-envelope fa-fw"></i>
                                        <!-- Counter - Messages -->
                                        <span class="badge badge-danger badge-counter">+</span>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                        aria-labelledby="messagesDropdown">
                                        	<iframe src="http://127.0.0.1:3100/" class="frame"></iframe>
                                    </div>
                                </li>

                                <div class="topbar-divider d-none d-sm-block"></div>

							<li class="nav-item dropdown no-arrow"><a
                           class="nav-link dropdown-toggle" href="#" id="userDropdown"
                           role="button" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="false"> <span
                              class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.user.userName}
                                 님</span> <img class="img-profile rounded-circle"
                              src="../resources/assets/img/icon/whale.png">
                        </a> <!-- Dropdown - User Information -->
                           <div
                              class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                              aria-labelledby="userDropdown">
                              <a class="dropdown-item" href="/member/mypage"> <i
                                 class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                 Profile
                              </a> 
                              <!-- <a class="dropdown-item" href="#"> <i
                                 class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                 Settings
                              </a>  -->
                              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#alarmModal"> <i
                                 class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                 Activity Log
                              </a>
                              <div class="dropdown-divider" href="/member/logout"></div>
                              <a class="dropdown-item" href="/member/logout"
                                 data-toggle="modal" data-target="#logoutModal"> <i
                                 class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                 Logout
                              </a>
                           </div></li>

                            </ul>

                        </nav>
                        <!-- End of Topbar -->


  <!-- Begin Page Content -->
  <div class="container-fluid">

	<!-- 프로젝트 목록 시작 -->
	<div class="project-list">
	
		<!-- Contact Section Heading-->
        <h1 class="page-section-heading text-center text-uppercase text-secondary mb-0">새 프로젝트</h1>
             <!-- Icon Divider-->
             <div class="divider-custom">
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
             	 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-icon" style="color: grey"><i class="fas fa-star"></i></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
             </div>
		
		
		<!-- 새 프로젝트 버튼 -->
		<div class="new-pro">
	        <button type="button" class="mytitle" id="open" onclick="openModal()">
	            <h4>프로젝트 추가 +</h4>
	        </button>
		</div>
		
		
		<!-- Contact Section Heading-->
        <h1 class="page-section-heading text-center text-uppercase text-secondary mb-0">최근 프로젝트</h1>
             <!-- Icon Divider-->
             <div class="divider-custom">
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
             	 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-icon" style="color: grey"><i class="fas fa-star"></i></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
             </div>
		
		<!-- 최근 프로젝트 버튼 -->
		<div class="recent-project">
			<c:forEach var="project" items="${recentproList}" varStatus="status">
				<c:if test="${status.index < 3}">
					<button type="button" id="add" class="mytitle" onclick="recentProject(
						'${project.projectId}',
						'${project.userId}',	
						'${project.workTime}'	
						)">
						<h4>${project.projectId}</h4>
						<h6>${project.workTime}</h6>
					</button>
				</c:if>				
			</c:forEach>
		</div>		
		
		
		
		<!-- Contact Section Heading-->
        <h1 class="page-section-heading text-center text-uppercase text-secondary mb-0">초대된 프로젝트</h1>
             <!-- Icon Divider-->
             <div class="divider-custom">
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
              	 <div class="divider-custom-line"></div>
             	 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-icon" style="color: grey"><i class="fas fa-star"></i></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
                 <div class="divider-custom-line"></div>
             </div>
		
		
		<!-- 초대 프로젝트 버튼 -->
			<c:forEach var="sortArr" items="${sortList}"> <!-- 넘겨받은 sortList의 값을 1개씩 뽑는다 (총 프로젝트 3개 들어있음) -->
			<div class="recent-project">
				<c:forEach var="project" items="${sortArr}"> <!-- sortArr에서 프로젝트를 1개씩 뽑는다 -->
					<button type="button" id="invited" class="mytitle" onclick="invitedProject('${project.projectId}','${project.userId}')">
						<h4>${project.projectId}</h4>
					</button>
				</c:forEach>
			</div>
			</c:forEach>
		
		
		
	
	<!-- 채팅창 iframe -->
	
	
		
		
		
		<!-- 새 프로젝트 modal창 -->
		<div class="modal bg-lg" id="new-project-modal">
		    <!-- <div class="modal__overlay"></div> -->
		    <div class="modal-dialog" role="document">
		    <div class="modal-content">
		        <div class="modal-header">
		            <h2 class="modal-title" id="main-title">New Project</h2>
		    	</div>
		
		        <div class="modal-body">
		        	<div class="row">
                       <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                            <h6>제목</h6>
                       </div>
                       <div class="col-sm-9">
                       		 <input type="text" id="title" class="form-control rounded">
                       </div>
                   </div>
		            <br>
		            <!-- 팀원추가 넣을부분!! -->
		            <div class="row">
                       <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                            <h6>작성자</h6>
                       </div>
                       <div class="col-sm-5">
                       		 <input class="form-control rounded"type="text" name="addMember" id="myInput" placeholder="팀원을 추가하세요!">
                       </div>
                       <div class="col-sm-4">
                       	<button class="btn btn-primary"type="button" onclick="addMember('${sessionScope.user.userID}');">추가</button>
                       	<button class="btn btn-primary"type="button" onclick="deleteMember();">삭제</button>
                       </div>
                   </div>
		           	
		           	<h6>추가된 유저</h6>
                    <textarea class="form-control"  id="addedMember" style="height: 100px; resize: none;" wrap="hard"  cols="20" readonly></textarea>
					<br>
					<div class="row">
						<div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                            <h6>마감기한</h6>
                       </div>
                       <!-- 미니 달력 -->
		                <div class="col-sm-9">
		                   <input type="date" id="deadline" class="form-control form-control-user h6 rounded"></input>
		                </div>
					</div>
		            <div class="modal-footer">
		                <button type="button" class="btn create-btn" onclick="addProject()">생성</button>
		                <button type="button" class="btn cancel-btn" onclick="closeModal()">취소</button>
		            </div>
			   </div>
			</div>
			</div>
		</div>

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

           <!-- Footer -->
           <footer class="sticky-footer bg-white">
               <div class="container my-auto">
                   <div class="copyright text-center my-auto">
                       <span>Copyright &copy; Your Website 2020</span>
                   </div>
               </div>
           </footer>
           <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

<!-- Logout Modal-->
   <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
               <button class="close" type="button" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">×</span>
               </button>
            </div>
            <div class="modal-body">로그아웃???????????????????</div>
            <div class="modal-footer">
               <a class="btn btn-primary" href="/member/logout">Logout</a>
               <button class="btn btn-secondary" type="button"
                  data-dismiss="modal">Cancel</button>
            </div>
         </div>
      </div>
   </div>

	
	<script src="/resources/js/project/project.js"></script>

	<!-- Bootstrap core JavaScript-->
    <script src="../resources/vendor/jquery/jquery.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../resources/js/sb-admin-2.min.js"></script>

</body>

</html>