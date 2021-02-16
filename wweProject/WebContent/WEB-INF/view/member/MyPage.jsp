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
</head>
<body id="page-top">
	<c:choose>
		<c:when test="${sessionScope.user != null}">
			<!-- Page Wrapper -->
			<div id="wrapper">

				<ul
					class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
					id="accordionSidebar">

					<!-- Sidebar - Brand -->
					<a
						class="sidebar-brand d-flex align-items-center justify-content-center"
						href="/project/loadpro">
						<div class="sidebar-brand-icon rotate-n-15">
							<i class="fas fa-chess-knight"></i>
						</div>
						<div class="sidebar-brand-text mx-3">WeWorkEasy</div>
					</a>

					<!-- Divider -->
					<hr class="sidebar-divider my-0">

					<!-- Nav Item - Dashboard -->
					<li class="nav-item"><a class="nav-link"
						href="${context}/member/mypage"> <i class="fas fa-user-alt"></i>
							<span>My Page</span></a></li>


					<!-- Nav Item - Pages Collapse Menu -->
					<li class="nav-item "><a class="nav-link" href="/task/main"
						data-target="#collapseTwo" aria-expanded="true"
						aria-controls="collapseTwo"> <i class="fas fa-home"></i> <span>Main
								Page</span>
					</a></li>

					<!-- 선택된 프로젝트 없으면 안보이게  -->
					<c:choose>
						<c:when test="${sessionScope.selectProject != null}">

							<!-- Nav Item - Utilities Collapse Menu -->
							<li class="nav-item"><a class="nav-link collapsed" href="#"
								data-toggle="collapse" data-target="#collapseUtilities"
								aria-expanded="true" aria-controls="collapseUtilities"> <i
									class="fas fa-crown"></i> <span>Admin Page</span>
							</a>
								<div id="collapseUtilities" class="collapse"
									aria-labelledby="headingUtilities"
									data-parent="#accordionSidebar">
									<div class="bg-white py-2 collapse-inner rounded">
										<h6 class="collapse-header">Manage</h6>
										<a class="collapse-item" href="${context}/leader/manage">팀관리</a>
										<a class="collapse-item" href="${context}/leader/totaltask">업무관리</a>
									</div>
								</div></li>

							<hr class="sidebar-divider my-0">

							<!-- Heading -->
							<div class="sidebar-heading">views</div>

							<!-- Nav Item - Pages Collapse Menu -->
							<li class="nav-item"><a class="nav-link collapsed" href="#"
								data-toggle="collapse" data-target="#collapsePages"
								aria-expanded="true" aria-controls="collapsePages"> <i
									class="fas fa-fw fa-folder"></i> <span>views</span>
							</a>
								<div id="collapsePages" class="collapse"
									aria-labelledby="headingPages" data-parent="#accordionSidebar">
									<div class="bg-white py-2 collapse-inner rounded">
										<h6 class="collapse-header">view Screens:</h6>
										<a class="collapse-item" href="/views/calendar">Calendar</a> <a
											class="collapse-item" href="/views/graph">Graph</a>
									</div>
								</div></li>

							<!-- Nav Item - Charts -->


							<li class="nav-item"><a class="nav-link collapsed" href="#"
								data-toggle="collapse" data-target="#collapsePages1"
								aria-expanded="true" aria-controls="collapsePages"> <i
									class="fas fa-fw fa-folder"></i> <span>Storage</span>
							</a>
								<div id="collapsePages1" class="collapse"
									aria-labelledby="headingPages" data-parent="#accordionSidebar">
									<div class="bg-white py-2 collapse-inner rounded">
										<h6 class="collapse-header">Storage</h6>
										<a class="collapse-item" href="/storage/personal">Personal</a>
										<a class="collapse-item" href="/storage/share">Share</a>
									</div>
								</div></li>

							<!-- 선택된 프로젝트 없으면 안보이게  -->
						</c:when>
					</c:choose>


					<!-- Divider -->
					<hr class="sidebar-divider d-none d-md-block">

					<!-- Sidebar Toggler (Sidebar) -->
					<div class="text-center d-none d-md-inline">
						<button class="rounded-circle border-0" id="sidebarToggle"></button>`
					</div>

				</ul>
				<!-- End of Sidebar -->


				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">

					<!-- Main Content -->
					<div id="content">

						<!-- Topbar -->
						<nav
							class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

							<!-- Sidebar Toggle (Topbar) -->
							<button id="sidebarToggleTop"
								class="btn btn-link d-md-none rounded-circle mr-3">
								<i class="fa fa-bars"></i>
							</button>

							<!-- Topbar Navbar -->
							<ul class="navbar-nav ml-auto">

								<!-- Nav Item - Search Dropdown (Visible Only XS) -->
								<li class="nav-item dropdown no-arrow d-sm-none"><a
									class="nav-link dropdown-toggle" href="#" id="searchDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
								</a> <!-- Dropdown - Messages -->
									<div
										class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
										aria-labelledby="searchDropdown">
										<form class="form-inline mr-auto w-100 navbar-search">
											<div class="input-group">
												<input type="text"
													class="form-control bg-light border-0 small"
													placeholder="Search for..." aria-label="Search"
													aria-describedby="basic-addon2">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</form>
									</div></li>


								<!-- alarm history -->

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
								<li class="nav-item dropdown no-arrow mx-1"><a
									class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
										<!-- Counter - Messages --> <span
										class="badge badge-danger badge-counter">+</span>
								</a> <!-- Dropdown - Messages -->
									<div
										class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
										aria-labelledby="messagesDropdown">
										<!-- 임시로 저희 페이지 띄웠습니다 -->
										<iframe src="http://127.0.0.1:3100/" class="frame"></iframe>
									</div></li>


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
										<a class="dropdown-item" href="#" data-toggle="modal"
											data-target="#alarmModal"> <i
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

							<!-- Page Heading -->
							<div
								class="d-sm-flex align-items-center justify-content-between mb-4">
								<h1 class="h3 mb-0 text-gray-800">${sessionScope.user.userName}'s
									Projects</h1>
							</div>

							<%
								String[] colorList = { "primary", "success", "info", "warning" };
							request.setAttribute("colorList", colorList);
							%>
							<div class="row">
								<c:set var="color">primary, success, info, warning</c:set>
								<c:set var="count" value="0" />
								<c:forEach var="project" items="${recentList}" begin="0" end="3">

									<div class="col-xl-3 col-md-6 mb-4">
										<div
											class="card border-left-${colorList[count]} shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div
															class="text-xs font-weight-bold text-${colorList[count]} text-uppercase mb-1">
															Project</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">♣
															${project.projectId}</div>
													</div>
													<div class="col-auto">
														<i class="fas fa-calendar fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
									<c:set var="count" value="${count=count+1}" />
								</c:forEach>


							</div>

							<div class="row">

								<div class="col-lg-4">

									<div class="card mb-4 py-3 border-left-danger">
										<div
											class="card-body d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold">개인정보 관리</h6>

											<a onclick="showManageProfile()"
												class="btn btn-success btn-circle btn-sm"> <i
												class="fas fa-arrow-right"></i>
											</a>
										</div>
									</div>

									<div class="card mb-4 py-3 border-left-success">
										<div
											class="card-body d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold">프로젝트 관리</h6>

											<a onclick="showManageProject()"
												class="btn btn-success btn-circle btn-sm"> <i
												class="fas fa-arrow-right"></i>
											</a>
										</div>
									</div>

									<div class="card mb-4 py-3 border-left-warning">
										<div
											class="card-body d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold">파일클라우드 관리</h6>

											<a onclick="showManageCloud()"
												class="btn btn-success btn-circle btn-sm"> <i
												class="fas fa-arrow-right"></i>
											</a>
										</div>
									</div>



								</div>

								<div class="col-lg-8">

									<!-- Default Card Example -->
									<div class="card mb-4 mypageitem" id="manageProfile">
										<div
											class="card-header d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">개인정보 관리</h6>
											<a onclick="showModifyProfile()"
												class="btn btn-primary btn-icon-split btn-sm"> <span
												class="icon text-white-50"> <i class="fas fa-flag"></i>
											</span> <span class="text">수정하기</span>
											</a>
										</div>
										<div class="card-body text-center" id="showProfile">
											<!-- 개인정보 출력 -->
											<h6 class="m-0 font-weight-bold text-cyan">★ 아이디 :
												${sessionScope.user.userID}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 비밀번호 :
												${sessionScope.user.userPW}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 이름 :
												${sessionScope.user.userName}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 이메일 :
												${sessionScope.user.userEmail}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 주소 :
												${sessionScope.user.userAdd}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 전화번호 :
												${sessionScope.user.userTell}</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">★ 생일 :
												${sessionScope.user.userBirth}</h6>
											<br>
										</div>

										<div class="card-body text-center mypageitem"
											id="modifyProfile">
											<!-- 개인정보 출력 -->
											<h6 class="m-0 font-weight-bold text-cyan">★ 아이디 :
												${sessionScope.user.userID}</h6>
											<br> <input type="hidden" id="userID" name="userID"
												value="${sessionScope.user.userID}">
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 비밀번호 <input type="text"
													class="form-control form-control-user" id="userPW"
													name="userPW" value="${sessionScope.user.userPW}">
											</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 이름 <input type="text"
													class="form-control form-control-user" id="userName"
													name="userName" value="${sessionScope.user.userName}">
											</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 이메일 <input type="email"
													class="form-control form-control-user" id="userEmail"
													name="userEmail" value="${sessionScope.user.userEmail}">
											</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 주소 <input type="text"
													class="form-control form-control-user" id="userAdd"
													name="userAdd" value="${sessionScope.user.userAdd}">
											</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 전화번호 <input type="text"
													class="form-control form-control-user" id="userTell"
													name="userTell" value="${sessionScope.user.userTell}">
											</h6>
											<br>
											<h6 class="m-0 font-weight-bold text-cyan">
												★ 생일 <input type="date"
													class="form-control form-control-user" id="userBirth"
													name="userBirth" value="${sessionScope.user.userBirth}">
											</h6>
											<br> <a onclick="modifyProfile()"
												class="btn btn-info btn-icon-split btn-sm"> <span
												class="icon text-white-50"> <i class="fas fa-flag"></i>
											</span> <span class="text">완료</span>
											</a>
										</div>
									</div>

									<!-- Basic Card Example -->
									<div class="card shadow mb-4 mypageitem " id="manageFileCloud">
										<div
											class="card-header d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">파일 클라우드</h6>
											<a href="/storage/personal"
												class="btn btn-primary btn-icon-split btn-sm"> <span
												class="icon text-white-50"> <i class="fas fa-flag"></i>
											</span> <span class="text">이동하기</span>
											</a>
										</div>
										<div class="card-body">
											<h6 class="m-0 font-weight-bold text-orange text-center">504
												MB / 1 GB</h6>
											<br>
											<div class="progress progress-sm mr-2">
												<div class="progress-bar bg-info" role="progressbar"
													style="width: 50%" aria-valuenow="50" aria-valuemin="0"
													aria-valuemax="100"></div>
											</div>
										</div>
									</div>

									<!-- Dropdown Card Example -->
									<div class="card shadow mb-4 mypageitem" id="manageProject">
										<!-- Card Header - Dropdown -->
										<div
											class="card-header d-flex flex-row align-items-center justify-content-between">
											<h6 class="m-0 font-weight-bold text-primary">프로젝트 관리</h6>
											<!-- <a onclick="showModifyProject()"
												class="btn btn-primary btn-icon-split btn-sm"> <span
												class="icon text-white-50"> <i class="fas fa-flag"></i>
											</span> <span class="text">수정하기</span>
											</a> -->
										</div>
										<!-- Card Body -->
										<div class="card-body text-center" id="showProject">
											<c:forEach var="project" items="${recentList}">

												<h6 class="m-0 font-weight-bold text-cyan">♣
													${project.projectId}</h6>
												<br>
											</c:forEach>
										</div>
										<div class="card-body text-center mypageitem"
											id="modifyProject">
											<c:forEach var="project" items="${recentList}">
												<h6 class="m-0 font-weight-bold text-cyan">
													♣ ${project.projectId}<a href="#"
														class="btn btn-danger btn-icon-split btn-sm"> <span
														class="icon text-white-50"> <i class="fas fa-trash"></i>
													</span> <span class="text">탈퇴</span></a>
												</h6>
												<br>
											</c:forEach>
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
								<span>Copyright &copy; WWE 2021</span>
							</div>
						</div>
					</footer>
					<!-- End of Footer -->

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->
		</c:when>
		<c:otherwise>
			<h1>로그인 해야쥬</h1>
		</c:otherwise>
	</c:choose>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
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
	<script src="../resources/vendor/jquery/jquery.min.js"></script>
	<script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/js/sb-admin-2.min.js"></script>
	<script src="../resources/js/model/signController.js"></script>

</body>
</html>