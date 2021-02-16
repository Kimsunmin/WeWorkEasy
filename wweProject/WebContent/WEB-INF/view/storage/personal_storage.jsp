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
                    <h1 class="h3 mb-2 text-gray-800">Personal Storage</h1>
                    
                    <div class="row">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4 col-xl-9 col-lg-8">
                            <div class="card-header py-3 d-flex justify-content-between">
                                <div>
                                    <a href="#" onclick="reset(false)"><h6 class="m-0 font-weight-bold text-primary">Storage</h6></a>
                                </div>
                            </div>
                                <div class="card-body">
                                    
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>FileName</th>
                                                    <th>Content</th>
                                                    <th>Option</th>
                                                    <th>Date</th>
                                                </tr>
                                            </thead>
                                            <tbody id="table-data">
                                            	
                                            	<c:forEach var="fileData" items="${dataList}">
                                            		<tr>
                                            			<td>${fileData.fileName}</td>
                                            			<td>${fileData.fileContent}</td>
                                            			<td>
                                                            <a href="#" class="text-info"  onclick="downloadFile(
                                                                '${fileData.fileName}',
                                                                '${fileData.fileRename}',
                                                                '${fileData.filePath}'
                                                            )">
                                                            	<i class="fas fa-file-download"></i>
                                                            </a>
                                                            <a href="#" class="text-danger" onclick="deleteFile(
                                                            	'${fileData.fileIdx}',
                                                                '${fileData.fileRename}',
                                                                '${fileData.filePath}',
                                                                false
                                                            )">
                                                            	<i class="fas fa-trash-alt"></i>
                                                            </a>
                                                        </td>
                                            			<td>${fileData.updateDate}</td>                                    
                                            		</tr>
                                            	</c:forEach>
                                            </tbody>
                                        </table>
                                        <ul class="pagination">
                                            <li class="page-item">
                                            <a class="page-link" href="${context}/storage/personal?page=1">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                            </li>
                                            <c:forEach var="item" items="${viewList}" varStatus="status">
                                            	<c:choose>
                                            		<c:when test="${item eq pageNum}">
                                            			<li class="page-item bg-primary"><a class="page-link bg-primary text-white" href="${context}/storage/personal?page=${item}">${item}</a></li>
                                            		</c:when>
                                             		<c:when test="${item > maxPage}">
                                            			<li class="page-item disabled"><a class="page-link">${item}</a></li>
                                            		</c:when>
                                            		<c:otherwise>
                                            			<li class="page-item"><a class="page-link" href="${context}/storage/personal?page=${item}">${item}</a></li>
                                            		</c:otherwise>
                                            	</c:choose>
                                            
                                            </c:forEach>
    
                                            <li class="page-item">
                                            <a class="page-link" href="${context}/storage/personal?page=${maxPage}">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                        </div>
                        <div class="col-xl-3 col-lg-5">              
                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">FILE INFO</h6>
                                </div>
                                <div class="card-body">
                                
                                    <form action="${context}/storage/pUpload" enctype="multipart/form-data" method="post">
                                        <input type="file" class="form-control-file" name="file"/>
                                      
                                        <textarea rows="10" cols="20" placeholder="Content text" class="form-control my-2 textarea-form" name="content" id="textarea-form"></textarea>
                                    
                                        <button class="btn btn-primary btn-icon-split">
                                            <span class="text">UPLOAD</span>
                                        </button>
                                        <button class="btn btn-danger btn-icon-split">
                                            <span class="text">RESET</span>
                                        </button>
                                    </form>
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
    
    <script src="/resources/js/storage/view-storage.js"></script>

</body>
</html>
