package com.wwe.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.ToAlertException;
import com.wwe.leader.model.service.LeaderService;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.service.MemberService;
import com.wwe.member.model.vo.Member;
import com.wwe.project.model.service.ProService;
import com.wwe.project.model.vo.Project;
import com.wwe.project.model.vo.ProjectMaster;

@WebServlet("/project/*")
public class ProController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProService proService = new ProService();
	private LeaderService leaderService = new LeaderService();

	public ProController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "loadpro":
			loadProject(request, response);
			break;
		case "newproimpl":
			newProImpl(request, response);
			break;
		case "recentpro":
			recentPro(request, response);
			projectMaster(request, response);
			break;
		case "selectpro":
			selectPro(request, response);
			break;
		case "invitedpro":
			invitedPro(request, response);
			projectMaster(request, response);
			break;
		case "fetchmember":
			fetchMemberList(request, response);
			break;
		case "filtermember":
			filterMember(request, response);
			break;
		
		default:
			throw new ToAlertException(ErrorCode.CD_404);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// 프로젝트 목록 페이지 불러오는 메소드
	private void loadProject(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member userId = (Member) request.getSession().getAttribute("user"); // 세션에 있는 유저아이디 가져오기

		ArrayList<ProjectMaster> recentproList = proService.selectRecentProject(userId.getUserID());
		ArrayList<ProjUser> invitedProList = proService.selectInvitedProject(userId.getUserID());

		// 프로젝트 3개씩 잘라서 띄워주기
		List<Object> sortList = new ArrayList<Object>(); // 최종 jsp로 넘길 리스트
		List<ProjUser> initList = new ArrayList<ProjUser>(); // 3개씩 잘라서 저장할 리스트 (3개씩 들어가는 리스트)
		int i = 0; // 1씩 증가하며 initList에 저장할지 sortList에 저장할지 확인용

		for (ProjUser pro : invitedProList) { // invitedProList에 저장된 객체를 1개씩 뽑는다
			initList.add(pro); // initList에 추가하고
			i++; // i 는 1씩 증가한다
			if (i % 3 == 0 || i >= invitedProList.size()) { // 만약 i가 3의 배수거나 invitedProList의 길이보다 크거나 같을경우
				sortList.add(initList); // initList에 저장된 데이터를 sortList에 추가
				initList = new ArrayList<ProjUser>(); // 그후 initList를 다시 초기화 한다
			}
		}

		request.getSession().setAttribute("recentList", recentproList);
		request.setAttribute("recentproList", recentproList);
		request.setAttribute("invitedProList", invitedProList);
		request.setAttribute("sortList", sortList); // 3개씩 자른 프로젝트 jsp로 보내주기!

		request.getRequestDispatcher("/WEB-INF/view/project/newProject2.jsp").forward(request, response);

	}

	private void filterMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");

		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		String userId = (String) parsedData.get("userId");
		String leaderId = (String) parsedData.get("leaderId");

		Member member = proService.selectMemberForFilter(userId, leaderId);
		if (member != null) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("failed");
		}
	}

	// 새 프로젝트 생성 수행 메서드
	private void newProImpl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//세션에서 유저아이디 받아오기
		Member leaderId = (Member) request.getSession().getAttribute("user");

		
		Gson gson = new Gson();
		//fetch의 data 받아와서 
		String data = request.getParameter("data");
		//gson으로 json에서 map형태로 변환
		Map parsedData = gson.fromJson(data, Map.class);

		//parsedData 찍어보기
		//System.out.println("parsedData 확인 : " + parsedData);

		//parsedData의 title과 deadline, addedMemberList 각각 받기
		//(팀원은 여러명이므로 list로 받기)
		String title = (String) parsedData.get("title");
		String deadline = (String) parsedData.get("deadline");
		ArrayList<String> addedMemberList 
					= (ArrayList<String>) parsedData.get("addedMember");

		//ProjUser 타입의 리스트 생성
		ArrayList<ProjUser> arrayList = new ArrayList<ProjUser>();

		//추가된 팀원이 있으면 ProjUser에 title과 권한, i번째 팀원의 id를 넣어준다.
		if(addedMemberList != null) {
			for (int i = 0; i < addedMemberList.size(); i++) {
				ProjUser projUser = new ProjUser();
				projUser.setProjectId(title);
				projUser.setAuthority("읽기/쓰기");
				projUser.setUserId(addedMemberList.get(i));
	
				//넣어준 객체를 리스트에 추가
				arrayList.add(projUser);
			}
		}
		
		// 찍어보는 코드
		/*
		 * for(int i = 0; i<arrayList.size(); i++ ) {
		 * System.out.println(arrayList.get(i).getProjectId());
		 * System.out.println(arrayList.get(i).getUserId());
		 * System.out.println(arrayList.get(i).getAuthority()); }
		 */
		 

		Project project = new Project();
		project.setLeaderId(leaderId.getUserID()); //프로젝트를 만드는 사람 = leader
		project.setDueDate(deadline);
		project.setProjectId(title);

		ProjUser projUser = new ProjUser();
		projUser.setLeaderId(leaderId.getUserID()); 
		projUser.setProjectId(title);
	
		// service에 넣고 (dao를 거쳐) 되돌아온 값을 res에 넣는다.
		int res = proService.createProject(project);

		// 현재 세션에 project 키값으로 project 객체 담기
		request.getSession().setAttribute("selectProject", projUser);

		
		// 서비스에서 아이디, 권한, 제목 잘 받아오면
		if (res > 0) {
			res = leaderService.inviteUser(leaderId.getUserID(), "팀장", title);
				
			if (res > 0) {
			// ** 추가된 팀원이 있는 경우에만
				if (!arrayList.isEmpty()) {
					// 팀원추가 메서드 돌림
					//System.out.println("테스트 : " + arrayList.toString());
					proService.insertMember(arrayList);

				}
				response.getWriter().print("success");
			}else { 

			response.getWriter().print("failed");
			}
		} else {
			response.getWriter().print("failed");
		}
		
	}

	//DB의 TB_PROJECT_MASTER에 최근, 초대 클릭 시 userId, projectId, workTime 넘기기 
	private void projectMaster(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String project = request.getParameter("data");

		// GSON: JSON을 다른 클래스로 변환해주는 라이브러리
		Gson gson = new Gson(); // 자바스크립트의 객체 = JSON
		Map data = gson.fromJson(project, Map.class);
		
		String projectId = (String) data.get("projectId");
		String userId = (String) data.get("userId");
		String workTime = (String) data.get("workTime");
		
		ProjectMaster proMaster = new ProjectMaster();
		proMaster.setProjectId(projectId);
		proMaster.setUserId(userId);
		proMaster.setWorkTime(workTime);
		
		proService.projectMaster(proMaster);
			
	}

	// 최근 프로젝트 클릭시 task메인페이지로 이동하는 메소드
	private void selectPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// getParameter: fetch 값 받아오기
		String project = request.getParameter("data");

		// GSON: JSON을 다른 클래스로 변환해주는 라이브러리
		Gson gson = new Gson(); // 자바스크립트의 객체 = JSON
		Map data = gson.fromJson(project, Map.class); // getparameter로 받은 값(fetch에서 json형태로 보내준거) - json을 Map클래스로 바꿔준다

		String projectId = (String) data.get("projectId");
		String userId = (String) data.get("userId");
		String workTime = (String) data.get("workTime");
		String leaderId = "";
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");

		ArrayList<ProjectMaster> projectList = proService.selectRecentProject(member.getUserID());

		for (int i = 0; i < projectList.size(); i++) {
			if (projectList.get(i).getProjectId().equals(projectId)) {
				leaderId = projectList.get(i).getLeaderId();
				break;
			}
		}

		ProjUser projUser = new ProjUser();
		projUser.setProjectId(projectId);
		projUser.setLeaderId(leaderId);

		request.getSession().setAttribute("selectProject", projUser);

		ProjUser pUser = new ProjUser();
		pUser.setUserId(member.getUserID()); // 세션에 있는 유저의 아이디를 유저객체에 저장
		pUser.setProjectId(projectId); // 선택한 프로젝트의 프로젝트 아이디를 유저객체에 저장

		Map<String, Object> commandMap = new MemberService().selectAlarm(member.getUserID(), projectId);
		List<Object> alarmList = (List<Object>) commandMap.get("alarmList");
		request.getSession().setAttribute("alarmList", alarmList);

		ProjUser user = leaderService.chkAuthority(pUser); // 유저의 권한을 포함한 유저정보를 얻는 코드
		request.getSession().setAttribute("projUserInfo", user); // 얻은 유저정보를 세션에 저장

		if (projectId != null && userId != null && workTime != null) {
			request.getSession().setAttribute("pUser", pUser);
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}

	}

	// 최근 프로젝트 (선택한 프로젝트만 불러오는 메서드)
	private void recentPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션에서
		HttpSession session = request.getSession();
		// session의 user객체의 모든 속성을 다 받아온다.
		Member member = (Member) session.getAttribute("user");

		// 그 중에 userId 사용
		// service에서 ArrayList로 날아오는 것을 받음
		ArrayList<ProjectMaster> projectList = proService.selectRecentProject(member.getUserID());

		if (projectList != null) { // 값이 제대로 들어왔는지 확인
			// request 영역에 저장
			request.setAttribute("projectList", projectList);
			request.getRequestDispatcher("/WEB-INF/view/task/main.jsp").forward(request, response);

		} else {
			System.out.println("프로젝트를 불러오지 못했습니다.");
		}
	}

	// 초대된 프로젝트
	private void invitedPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서
		HttpSession session = request.getSession();
		// 유저 속성을 전부 받아오고
		Member member = (Member) session.getAttribute("user");

		// getParameter: fetch의 body의 data를 받아옴
		String data = request.getParameter("data");

		Gson gson = new Gson();
		// json으로 넘어온 data를 Map으로 파싱
		Map parsedData = gson.fromJson(data, Map.class);

		// 파싱된 데이터를 문자열로 변환
		String projectId = parsedData.get("projectId").toString();
		String leaderId = "";
		
		ArrayList<ProjUser> projectList = proService.selectInvitedProject(member.getUserID());
		for (int i = 0; i < projectList.size(); i++) {
			if (projectList.get(i).getProjectId().equals(projectId)) {
				System.out.println(leaderId + " " +  projectList.get(i).getLeaderId());
				leaderId = projectList.get(i).getLeaderId();
				break;
			}
		}

		// ProjUser 객체에
		ProjUser projUser = new ProjUser();
		// 문자열로 변환된 데이터 담기
		projUser.setProjectId(projectId);
		projUser.setLeaderId(leaderId);

		request.getSession().setAttribute("selectProject", projUser);

		ProjUser pUser = new ProjUser();
		pUser.setUserId(member.getUserID()); // 세션에 있는 유저의 아이디를 유저객체에 저장
		pUser.setProjectId(projectId); // 선택한 프로젝트의 프로젝트 아이디를 유저객체에 저장

		ProjUser user = leaderService.chkAuthority(pUser); // 유저의 권한을 포함한 유저정보를 얻는 코드
		request.getSession().setAttribute("projUserInfo", user); // 얻은 유저정보를 세션에 저장

		Map<String, Object> commandMap = new MemberService().selectAlarm(member.getUserID(), projectId);
		List<Object> alarmList = (List<Object>) commandMap.get("alarmList");
		request.getSession().setAttribute("alarmList", alarmList);
		
		if (projectId != null && leaderId != null) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("fail");
		}
	}

	// 모달창을 클릭했을 때 유저 테이블에 있는 모든 유저를 불러오는 메소드 (=> 팀원 추가)
	public void fetchMemberList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Gson gson = new Gson();
		ArrayList<Member> memberList = proService.addMember();
		String mList = gson.toJson(memberList);
		response.getWriter().print(mList);

	}
}