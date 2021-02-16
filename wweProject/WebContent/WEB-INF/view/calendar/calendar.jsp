<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link href="/resources/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/css/calendar/main.css" rel="stylesheet"></link>
<script type="text/javascript" src="/resources/js/calendar/main.js"></script>
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/project/loadpro">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">WeWorkEasy</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/member/mypage">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>My Page</span></a>
            </li>
            

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="/task/main">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Main Page</span></a>
            </li>
            

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
        		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
            		<i class="fas fa-crown"></i>
            			<span>Admin Page</span>
        		</a>
        	<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
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
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>views</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">view Screens:</h6>
                        <a class="collapse-item" href="${context}/views/calendar">Calendar</a>
                        <a class="collapse-item" href="${context}/views/graph">Graph</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages1"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Storage</span>
                </a>
                <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Storage</h6>
                        <a class="collapse-item" href="${context}/storage/personal">Personal</a>
                        <a class="collapse-item" href="${context}/storage/share">Share</a>
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
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.user.userName} 님</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/assets/img/icon/whale.png">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
								<a class="dropdown-item" href="/member/mypage"> 
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
										Profile
								</a> 
								<a class="dropdown-item" href="#" data-toggle="modal" data-target="#alarmModal"> 
									<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
										Activity Log
								</a>
								<div class="dropdown-divider" href="/member/logout"></div>
									<a class="dropdown-item" href="/member/logout" data-toggle="modal" data-target="#logoutModal">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											Logout
									</a>
							</div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Charts</h1>

                    <!-- Content Row -->
                    <div class="row">
	                    <div class="col-xl-8 col-lg-8">
                
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Calendar</h6>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-xl-4 col-lg-8">
                
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">팀원리스트</h6>
                                </div>
                                <div class="card-body">
                                    <div id="user-list">
                                    	<div class="card shadow mb-4">                                  		
                                    		<c:forEach var="user" items="${userList}" varStatus="status">
                                    			<div class="card-body border d-flex justify-content-between">
                                    				<label for="checkList${status.index}">${user.userId}</label>
                                    				<input type="checkbox" value="${user.userId}" onclick="checkValue(this)" name="proUsers" id="checkList${status.index}" checked="checked">
                                       			 		
                                    				</input>
                                    			</div>
                                    		</c:forEach>
                                    	</div>
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
                        <span>Copyright &copy; WeWorkEasy 2021</span>
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

    <!-- Page level plugins -->
    <script src="/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/js/demo/chart-area-demo.js"></script>
    <script src="/resources/js/demo/chart-pie-demo.js"></script>
    <script src="/resources/js/demo/chart-bar-demo.js"></script>
    <script type="text/javascript">
          let drawCalendar = (text) => {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
              initialView: 'dayGridMonth',
              eventColor : 'pink',
              dayMaxEvents: 5,
              eventTextColor : 'black',
              events : text
            });
            calendar.render();
          }
          
          let inputData = () => {
            const url = '/views/calendarimpl';
                let headerObj = new Headers();
                let paramObj = new Object();
                let list = document.querySelectorAll('input[name="proUsers"]');
                let userList = [];

                list.forEach((data,index)=>{
                    if(data.checked === false){
                        userList[index] = data.value;
                    }
                });

                headerObj.append("content-type","application/x-www-form-urlencoded");
                paramObj.name = userList;
                console.dir(JSON.stringify(paramObj));

                fetch(url,{
                    method : 'POST',
                    headers : headerObj,
                    body : 'data='+JSON.stringify(paramObj)
                }).then(response => {
                    return response.json();
                }).then(text => {
                    console.dir(JSON.stringify(text));
                    drawCalendar(text);
                });
          }

        

        </script>


        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded',inputData());
        	function checkValue(id) {
        		inputData();
            }
        </script>

</body>
</html>