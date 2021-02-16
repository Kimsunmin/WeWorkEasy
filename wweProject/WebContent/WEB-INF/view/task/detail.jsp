<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>SB Admin 2 - Cards</title>

            <!-- Custom fonts for this template-->
            <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
            <link
                href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
                rel="stylesheet">

            <!-- Custom styles for this template-->
            <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

        </head>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->

                 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                        <!-- Sidebar - Brand -->
                        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${context}/project/loadpro">
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
                            <a class="nav-link" href="${context}/task/main" data-target="#collapseTwo" aria-expanded="true"
                                aria-controls="collapseTwo">
                                <i class="fas fa-home"></i>
                                <span>Main Page</span>
                            </a>
                        </li>


                        <!-- Nav Item - Utilities Collapse Menu -->
                        <li class="nav-item">
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapseUtilities" aria-expanded="true"
                                aria-controls="collapseUtilities">
                                <i class="fas fa-crown"></i>
                                <span>Admin Page</span>
                            </a>
                            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                                data-parent="#accordionSidebar">
                                <div class="bg-white py-2 collapse-inner rounded">
                                    <h6 class="collapse-header">Manage</h6>
                                    <a class="collapse-item" href="${context}/leader/manage">팀관리</a>
                                    <a class="collapse-item" href="${context}/leader/totaltask">업무관리</a>
                                </div>
                            </div>
                        </li>

                        <hr class="sidebar-divider my-0">

                        <!-- Heading -->
                        <div class="sidebar-heading">
                            views
                        </div>

                        <!-- Nav Item - Pages Collapse Menu -->
                        <li class="nav-item">
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                                <i class="fas fa-fw fa-folder"></i>
                                <span>views</span>
                            </a>
                            <div id="collapsePages" class="collapse" aria-labelledby="headingPages"
                                data-parent="#accordionSidebar">
                                <div class="bg-white py-2 collapse-inner rounded">
                                    <h6 class="collapse-header">view Screens:</h6>
                                    <a class="collapse-item" href="/views/calendar">Calendar</a>
                                    <a class="collapse-item" href="/views/graph">Graph</a>
                                </div>
                            </div>
                        </li>

                        <!-- Nav Item - Charts -->


                        <li class="nav-item">
                            <a class="nav-link collapsed" href="#" data-toggle="collapse"
                                data-target="#collapsePages1" aria-expanded="true" aria-controls="collapsePages">
                                <i class="fas fa-fw fa-folder"></i>
                                <span>Storage</span>
                            </a>
                            <div id="collapsePages1" class="collapse" aria-labelledby="headingPages"
                                data-parent="#accordionSidebar">
                                <div class="bg-white py-2 collapse-inner rounded">
                                    <h6 class="collapse-header">Storage</h6>
                                    <a class="collapse-item" href="/storage/personal">Personal</a>
                                    <a class="collapse-item" href="/storage/share">Share</a>
                                </div>
                            </div>
                        </li>



                        <!-- Divider -->
                        <hr class="sidebar-divider d-none d-md-block">

                        <!-- Sidebar Toggler (Sidebar) -->
                        <div class="text-center d-none d-md-inline">
                            <button class="rounded-circle border-0" id="sidebarToggle"></button>
                        </div>

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
                                        <form class="form-inline mr-auto w-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small"
                                                    placeholder="Search for..." aria-label="Search"
                                                    aria-describedby="basic-addon2">
                                                <div class="input-group-append">
                                                    <button class="btn btn-primary" type="button">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
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


                              <c:forEach var="alarmData" items="${alarmList}"  begin="0"
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
                                    <c:forEach var="alarmData" items="${alarmList}">
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
	<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<i class="fas fa-envelope fa-fw"></i>
		<!-- Counter - Messages -->
		<span class="badge badge-danger badge-counter">+</span>
	</a>
	<!-- Dropdown - Messages -->
	<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
		<!-- 임시로 저희 페이지 띄웠습니다 -->
		<iframe src="http://127.0.0.1:3100/" class="frame"></iframe>
	</div>
