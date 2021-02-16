package com.wwe.leader.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wwe.common.code.AddAlarmCode;
import com.wwe.leader.model.service.LeaderService;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.service.MemberService;
import com.wwe.member.model.vo.Member;
import com.wwe.project.model.vo.ProjectMaster;
import com.wwe.task.model.service.TaskService;
import com.wwe.task.model.vo.Task;

@WebServlet("/leader/*")
public class LeaderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private LeaderService leaderService = new LeaderService();
	private TaskService taskService = new TaskService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "manage":
			manage(request, response); // 팀관리 메뉴를 클릭했을 시
			break;
		case "totaltask":
			totalTask(request, response); // 업무관리 메뉴를 클릭했을 시
			break;
		case "chkuser":
			chkInvalidUser(request, response); // 초대팝업에서 초대 버튼 클릭했을 시
			break;
		case "inviteimpl":
			inviteImpl(request, response); // 팀원 초대 기능을 수행
			break;
		case "gettaskimpl":
			selectTaskList(request, response); // 프로젝트의 업무 리스트를 불러오는 기능을 수행
			break;
		case "updateauthority":
			updateAuthority(request, response); // 팀원의 궈한을 수정
			break;
		case "searchbytask":
			searchTaskByTask(request, response); // 업무명으로 업무목록을 검색
			break;
		case "searchbyid":
			searchTaskById(request, response); // 유저명으로 업무목록을 검색
			break;
		case "modifytask":
			modifyTaskByIdx(request, response); // 업무내용을 수정
			break;
		case "deletetask":
			deleteTask(request, response); // 업무 삭제
			break;
		case "deletemember":
			deleteMember(request, response);
			break;
		case "alloctask" :
			allocTask(request,response);
			break;
		case "deleteproject" :
			deleteProject(request,response);
			break;
		default:
			break;
		}
	}

	// post요청이 들어왔을 시 doGet으로 넘겨준다,
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// 팀관리 페이지로 이동
	private void manage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();

		ProjUser projUser=  (ProjUser)session.getAttribute("selectProject");
		ProjUser projUserInfo = (ProjUser)session.getAttribute("projUserInfo");
		
		ArrayList<ProjUser> userList = leaderService.selectUserListByPid(projUser.getProjectId());
		System.out.println("유저 리스트 : "+userList);
		request.setAttribute("userList", userList); // 페이지에 DB에서 읽어온 유저 리스트를 전송
		request.getRequestDispatcher("/WEB-INF/view/leader/leader_page.jsp").forward(request, response);
		

	}

	// 업무관리 페이지로 이동
	private void totalTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String projectId = project.getProjectId();
	    
		
		ArrayList<Task> taskList = leaderService.selectTaskList(projectId);
		if (taskList.size() > 0) {
			System.out.println("업무리스트 불러오기 성공");
			request.setAttribute("taskList", taskList);
			request.setAttribute("taskCount", taskList.size());
			request.getRequestDispatcher("/WEB-INF/view/leader/total_task.jsp").forward(request, response);
		} else {
			request.setAttribute("alertMsg", "해당 프로젝트에 업무가 없습니다.");
			request.setAttribute("url", "/task/main");
			request.getRequestDispatcher("/WEB-INF/view/common/result.jsp").forward(request, response);
		}
		
	}
	

	// 팀원을 초대하기 위해 입력한 아이디가 유효한지 확인
	private void chkInvalidUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		System.out.println(userId);
		String mUserId = leaderService.chkInvalidUser(userId);
		if (!mUserId.equals(" ")) {
			response.getWriter().print("success");
		} else {
			response.getWriter().print("failed");
		}
	}

	// 팀에 유저를 초대하는 작업을 처리
	private void inviteImpl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();

		Map parsedData = gson.fromJson(data, Map.class);

		String userId = parsedData.get("userId").toString();
		String authority = parsedData.get("authority").toString();
		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String projectId = project.getProjectId();
		
		Member member = (Member) session.getAttribute("user");
		
		int res = leaderService.inviteUser(userId, authority,projectId);
		if (res == 1) {
			new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.IU02.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 "+userId+"를 초대했습니다.");
			response.getWriter().print("success");
		} else {
			response.getWriter().print("failed");
		}
	}

	// 프로젝트의 유저당 업무 리스트를 가져오는 메소드
	private void selectTaskList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String projectId = request.getParameter("projectId");
		System.out.println(projectId);
		ArrayList<Task> taskList = leaderService.selectTaskList(projectId);
		if (taskList.size() > 0) {
			System.out.println("업무리스트 불러오기 성공");
			request.setAttribute("taskList", taskList);
			request.setAttribute("taskCount", taskList.size());
			request.getRequestDispatcher("/WEB-INF/view/leader/total_task.jsp").forward(request, response);
		} else {
			request.setAttribute("alertMsg", "해당 프로젝트에 업무가 없습니다.");
			request.setAttribute("url", "/task/main");
			request.getRequestDispatcher("/WEB-INF/view/common/result.jsp").forward(request, response);
		}

	}

	// 유저의 권한을 변경하는 메소드
	private void updateAuthority(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);

		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		Member member = (Member) session.getAttribute("user");
		String projectId = project.getProjectId();
		String userId = parsedData.get("userId").toString();
		String authority = parsedData.get("authority").toString();
		Member curUser = (Member)request.getSession().getAttribute("user");

		
		ProjUser projUser = new ProjUser();
		projUser.setProjectId(projectId);
		projUser.setUserId(userId);
		projUser.setAuthority(authority);

		
		System.out.println("바꿀 플젝 아이디 : "+projUser.getProjectId());
		System.out.println("바꿀 리더아이디  : "+projUser.getUserId());
		int res = leaderService.updateAuthority(projUser);
		if (res > 0) {
			if (authority.equals("팀장")) {
				leaderService.changeProLeader(projUser); //TB_PROJECT의 LEADER_ID를 수정하는 코드
				projUser.setUserId(curUser.getUserID());
				projUser.setAuthority("읽기/쓰기");
				res = leaderService.changeLeader(projUser); //기존에 팀장이었던 사람의 정보를 넘겨야함.
				
				if (res > 0) {
					new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.UL01.alarmCode());
					response.getWriter().print("authChange");
				} else {
					response.getWriter().print("authChangeFailed");
				}
			}else {
				new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.UU01.alarmCode());
				response.getWriter().print("success");
			}
		} else {
			response.getWriter().print("failed");
		}

	}

	private void searchTaskByTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();

		Map parsedData = gson.fromJson(data, Map.class);

		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String projectId = project.getProjectId();
		String word = parsedData.get("word").toString();

		Task task = new Task();
		task.setProjectId(projectId);
		task.setTaskId(word);

		ArrayList<Task> searchTaskList = leaderService.selectTaskByTask(task);

		if (searchTaskList.size() > 0) {
			String jArray = gson.toJson(searchTaskList);
			response.getWriter().print(jArray);
		} else {
			response.getWriter().print("failed");
		}
	}

	private void searchTaskById(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();

		Map parsedData = gson.fromJson(data, Map.class);
		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String projectId = project.getProjectId();
		String word = parsedData.get("word").toString();

		Task task = new Task();
		task.setProjectId(projectId);
		task.setUserId(word);

		ArrayList<Task> searchTaskList = leaderService.selectTaskById(task);

		if (searchTaskList.size() > 0) {
			String jArray = gson.toJson(searchTaskList);
			response.getWriter().print(jArray);
		} else {
			response.getWriter().print("failed");
		}
	}

	// 업무를 수정하는 메소드
	public void modifyTaskByIdx(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();

		Map parsedData = gson.fromJson(data, Map.class);

		String taskUser = parsedData.get("modTaskUser").toString();
		String taskId = parsedData.get("taskId").toString();
		String deadLine = parsedData.get("deadLine").toString();
		String modifiedContent = parsedData.get("modifiedContent").toString();
		int tIdx = Integer.parseInt(parsedData.get("tIdx").toString());
		Task task = new Task();
		task.setUserId(taskUser);
		task.setTaskId(taskId);
		task.setDeadLine(deadLine);
		task.setTaskContent(modifiedContent);
		task.settIdx(tIdx);

		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		Member member = (Member) session.getAttribute("user");
		
		int res = leaderService.updateTask(task);

		if (res > 0) {
			new MemberService().addAlarm(member.getUserID(), project.getProjectId(), AddAlarmCode.UT01.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 업무를 수정했습니다.");
			response.getWriter().print("success");
		} else {
			response.getWriter().print("failed");
		}

	}

	public void deleteTask(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String data = request.getParameter("data");

		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);

		ArrayList<Integer> tIdx = (ArrayList<Integer>) parsedData.get("tIdx");
		int res = leaderService.deleteTask(tIdx);
		
		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		Member member = (Member) session.getAttribute("user");
		

		if (res > 0) {
			new MemberService().addAlarm(member.getUserID(), project.getProjectId(), AddAlarmCode.DT01.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 업무를 삭제했습니다.");
			response.getWriter().print("success");
		} else {
			response.getWriter().print("failed");
		}
	}

	public void deleteMember(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String data = request.getParameter("data");
		Gson gson = new Gson();

		Map parsedData = gson.fromJson(data, Map.class);

		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String projectId = project.getProjectId();
		String deleteMember = parsedData.get("deleteMember").toString();

		ProjUser user = new ProjUser();
		user.setProjectId(projectId);
		user.setUserId(deleteMember);

		Member member = (Member) session.getAttribute("user");
		
		int res = leaderService.deleteMember(user);

		if (res > 0) {
			
			res = leaderService.deleteMemberTask(user);
			if(res > 0) {
				res = leaderService.deleteProjectMaster(user);
				if(res > 0) {
					new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.DM01.alarmCode());
					new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 "+user.getUserId()+"님을 팀에서 내보냈습니다.");
					response.getWriter().print("success");
				}else {
					response.getWriter().print("failed");
				}
			}
		}
	}
	
	public void allocTask(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String data = request.getParameter("data");
		Gson gson = new Gson();
		
		HttpSession session = request.getSession();
	    ProjUser project = (ProjUser) session.getAttribute("selectProject");
	    String projectId = project.getProjectId();
	    
		Map parsedData = gson.fromJson(data, Map.class);
		String userId = parsedData.get("userId").toString();
		String taskId = parsedData.get("taskId").toString();
		String deadLine = parsedData.get("deadLine").toString();
		String content = parsedData.get("content").toString();
		
		Task task = new Task();
		task.setProjectId(projectId);
		task.setUserId(userId);
		task.setTaskId(taskId);
		task.setDeadLine(deadLine);
		task.setTaskContent(content);
		
		Member member = (Member) session.getAttribute("user");
		
		int res = taskService.insertTask(task);
		if(res>0) {
			new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.IT01.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 "+task.getUserId()+"님에게 업무를 할당했습니다.");
			response.getWriter().print("success");
		}else {
			response.getWriter().print("failed");
		}
	
	}
	
	public void deleteProject(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String projectId = request.getParameter("projectId");
		
		System.out.println(projectId);
		int res = leaderService.deleteProject(projectId);
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		if(res>0) {
			new MemberService().addAlarm(member.getUserID(), projectId, AddAlarmCode.DP01.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", member.getUserName() + " 님이 프로젝트 "+projectId+"를 삭제했습니다.");
			response.getWriter().print("success");
		}else {
			response.getWriter().print("failed");
		}
		
	}

}
