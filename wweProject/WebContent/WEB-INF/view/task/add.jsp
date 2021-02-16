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

                                       <c:if test="${alarmData.typeOfAlarm eq '업무'}">
                                          <div class="icon-circle bg-primary">
                                             <i class="fas fa-file-alt text-white"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${alarmData.typeOfAlarm eq '인원'}">
                                          <div class="icon-circle bg-success">
                                             <i class="fas fa-user-friends text-white"></i>
                                          </div>
                                       </c:if>
                                       <c:if test="${alarmData.typeOfAlarm eq '파일'}">
                                          <div class="icon-circle bg-secondary">
                                             <i class="fas fa-user-friends text-white"></i>
                                          </div>
                                       </c:if>
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

                                             <c:if test="${alarmData.typeOfAlarm eq '업무'}">
                                                <div class="icon-circle bg-primary">
                                                   <i class="fas fa-file-alt text-white"></i>
                                                </div>
                                             </c:if>
                                             <c:if test="${alarmData.typeOfAlarm eq '인원'}">
                                                <div class="icon-circle bg-success">
                                                   <i class="fas fa-user-friends text-white"></i>
                                                </div>
                                             </c:if>
                                             <c:if test="${alarmData.typeOfAlarm eq '파일'}">
                                                <div class="icon-circle bg-secondary">
                                                   <i class="fas fa-user-friends text-white"></i>
                                                </div>
                                             </c:if>
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
                                        <span class="badge badge-danger badge-counter">7</span>
                                    </a>
                                    <!-- Dropdown - Messages -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                        aria-labelledby="messagesDropdown">
                                        <h6 class="dropdown-header">
                                            Message Center
                                        </h6>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="">
                                                <div class="status-indicator bg-success"></div>
                                            </div>
                                            <div class="font-weight-bold">
                                                <div class="text-truncate">Hi there! I am wondering if you can help me
                                                    with a
                                                    problem I've been having.</div>
                                                <div class="small text-gray-500">Emily Fowler · 58m</div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="">
                                                <div class="status-indicator"></div>
                                            </div>
                                            <div>
                                                <div class="text-truncate">I have the photos that you ordered last
                                                    month, how
                                                    would you like them sent to you?</div>
                                                <div class="small text-gray-500">Jae Chun · 1d</div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="">
                                                <div class="status-indicator bg-warning"></div>
                                            </div>
                                            <div>
                                                <div class="text-truncate">Last month's report looks great, I am very
                                                    happy with
                                                    the progress so far, keep up the good work!</div>
                                                <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="dropdown-list-image mr-3">
                                                <img class="rounded-circle"
                                                    src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                                                <div class="status-indicator bg-success"></div>
                                            </div>
                                            <div>
                                                <div class="text-truncate">Am I a good boy? The reason I ask is because
                                                    someone
                                                    told me that people say this to all dogs, even if they aren't
                                                    good...</div>
                                                <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item text-center small text-gray-500" href="#">Read More
                                            Messages</a>
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
                        
                        <div class="container-fluid">
                        <div class="container-sm d-flex justify-content-center">
                            <div class="col-lg-6">
                                <div class="p-4 bg-light shadow mb-5 mt-4 rounded">
                                    <div class="text-center pt-3 pb-2 bg-dark">
                                        <h1 class="h4 text-white font-weight-bold">업무추가</h1>
                                    </div>
                                    <hr class="hr">
                                    <form class="user" action="${context}/task/addimpl" method="post">
                                        <div class="form-group row">
                                            <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                                <h6 class="font-weight-bold">업무 이름</h6>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="text" id="taskName" name="taskName" class="form-control form-control-user rounded">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center" onfocus="calendar();>
                                                <h6 class="font-weight-bold">마감 기한</h6>
                                            </div>
                                            <div class="col-sm-9">
                                                <input type="date" id="deadLine" name="deadLine"  class="form-control form-control-user rounded">
                                                
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-sm-3 mb-3 mb-sm-0 d-flex align-items-center">
                                                <h6 class="font-weight-bold">상세 설명</h6>
                                            </div>
                                            <div class="col-sm-9">
                                                <textarea name="taskContent" id="taskContent" name="detail" rows="3" cols="27" class="form-control form-control-user rounded  wrap="hard"  cols="20"></textarea>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="d-flex justify-content-end ">
                                            <a href="${context}/task/my" class="btn btn-dark btn-icon-split mr-3">
                                                <span class="text">취소</span>
                                            </a>
                                            <button class="btn btn-dark btn-icon-split"">
                                                <span class="text">완료</span>
                                            </button>
                                        </div>
                                    </form>
                                    <hr>
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
                <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">Select "Logout" below if you are ready to end your current
                                session.
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="login.html">Logout</a>
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
                <script src="/resources/js/task/task.js"></script>

        </body>

        </html>

        </html>