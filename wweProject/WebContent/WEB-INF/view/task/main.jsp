<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>

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
                        <div class="btn pl-3 pr-3">
                            <i class="fas fa-laugh-wink h1 text-dark mr-3 mt-2"></i>
                            <span class="text-primay font-weight-bold h1 mr-4" id="projectId">${selectProject.projectId}</span>
                        </div>
                        </div>
                        <hr class="hr">

						<!-- 멤버 별 업무리스트 뽑아오기 -->
                        <!-- Basic Card Example -->
                      
                        <div class="row justify-content-around d-flex">
                        
                        	<c:if test="${selectProject.leaderId == user.userID}">
                        	<div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <a class="m-0 font-weight-bold text-primary" id="leaderName" href="${context}/task/my">My List</a>
                                    <div class="btn btn-primary btn-icon-split ml-3" id="authority">
                                        <span class="text">Leader</span>
                                    </div>
                                </div>
                                <div class="card-body leaderList">
                                </div>
                            </div>
                        	
                        	</c:if>
                          
							<c:if test="${selectProject.leaderId != user.userID}">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <a class="m-0 font-weight-bold text-primary" id="leaderName" href="${context}/task/member?name=${selectProject.leaderId}">${selectProject.leaderId}</a>
                                    <div class="btn btn-primary btn-icon-split ml-3" id="authority">
                                        <span class="text">Leader</span>
                                    </div>
                                </div>
                                <div class="card-body leaderList">

                                </div>
                            </div>


                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3 d-flex justif y-content-between align-items-center">
                                    <a class="m-0 font-weight-bold text-primary" href="${context}/task/my">My List</a>
                                    <span class="btn btn-info btn-icon-split ml-3 ">
                                        <span class="text">팀원</span>
                                    </span>
                                </div>
                                <div class="card-body mylist">
                                </div>
                            </div>
							</c:if>
							
							<c:forEach var="member" items="${memberList}" varStatus="status">
							<c:if test="${member.userId != selectProject.leaderId && member.userId != user.userID}">
							
                            <!-- Basic Card Example -->
                            <div class="card shadow mb-4 ">
                                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                    <a class="m-0 font-weight-bold text-primary" id="mName" href="${context}/task/member?name=${member.userId}">
                                    ${member.userId}
                                    </a>
                                    <span class="btn btn-info btn-icon-split ml-3" >
                                        <span class="text" id="mName">팀원</span>
                                    </span>
                                </div>
                                <div class="card-body memberlist">
                                <c:forEach var="task" items = "${taskList}" varStatus="status">
								<c:if test="${task.userId == member.userId && task.taskState != 'ST04'  && task.taskState != 'ST03'}">
                                  <div class="mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm" >
                                        <a href='${context}/task/detail?name=${task.taskId}' class="text-gray-600 border-0" draggable="true">
                                            <div>
                                               ${task.taskId}
                                            </div>
                                            <div class="progress progress-sm">
                                            	<c:if test= "${task.taskState == 'ST00'}">
                                                <div class="progress-bar bg-info" Id="progressbar" style="width: 0"
                                                    aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </c:if>
                                                <c:if test= "${task.taskState == 'ST01'}">
                                                <div class="progress-bar bg-info" Id="progressbar" style="width: 50%"
                                                    aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </c:if>
                                                <c:if test= "${task.taskState == 'ST02'}">
                                                <div class="progress-bar bg-info" Id="progressbar" style="width: 100%"
                                                    aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                                </c:if>
                                            </div>
                                        </a>
                                        <span class="btn btn-sm ml-1 mr-1">
                                        	<c:if test = "${task.taskPriority == 'PR01'}">
                                        	<i class= "fas fa-exclamation-triangle text-danger" onhover="priorityAlarm();"></i>
                                        	</c:if>
                                        </span>
                                    </div>
                                  </c:if>
                            	</c:forEach>		
                                </div>
                            </div>
                           
							</c:if>
    						</c:forEach>
                            
                        </div>
                        </div>

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
   

                <!-- Bootstrap core JavaScript-->
                <script src="/resources/vendor/jquery/jquery.min.js"></script>
                <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

                <!-- Core plugin JavaScript-->
                <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

                <!-- Custom scripts for all pages-->
                <script src="/resources/js/sb-admin-2.min.js"></script>
                                
				<!-- 업무리스트 출력 -->
             	<script>
				
				$(function(){
    					selectTaskList();
   				 });
    			let selectTaskList = ()=>{
       				 let tasklist;
       				 let taskname;
       				 let divElement;
        			 let progressbar;
        			 let innerprogress;
        			 let issue;
        			 let memberName;
        			 let icon;
       			<c:forEach var="task" items="${taskList}" varStatus="status">
       			
       			<c:choose>
       			<c:when test="${task.userId == user.userID && user.userID == selectProject.leaderId && task.taskState != 'ST04' && task.taskState != 'ST03'}">
       				
					tasklist = document.createElement('div');
					divElement = document.createElement('div');
					taskname = document.createElement('a');
					progressbar = document.createElement('div');
					innerprogress = document.createElement('div');
					issue = document.createElement('span');
					memberName = document.querySelector('#mName');
					icon = document.createElement('i');
					
					tasklist.setAttribute('class','mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm');
					taskname.setAttribute('class','text-gray-600 border-0');
					taskname.setAttribute('href','${context}/task/detail?name=${task.taskId}');
					progressbar.setAttribute('class','progress progress-sm');
					innerprogress.setAttribute('class','progress-bar bg-info');
					innerprogress.setAttribute('role','progressbar');
					innerprogress.setAttribute('aria-valuenow','50');
					innerprogress.setAttribute('aria-valuemin','aria-valuemin');
					innerprogress.setAttribute('aria-valuemax','100');
					<c:if test= "${task.taskState == 'ST00'}">
					innerprogress.setAttribute('style','width: 0');
					</c:if>
					<c:if test= "${task.taskState == 'ST01'}">
					innerprogress.setAttribute('style','width: 50%');
					</c:if>
					<c:if test= "${task.taskState == 'ST02'}">
					innerprogress.setAttribute('style','width: 100%');
					</c:if>
					issue.setAttribute('class','btn btn-sm ml-1 mr-1');
					icon.setAttribute('class','fas fa-exclamation-triangle text-danger');

					divElement.innerHTML += '${task.taskId}';
		
					taskname.appendChild(divElement);
					progressbar.appendChild(innerprogress);
					taskname.appendChild(progressbar);
					<c:if test= "${task.taskPriority == 'PR01'}">
					issue.appendChild(icon);
					</c:if>
					tasklist.appendChild(taskname);
					tasklist.appendChild(issue);
					

					document.querySelector('.leaderList').appendChild(tasklist);
					
					</c:when>
					
       					<c:when test="${task.userId == selectProject.leaderId && task.taskState != 'ST04' && task.taskState != 'ST03'}">
       					tasklist = document.createElement('div');
       					divElement = document.createElement('div');
       					taskname = document.createElement('a');
       					progressbar = document.createElement('div');
       					innerprogress = document.createElement('div');
       					issue = document.createElement('span');
       					memberName = document.querySelector('#mName');
       					icon = document.createElement('i');
       					
       					tasklist.setAttribute('class','mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm');
       					taskname.setAttribute('class','text-gray-600 border-0');
       					taskname.setAttribute('href','${context}/task/detail?name=${task.taskId}');
       					progressbar.setAttribute('class','progress progress-sm');
       					innerprogress.setAttribute('class','progress-bar bg-info');
       					innerprogress.setAttribute('role','progressbar');
       					innerprogress.setAttribute('aria-valuenow','50');
       					innerprogress.setAttribute('aria-valuemin','aria-valuemin');
       					innerprogress.setAttribute('aria-valuemax','100');
       					<c:if test= "${task.taskState == 'ST00'}">
       					innerprogress.setAttribute('style','width: 0');
       					</c:if>
       					<c:if test= "${task.taskState == 'ST01'}">
       					innerprogress.setAttribute('style','width: 50%');
       					</c:if>
       					<c:if test= "${task.taskState == 'ST02'}">
       					innerprogress.setAttribute('style','width: 100%');
       					</c:if>
       					issue.setAttribute('class','btn btn-sm ml-1 mr-1');
       					icon.setAttribute('class','fas fa-exclamation-triangle text-danger');

       					divElement.innerHTML += '${task.taskId}';
				
       					taskname.appendChild(divElement);
       					progressbar.appendChild(innerprogress);
       					taskname.appendChild(progressbar);
       					tasklist.appendChild(taskname);
       					<c:if test= "${task.taskPriority == 'PR01'}">
    					issue.appendChild(icon);
    					</c:if>
       					tasklist.appendChild(issue);

       					document.querySelector('.leaderList').appendChild(tasklist);
       					
       					</c:when>
       					
       					<c:when test="${task.userId == user.userID && task.taskState != 'ST04' && task.taskState != 'ST03'}">
       					tasklist = document.createElement('div');
       					divElement = document.createElement('div');
       					taskname = document.createElement('a');
       					progressbar = document.createElement('div');
       					innerprogress = document.createElement('div');
       					issue = document.createElement('span');
       					icon = document.createElement('i');
       					
       					tasklist.setAttribute('class','mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm');
       					taskname.setAttribute('class','text-gray-600 border-0');
       					taskname.setAttribute('href','${context}/task/detail?name=${task.taskId}');
       					progressbar.setAttribute('class','progress progress-sm');
       					innerprogress.setAttribute('class','progress-bar bg-info');
       					innerprogress.setAttribute('role','progressbar');
       					innerprogress.setAttribute('aria-valuenow','50');
       					innerprogress.setAttribute('aria-valuemin','aria-valuemin');
       					innerprogress.setAttribute('aria-valuemax','100');
       					<c:if test= "${task.taskState == 'ST00'}">
       					innerprogress.setAttribute('style','width: 0');
       					</c:if>
       					<c:if test= "${task.taskState == 'ST01'}">
       					innerprogress.setAttribute('style','width: 50%');
       					</c:if>
       					<c:if test= "${task.taskState == 'ST02'}">
       					innerprogress.setAttribute('style','width: 100%');
       					</c:if>
       					issue.setAttribute('class','btn btn-sm ml-1 mr-1');
       					icon.setAttribute('class','fas fa-exclamation-triangle text-danger');

       					divElement.innerHTML += '${task.taskId}';
				
       					taskname.appendChild(divElement);
       					progressbar.appendChild(innerprogress);
       					taskname.appendChild(progressbar);
       					<c:if test= "${task.taskPriority == 'PR01'}">
    					issue.appendChild(icon);
    					</c:if>
       					tasklist.appendChild(taskname);
       					tasklist.appendChild(issue);

       					document.querySelector('.myList').appendChild(tasklist);
       					</c:when>
       					
       					</c:choose>
        		</c:forEach>
        		
   				}
    			</script>

        </body>

        </html>