</li>

                               

                                <!-- Nav Item - User Information -->
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

                        <div class="container-fluid">

                            <!-- Start of Page -->
                            <div class="d-flex justify-content-center">
                                <div class="btn border pl-3 pr-3 shadow-sm bg-light">
                                    <i class="fas fa-laugh-wink h1 text-dark mr-3 mt-2"></i>
                                    <span class="text-primay font-weight-bold h1 mr-4" id="taskId">${detailList[0].taskId}</span>
                                </div>
                            </div>
                            <hr class="hr">

                            <div class="container border bg-gray-300 shadow-sm col-sm-6 pt-4 mb-4 pb-4">
                                <div class="container border bg-gray-100 rounded pt-4">
                                	
                        

									 <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold" >업무번호</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded" id="tIdx">${detailList[0].tIdx}</div>
                                        </div>
                                    </div>

                                    <hr class="hr">
                                    
                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold" >담당자</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded" id="taskOwner">${detailList[0].userId}</div>
                                        </div>
                                    </div>

                                    <hr class="hr">

                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold">업무 상세</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <textarea class="form-control form-control-user rounded bg-white" style="height:100px; resize:none;"  disabled wrap="hard" cols="20" id="taskContent">${detailList[0].taskContent}</textarea>
                                        </div>
                                    </div>

                                    <hr class="hr">

                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold">관리자</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded">${selectProject.leaderId}</div>
                                        </div>
                                    </div>

                                    <hr class="hr">

                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold">마감기한</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded" id="deadLine">${detailList[0].deadLine}</div>
                                        </div>
                                    </div>

                                    <hr class="hr">

                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold">우선순위</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded"> 
                                            
                                            <c:set var="name" value="${detailList[0].taskPriority}"/>

                                            <c:choose>
                                            	<c:when test="${name eq 'PR00'}" >
                                            		일반
                                            	</c:when>
                                            	<c:when test="${name eq 'PR01'}">
                                            		긴급
                                            	</c:when>

                                            </c:choose></div>
                                        </div>
                                    </div>

                                    <hr class="hr">

                                    <div class="form-group row">
                                        <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                            <h6 class="font-weight-bold">진행상태</h6>
                                        </div>
                                        <div class="col-sm-9">
                                            <div class="form-control form-control-user rounded">
                                            
                                            <c:set var="name" value="${detailList[0].taskState}"/>

                                            <c:choose>
                                            	<c:when test="${name eq 'ST00'}" >
                                            		대기
                                            	</c:when>
                                            	<c:when test="${name eq 'ST01'}">
                                            		진행중
                                            	</c:when>
                                            	<c:when test="${name eq 'ST02'}">
                                            		완료
                                            	</c:when>
                                            </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="pb-4 d-flex justify-content-end">
									
										<button type="button" class="btn btn-sm btn-dark pr-3 pl-3" id="modify" onclick="modifyTask();">수정</button>
                                  
                                    	<!-- <button class="btn btn-sm btn-dark pr-2 pl-2" onclick="help();">HELP</button> -->
                                    </div>
                                </div>

                              

                                <hr class="hr">

                                <div class="container border bg-gray-100 rounded pt-4 pb-4">
                                    <div class="text-center pt-3 pb-2 mb-3 bg-dark">
                                        <h1 class="h6 text-white font-weight-bold">Feedback</h1>
                                    </div>
									
									<form>
                                    	<div class="d-flex justify-content-between align-items-center">
                                    		<div type="text" class="form-control form-control-user col-sm-3 mr-2 rounded" id="userId">${user.userID}</div>
                                    		<input type="text" class="form-control form-control-user rounded" id="feedbackComment" name="feedbackComment">
                                    		<!-- <i class="fas fa-unlock ml-2"></i> -->
                                    		<button type="button" onclick="feedBack();" class="btn bg-gray-300 ml-2 pl-3 pr-3">
                                        	send
                                   			</button>
                                   		 </div>
                                   	</form>	 
                                   		 <hr class="hr commentList">
                                   		 <c:forEach var="feed" items="${feedList}" varStatus="status">
                                   		 <c:if test="${feed.isDel == 0}">
                                   		 <div class="d-flex justify-content-between">
                                   		 	
                                   		 	<div class="form-control form-control-user bg-light col-sm-3 mr-2 border-0">${feed.userId}</div>
                                   		 	<div class="form-control form-control-user bg-light border-0 comment" >${feed.feedbackComment}</div>
                                   		 	
                                   		 	<c:if test="${feed.userId == user.userID}">
                                   		 	<a class="far fa-trash-alt pt-2 text-gray-500" onclick="deleteFeed(this);" href="#"></a>
                                   		 	</c:if>
                                   		 	
                                   		 	
                                   		 </div>
                                   		 </c:if>
                                   		 </c:forEach>
                                </div>

                            </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>

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
            
              <!-- 업무 수정 모달 -->
    <div class="modal bg-lg" id="task_content_modal">
 		<div class="modal-dialog" role="document">
        	<div class="modal-content">
            	<div class="modal-header bg-primary">
                	<h5 class="modal-title text-light" >업무 수정</h5>
                    <button type="button" id="btn_modify_close" class="close">
                    <span aria-hidden="true">&times;</span></button>
                </div>
                <form>
                	<div class="modal-body">
                    		<div class="form-group row">
                            	<div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                	<h6 class="font-weight-bold">담당자</h6>
                                </div>
                                <div class="col-sm-9">
                                	<input class="form-control rounded"id="task_owner"></input>
                                </div>
                            </div>                	
                    		<div class="form-group row">
                            	<div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                	<h6 class="font-weight-bold">업무 이름</h6>
                                </div>
                            	<div class="col-sm-9">
                                	<input class="form-control rounded"id="task_id"></input>
                                </div>
                            </div>
                    		<div class="form-group row">
                            	<div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                	<h6 class="font-weight-bold">마감 기한</h6>
                                </div>
                                <div class="col-sm-9">
                                	<input type="date" id="dead_Line"class="form-control form-control-user h6 rounded"></input>
                                </div>
                            </div>
                            <h6 class="font-weight-bold">수정할 업무 내용</h6>
                    	 	 <textarea class="form-control"  id="modified_content" style="height: 300px; resize: none;" wrap="hard"  cols="20"></textarea>
                    	 	 <div class="text-xs text-right">*2000자 이내로 입력하세요.</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="chkInvalidUser();">수정</button>
                   </div>
                </form>
            </div>
        </div>
     </div>
 

            <!-- Bootstrap core JavaScript-->
            <script src="/resources/vendor/jquery/jquery.min.js"></script>
            <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="/resources/js/sb-admin-2.min.js"></script>
            
            <!-- feedback비동기 -->
            <script src="/resources/js/task/task.js"></script>
            
            <!-- 업무수정 -->
            <script src="/resources/js/task/task_modify.js"></script>
            
            <script type="text/javascript">
            
        	$(function(){
				modifyButton();
			 });
			
			let modifyButton = ()=>{
				
				let button = document.getElementById('modify');
				button.setAttribute('style','display:none; visibility:hidden;');
				
				<c:forEach var="member" items="${memberList}" varStatus="status">
				
				<c:if test="${member.userId == user.userID && member.userId == detailList[0].userId}">
					<c:if test="${member.authority == '팀장' || member.authority == '읽기/쓰기'}">
						let button = document.getElementById('modify');
						button.setAttribute('style','display:block; visibility:visible;');
					</c:if>
				</c:if>
				</c:forEach>
			}
			
			$(function(){
				detailContent();
			 });
			
			let detailContent = ()=>{
				
				let content = document.querySelector('#taskContent').value;
				document.querySelector('#taskContent').value = content.replace(/<br>|<br\/>|<br \/>/g, '\r\n');
				console.dir(document.querySelector('#taskContent').value);
			}
				
            </script>

        </body>

</html>