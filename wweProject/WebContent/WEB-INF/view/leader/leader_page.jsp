<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/fontawesome.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/solid.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/brands.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/svg-with-js.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/regular.min.css" rel="stylesheet">
<link href="/resources/vendor/fontawesome-free/css/v4-shims.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs="crossorigin="anonymous"></script>
<link href="/resources/scss/_variables.scss" rel="stylesheet">
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- 사이드바 제목-->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${context}/project/loadpro">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">WeWorkEasy</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
               <!-- Nav Item - Dashboard -->
    <li class="nav-item">
        <a class="nav-link" href="${context}/member/mypage">
            <i class="fas fa-user-alt"></i>
            <span>My Page</span></a>
    </li>


    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item ">
        <a class="nav-link" href="${context}/task/main" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-home"></i>
            <span>Main Page</span>
        </a>
    </li>
            

              <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities" >
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
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>views</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">view Screens:</h6>
                        <a class="collapse-item" href="/views/calendar">Calendar</a>
                        <a class="collapse-item" href="/views/graph">Graph</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1" aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Storage</span>
                </a>
                <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
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
                    <h3 class="text-primary">팀관리</h3>
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
                        <div class="topbar-divider d-none d-sm-block"></div>

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

                <!-- Begin Page Content -->
                <div class="container-fluid">
                	<div class="row">
               			<ul class="col-2 mt-5 list-group">
               			<button type="button" class="btn btn-danger" onclick="deleteProject('${sessionScope.selectProject.projectId}');">프로젝트 삭제</button><br>
               				<li class=" list-group-item bg-dark text-white">업무 할당</li>
               				<c:forEach var="user" items="${userList}" varStatus="status">
               					<a href="#" class="list-group-item list-group-item-action" onclick="openAllocModal(this)">${user.userId}
               					<i class="fas fa-plus-circle float-right text-success"></i>
               					</a>
               				</c:forEach>
               			</ul>
                    <div class="mt-5 col">
                        <div class="card bg-white px-4">
                        	<div class=" mt-4">
                				<h5 class="text-Dark">권한 관리</h5>
                			</div>
                			<div class="">
                				<hr>
                			</div>
                			
                			 <!-- 유저 초대 팝업을 열기 위한 버튼 -->
                            <div class="mb-3">
                             <button type="button" class="btn btn-outline-dark btn-sm px-5" id="btn_open_invite_modal">초대</button>
                            </div>
                             <!-- /유저 초대 팝업을 열기 위한 버튼 -->

                            <!-- 유저 정보 테이블 -->
                            <div class="">
                                <table class="table table-hover table-bordered">
                                        <tr class="bg-dark">
                                            <th style="width:30%" class="text-white">계정</th>
                                            <th style="width:20.66%" class="text-white">권한</th>
                                            <th style="width:14.33%" class="text-center text-white">관리</th>
                                        </tr>
                                        <tbody>
                                       <!-- DB불러와서 동적으로 tr요소 생성할 곳 -->
                                        </tbody>
                                    
                                </table>
                            </div>
                            <!-- /유저 정보 테이블 -->
                            <div class="">
                            <ul>
                            	<li class="text-dark">팀장 : 업무수정, 업무 할당, 팀원 초대, 프로젝트 삭제</li>
                            	<li class="text-dark">읽기 : 업무 생성 불가, 읽기만 가능</li>
                            	<li class="text-dark">읽기/쓰기 : 업무 생성, 수정, 삭제</li>
                            </ul>
                            </div>
                        </div>
           			 </div>
           			 </div>
                    	  <!-- 팀원 초대 팝업 모달 -->
                    <div class="modal" id="invite_modal">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">유저 초대</h5>
                                    <button type="button" id="btn_invite_close" class="close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label class="col-form-label" for="inputDefault">초대할 계정</label>
                                            <input type="text" class="form-control"  id="userId" name="userId">
                                        </div>
                                         <!-- 유효한 아이디인지 아닌지를 보여주는 span태그 -->
                                        <span class="text-danger" id="idChk"></span>
                                    </div>
                                   
                                    <div class="modal-body">
                                        <label class="col-form-label">권한</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="authority" id="read"  value="읽기" checked >
                                            <label class="form-check-label" for="read">
                                              읽기
                                            </label>
                                          </div>
                                          <hr>
                                          <div class="col-form-label">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="authority" id="read_write" value="읽기/쓰기">
                                                <label class="form-check-label" for="read_write">
                                                 읽기/쓰기
                                                </label>
                                              </div>
                                          </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary"data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary" onclick="idCheck();" id="btn_invite">초대</button>
                                        <!-- <input type="submit" class="btn btn-primary"  id="btn_invite" value="초대"> -->
                                    </div>
                                </form>
                              
                            </div>
                        </div>
                    </div>
                      	  <!-- 유저 권한 수정 모달 -->
                    <div class="modal" id="modify_modal">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">권한 수정</h5>
                                    <button type="button" id="btn_modify_close" class="close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form>
                                    <div class="modal-body">
                                        <label class="col-form-label">권한</label>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="mod_authority" id="mod_read"  value="읽기" checked >
                                            <label class="form-check-label" for="mod_read">
                                              읽기
                                            </label>
                                          </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="mod_authority" id="mod_read_write" value="읽기/쓰기">
                                                <label class="form-check-label" for="mod_read_write">
                                                 읽기/쓰기
                                                </label>
                                              </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="mod_authority" id="mod_leader" value="팀장">
                                                <label class="form-check-label" for="mod_leader">
                                                  팀장
                                                </label>
                                            </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button class="btn btn-secondary"data-dismiss="modal">취소</button>
                                        <button type="button" class="btn btn-primary" onclick="updateAuthority();" id="btn_invite">확인</button>
                                        <!-- <input type="submit" class="btn btn-primary"  id="btn_invite" value="초대"> -->
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    
                    <!--업무 할당 모달  -->
                     <div class="modal bg-lg" id="alloc_task_modal">
 		<div class="modal-dialog" role="document">
        	<div class="modal-content"> 
            	<div class="modal-header bg-primary">
                	<h5 class="modal-title text-light" >업무 할당</h5>
                    <button type="button" id="btn_allow_modal_close" class="close">
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
                                	<input type="date" id="deadLine"class="form-control form-control-user h6 rounded"></input>
                                </div>
                            </div>
                            <h6 class="font-weight-bold">업무 내용</h6>
                    	 	 <textarea class="form-control"  id="task_content" style="height: 300px; resize: none;" wrap="hard"  cols="20"></textarea>
                    	 	 <div class="text-xs text-right">*2000자 이내로 입력하세요.</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="allocTask();">확인</button>
                   </div>
                </form>
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
	<script>
    	$(function(){
    		selectUserListByPid();
    	});
    
        let selectUserListByPid=()=>{
        	let trElement;
        	let tdElement;
        	let mButtonElement;
        	let dButtonElement;
        	<c:forEach var="user" items = "${userList}" varStatus="status">
        		trElement = document.createElement('tr');
        		trElement.setAttribute("seq","${status.index}");
        		document.querySelector('tbody').appendChild(trElement);
        		<c:forEach var="i" begin="0" end="2" step="1">
        			tdElement = document.createElement('td');
        			<c:if test="${i==0}">
        				tdElement.id="userTd";
        				tdElement.innerHTML ="${user.userId}";
        			</c:if>
        			<c:if test="${i==1}">
        				tdElement.innerHTML ="${user.authority}";
        			</c:if>
        			<c:if test="${i==2}">
        			
        				<c:if test="${user.authority!='팀장'}">
        				tdElement.align="center";
        				mButtonElement = document.createElement('button');
        				mButtonElement.type="button";
        				mButtonElement.className="btn btn-dark btn-sm mr-3";
        				mButtonElement.id = "btn_open_modify_modal";
        				mButtonElement.innerHTML ="수정";
        				
        				dButtonElement = document.createElement('button');
        				dButtonElement.type="button";
        				dButtonElement.className="btn btn-danger btn-sm";
        				dButtonElement.id = "btn_delete_member";
        				dButtonElement.setAttribute("deleteId","${user.userId}");
        				dButtonElement.innerHTML ="삭제";
        				tdElement.appendChild(mButtonElement);
        				tdElement.appendChild(dButtonElement);
        				</c:if>
        			</c:if>
        				trElement.appendChild(tdElement);
        			</c:forEach>
        	</c:forEach>
        	
        	
        	
        }
    </script>
	<!--팝업 화면에서 할 수 있는 작업들을 모아놓은 js 파일  -->
    <script src="/resources/js/leader/popup_task.js"></script>
    <<!--팀장화면 전용 js 파일  -->
    <script src="/resources/js/leader/leader_page.js"></script>
    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/sb-admin-2.min.js"></script>
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    
</body>
</html>