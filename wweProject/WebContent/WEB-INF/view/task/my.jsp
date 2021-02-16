<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>My List</title>

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
                                    <span class="text-primay font-weight-bold h1 mr-4">My List</span>
                                </div>
                            </div>
                            <hr class="hr">

                            <!-- Basic Card Example -->
                            <div class="row justify-content-around d-flex">

                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex justify-content-center align-items-center">
                                        <span class="btn bg-gradient-secondary pl-5 pr-5">
                                            <span class="h3 pt-2 text-white">TO DO</span>
                                        </span>
                                    </div>
                                    <!-- todoList 추가영역 -->
                                    <div class="card-body todolist" ondragover="onDragOver(event);" ondrop="onDrop(event);" id="ST00">
									
                                    <div id="addButton">
                                        <div class=" d-flex justify-content-between mb-3 ">
                                           <span class="btn btn-icon-split bg-gray-300 shadow-sm">
                                                <span class="m-1 text-white">업무추가</span>
                                            </span>
                                            <span>
                                                <a class="icon btn text-white mr-2 bg-gray-300 shadow-sm"
                                                    onclick="addTask();">
                                                    <i class="fas fa-plus"></i>
                                                </a>
                                            </span>
                                        </div>
                                      </div>

                                    </div>
                                </div>

                                <!-- Basic Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex justify-content-center align-items-center">
                                        <div class="btn bg-gradient-secondary pl-5 pr-5">
                                            <span class="h3 pt-2 text-white">DOING</span>
                                        </div>
                                    </div>
                                    <!-- doingList추가영역 -->
                                    <div class="card-body doingzone" id="ST01" ondragover="onDragOver(event);" ondrop="onDrop(event);">
                                    </div>
                                </div>

                                <!-- Basic Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3 d-flex justify-content-center align-items-center">
                                        <div class="btn bg-gradient-secondary pl-5 pr-5">
                                            <span class="h3 pt-2 text-white">DONE</span>
                                        </div>
                                    </div>
                                    <!-- doneList추가영역 -->
                                    <div class="card-body donezone" id="ST02" ondrop="onDrop(event);" ondragover="onDragOver(event);">
                          					
                                    </div>
                                </div>


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
            
           <!-- 업무추가 모달창 -->
            
             <div class="modal bg-lg" id="task_add_modal">
 		<div class="modal-dialog" role="document">
        	<div class="modal-content">
            	<div class="modal-header bg-primary">
                	<h5 class="modal-title text-light" >업무 추가</h5>
                    <button type="button" id="btn_add_close" class="close">
                    <span aria-hidden="true">&times;</span></button>
                </div>
                <form>
                	<div class="modal-body">        	
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
                            <h6 class="font-weight-bold">업무 내용</h6>
                    	 	 <textarea class="form-control"  id="task_content" style="height: 300px; resize: none;" wrap="hard"  cols="20"></textarea>
                    	 	 <div class="text-xs text-right">*2000자 이내로 입력하세요.</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="add();">완료</button>
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
            
            <!-- drag&drop -->
            <script src="/resources/js/task/drag.js"></script>
             
            <script src="/resources/js/task/add.js"></script>
             
            
             
             <!-- 업무리스트 출력 -->
             	<script>
				
				$(function(){
    					selectTaskList();
   				 });
    			let selectTaskList = ()=>{
       				 let todotask;
       				 let checkBox;
        			 let inputElement;
        			 let todobutton;
        			 let taskName;
        			 let issue;
        			 let icon;
       			<c:forEach var="my" items="${myList}" varStatus="status">
       			<c:choose>
					<c:when test="${my.taskState == 'ST00'}"> 
						
       					todotask = document.createElement('div');
       					checkBox = document.createElement('div');
       					inputElement = document.createElement('input');
       					todobutton = document.createElement('div');
       					issue = document.createElement('span');
       					taskName = document.createElement('a');
       					icon = document.createElement('i');
       					
       					//inputElement.setAttribute('type','checkbox');
       					/* inputElement.setAttribute('id','priority'); */
       					//todotask.setAttribute('class','d-flex');
       					//checkBox.setAttribute('class','checkbox pt-4 mr-3');
       					//checkBox.setAttribute('id','priority');
       					todobutton.setAttribute('class', 'mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm border-0');
       					todobutton.setAttribute('ondragstart','onDragStart(this,event);');
       					todobutton.setAttribute('draggable','true');
       					todobutton.setAttribute('id','ST00${status.index}');
       					taskName.setAttribute('class','text-gray-600');
       					taskName.setAttribute('href','${context}/task/detail?name=${my.taskId}');
       					issue.setAttribute('class','btn btn-sm ml-1');
       					icon.setAttribute('class','fas fa-exclamation-triangle text-danger');
    					icon.setAttribute('onhover','priorityAlarm();');

       					taskName.innerHTML += '${my.taskId}';
       					//checkBox.appendChild(inputElement);
       					todobutton.appendChild(taskName);
       					todobutton.appendChild(issue);
       					//todotask.appendChild(checkBox);
       					<c:if test= "${my.taskPriority == 'PR01'}">
    					issue.appendChild(icon);
    					</c:if>
       					todotask.appendChild(todobutton);
       				
       					document.querySelector('.todolist').appendChild(todotask);
       				</c:when>
       				<c:when test="${my.taskState == 'ST01'}">       					
   						todotask = document.createElement('div');
   						checkBox = document.createElement('div');
   						inputElement = document.createElement('input');
   						todobutton = document.createElement('div');
   						issue = document.createElement('span');
   						taskName = document.createElement('a');
   						icon = document.createElement('i');
   					
   						//inputElement.setAttribute('type','checkbox');
   						/* inputElement.setAttribute('id','priority'); */
   						//todotask.setAttribute('class','d-flex');
   						//checkBox.setAttribute('class','checkbox pt-4 mr-3');
   						//checkBox.setAttribute('id','priority');
   						todobutton.setAttribute('class', 'mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm border-0');
   						todobutton.setAttribute('ondragstart','onDragStart(this,event);');
   						todobutton.setAttribute('draggable','true');
   						todobutton.setAttribute('id','ST01${status.index}');
   						taskName.setAttribute('class','text-gray-600');
   						taskName.setAttribute('href','${context}/task/detail?name=${my.taskId}');
   						issue.setAttribute('class','btn btn-sm ml-1');
   						icon.setAttribute('class','fas fa-exclamation-triangle text-danger');
    					icon.setAttribute('onhover','priorityAlarm();');

   						taskName.innerHTML += '${my.taskId}';
   						//checkBox.appendChild(inputElement);
   						todobutton.appendChild(taskName);
   						todobutton.appendChild(issue);
   						//todotask.appendChild(checkBox);
   						<c:if test= "${my.taskPriority == 'PR01'}">
    					issue.appendChild(icon);
    					</c:if>
   						todotask.appendChild(todobutton);
   				
   						document.querySelector('.doingzone').appendChild(todotask);
   					</c:when>
   					<c:when test="${my.taskState == 'ST02'}">       					
						todotask = document.createElement('div');
						checkBox = document.createElement('div');
						inputElement = document.createElement('input');
						todobutton = document.createElement('div');
						issue = document.createElement('span');
						taskName = document.createElement('a');
						icon = document.createElement('i');
					
						//inputElement.setAttribute('type','checkbox');
						/* inputElement.setAttribute('id','priority'); */
						//todotask.setAttribute('class','d-flex');
						//checkBox.setAttribute('class','checkbox pt-4 mr-3');
						//checkBox.setAttribute('id','priority');
						todobutton.setAttribute('class', 'mb-4 py-3 bg-gray-100 pl-4 d-flex justify-content-center rounded shadow-sm border-0');
						todobutton.setAttribute('ondragstart','onDragStart(this,event);');
						todobutton.setAttribute('draggable','true');
						todobutton.setAttribute('id','ST02${status.index}');
						taskName.setAttribute('class','text-gray-600');
						taskName.setAttribute('href','${context}/task/detail?name=${my.taskId}');
						issue.setAttribute('class','btn btn-sm ml-1');
						icon.setAttribute('class','fas fa-exclamation-triangle text-danger');
    					icon.setAttribute('onhover','priorityAlarm();');

						taskName.innerHTML += '${my.taskId}';
						//checkBox.appendChild(inputElement);
						todobutton.appendChild(taskName);
						todobutton.appendChild(issue);
						//todotask.appendChild(checkBox);
						<c:if test= "${my.taskPriority == 'PR01'}">
    					issue.appendChild(icon);
    					</c:if>
						todotask.appendChild(todobutton);
				
						document.querySelector('.donezone').appendChild(todotask);
					</c:when>

       			</c:choose>
        		</c:forEach>
   			 }
    			
    			$(function(){
    				addButton();
    			 });
    			
    			let addButton = ()=>{
    			
    				<c:forEach var="my" items="${memberList}" varStatus="status">
    				
    				<c:if test="${my.userId == user.userID && my.authority == '읽기'}">

					let button = document.getElementById('addButton');
					button.setAttribute('style','display:none; visibility:hidden;');
					</c:if>
					
					</c:forEach>
    			}
  		  </script>

			
        </body>

        </html>

