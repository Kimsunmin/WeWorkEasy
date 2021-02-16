package com.wwe.task.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wwe.common.code.AddAlarmCode;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.service.MemberService;
import com.wwe.member.model.vo.Member;
import com.wwe.project.model.vo.Project;
import com.wwe.task.feedback.Feedback;
import com.wwe.task.model.service.TaskService;
import com.wwe.task.model.vo.Task;

/**
 * Servlet implementation class TaskController
 */
@WebServlet("/task/*")
public class TaskController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaskService taskService = new TaskService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
			case "main": mainTask(request,response);
				break;
			case "member": memberTask(request,response);
				break;
			case "detail": detailTask(request,response);
				break;
			case "addimpl": addImpl(request,response);
				break;
			case "my": myTask(request,response);
				break;
			case "myimpl": selectMyList(request,response);
				break;
			case "insertfeedback": insertFeedback(request,response);
				break;
			case "updatestate": updateState(request,response);
				break;
			case "updatetask": updateTask(request,response);
				break;
			case "updatefeedback" : updateFeedback(request,response);
			default:
				break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//메인페이지 이동
	protected void mainTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		selectAllTaskList(request,response);
		selectName(request,response);
			
		selectTaskbyMem(request,response);
		
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		//Member user = (Member) request.getSession().getAttribute("user");
		//String userId = user.getUserID();
		
		String taskState = "ST04";
		String taskPriority = "PR01";
		
		int res = taskService.updateTaskState(projectId,taskState);
		int result = taskService.updatePriority(taskPriority, projectId);
		
		if(res > 0 && result > 0 ) {
			System.out.println("상태수정완료");
		}else {
			System.out.println("수정실패");
		}
		

		request.getRequestDispatcher("/WEB-INF/view/task/main.jsp").forward(request, response);
	
	}
	
	//권한,이름불러오기
	protected void selectName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		
		ArrayList<ProjUser> memberList = taskService.selectName(projectId);

		if(memberList != null) {
			
			System.out.println("업무리스트 성공");
				  
			request.setAttribute("memberList", memberList);
			
		} else {
			System.out.println("업무리스트 불러오기실패");
		}
		
	}
	
	//업무리스트불러오기
	protected void selectAllTaskList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		
		
		ArrayList<Task> taskList = taskService.selectAllTaskList(projectId);
		

		if(taskList.size() > 0) {
			
			System.out.println("업무리스트 성공");
				  
			request.setAttribute("taskList", taskList);
			
		} else {
			System.out.println("업무리스트 불러오기실패");
		}
		
	}

	//멤버 별 리스트 
	protected void memberTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//멤버 별 업무리스트
		//memberList로 맞춰서 업무리스트 가져오기
		selectAllTaskList(request,response);
		
		String name = request.getParameter("name");
		request.setAttribute("name", name);
		ArrayList<Task> memTaskList = new ArrayList<>();
		ArrayList<Task> TaskList = (ArrayList<Task>) request.getAttribute("taskList");
		
		for (Task task : TaskList) {
			if(task.getUserId() == name) {

			}
		}

		request.setAttribute("memTaskList", memTaskList);
		request.getRequestDispatcher("/WEB-INF/view/task/member.jsp").forward(request, response);
	}
	
	//멤버 별 리스트 뽑아오기
	protected void selectTaskbyMem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//멤버 별 업무리스트
		//memberList로 맞춰서 업무리스트 가져오기
		//프로젝트 세션에서 불러오기
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		String leaderId = project.getLeaderId();
		
		//session에서 leaderId userId 받아오기
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		
		
		ArrayList<Task> taskByMember = taskService.selectTaskbyMem(projectId,leaderId,userId);

		
		if(taskByMember != null) {
			
			System.out.println("멤버 별 리스트 성공");
			
			request.setAttribute("taskByMember", taskByMember);
			
		}else {
			System.out.println("멤버 별 리스트 실패");
		}
	}
	
	
	
	//업무상세내역
	protected void detailTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String taskId = request.getParameter("name") ; 
		int tIdx = 0;
		
		ArrayList<Task> detailList = taskService.detailTask(taskId);
		
		for (Task task : detailList) {
			tIdx = task.gettIdx();
		}
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0 ; i < detailList.size();i ++) {
			String deadLine = detailList.get(i).getDeadLine();
			try {
				Date d = sdf.parse(deadLine);
				deadLine = sdf.format(d);
				detailList.get(i).setDeadLine(deadLine);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		ArrayList<Feedback> feedList = taskService.selectFeedback(tIdx);
		
		if(detailList != null) {
			request.setAttribute("detailList", detailList);
			request.setAttribute("feedList", feedList);
			selectName(request,response);
			
			request.getRequestDispatcher("/WEB-INF/view/task/detail.jsp").forward(request, response);
		}else {
			System.out.println("상세정보 불러오기 실패");
			
			request.getRequestDispatcher("/WEB-INF/view/task/my.jsp").forward(request, response);
		}
		
	}
	
	//업무추가 페이지 이동
	/*
	 * protected void addTask(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * request.getRequestDispatcher("/WEB-INF/view/task/add.jsp").forward(request,
	 * response); }
	 */
	//업무 추가 실행
	protected void addImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String data = request.getParameter("data");
		  Gson gson = new Gson();
		
		  Map parsedData = gson.fromJson(data, Map.class);
		  
		  String taskName = parsedData.get("taskId").toString();
		  String deadLine = parsedData.get("deadLine").toString(); 
		  String taskContent = parsedData.get("taskContent").toString();
		  Member user = (Member)request.getSession().getAttribute("user");
		  
		  ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		  String projectId = project.getProjectId();
		  String userId = user.getUserID();
		  
		  if(taskName == null || taskContent == null || deadLine == null) {
			  request.setAttribute("alertMsg", "내용을 모두 입력해주세요.");
			  request.setAttribute("url", "/task/my");
		  }
		  
		  Task task = new Task(); 
		  task.setTaskId(taskName); 
		  task.setDeadLine(deadLine);
		  task.setTaskContent(taskContent); 
		  task.setUserId(userId);
		  task.setProjectId(projectId);
		  
		  
		  int res = taskService.insertTask(task);
		  
		  if(res > 0) { 
			  response.getWriter().print("success");
			  
			  new MemberService().addAlarm(userId, projectId, AddAlarmCode.IT01.alarmCode());
			  new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", user.getUserName() + " 님이 업무를 추가했습니다.");
			  
			  request.getRequestDispatcher("/WEB-INF/view/common/result.jsp").forward(request, response);
			  
		  } else { 
			  System.out.println("업무추가실패");
			  
			  request.setAttribute("alertMsg", "업무 추가에 실패하였습니다.");
			  request.setAttribute("url", "/task/my");
			  
			  request.getRequestDispatcher("/WEB-INF/view/common/result.jsp").forward(request, response);
		  }
		 
	}
	
	//내 업무리스트 페이지 이동
	protected void myTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		selectMyList(request,response);
		
		request.getAttribute("myList");
		selectName(request,response);

		request.getRequestDispatcher("/WEB-INF/view/task/my.jsp").forward(request, response);
	}
	
	//내 업무리스트 불러오기
	protected void selectMyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//세션으로 아이디값 받아와서 하기
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		
		ArrayList<Task> myList = taskService.selectMyList(userId,projectId);
		
		if(myList != null) {
			System.out.println("내 업무리스트 불러오기 성공");
			request.setAttribute("myList", myList);
			
		}else {
			System.out.println("내 업무리스트 불러오기 실패");
			
			request.setAttribute("alertMsg", "내 업무리스트를 불러오지 못했습니다.");
			request.setAttribute("url", "/task/main");
			  
			request.getRequestDispatcher("/WEB-INF/view/common/result.jsp").forward(request, response);
		}
		
	}
	
	//피드백 추가
	protected void insertFeedback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//id세션에서 받아오기
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		
		Feedback feedback = new Feedback();
		
		
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		String feedbackComment = (String) parsedData.get("feedbackComment");
		String taskId = (String) parsedData.get("taskId");
		String fTidx = (String) parsedData.get("tIdx");
		
		int tIdx = Integer.parseInt(fTidx);
		
		int isDel = 0;
		
		feedback.setFeedbackComment(feedbackComment);
		feedback.setTaskId(taskId);
		feedback.setIsDel(isDel);
		feedback.setUserId(userId);
		feedback.settIdx(tIdx);
		
		int res = taskService.insertFeedback(feedback);
	
		if(res > 0) { 
			String feed = gson.toJson(feedback);	
			response.setContentType("application/json");
			response.getWriter().print(feed);
			
		 } else { 
			 response.getWriter().print("failed");
			  
		 }
	}
	
	//업무상태값변경하기
	public void updateState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		
		String taskState = (String) parsedData.get("state");
		String taskId = (String) parsedData.get("taskId");
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		
		int res = taskService.updateState(taskState,taskId,userId);
	
		
		if(res > 0) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("failed");
		}
		
	}
	
	
	//업무 수정 메서드
	public void updateTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		ProjUser project = (ProjUser) request.getSession().getAttribute("selectProject");
		String projectId = project.getProjectId();
		String data = request.getParameter("data");
		Gson gson = new Gson();
		
		Map parsedData = gson.fromJson(data, Map.class);
		
		String taskUser = parsedData.get("modTaskUser").toString();
		String taskId = parsedData.get("taskId").toString();
		String deadLine = parsedData.get("deadLine").toString();
		String modifiedContent = parsedData.get("modifiedContent").toString();
		String bTaskId = parsedData.get("btaskId").toString();

		
		Task task = new Task();
		task.setUserId(taskUser);
		task.setTaskId(taskId);
		task.setDeadLine(deadLine);
		task.setTaskContent(modifiedContent);

		
		int res = taskService.updateTask(task,bTaskId);
		
		if(res>0) {
			
			new MemberService().addAlarm(userId, projectId, AddAlarmCode.UT01.alarmCode());
			new MemberService().kakaoSendMessage("rkZVd00R_wEE82fu2ustpOknZNHZXVv0IpSx0AopdSkAAAF3i7FSxA", user.getUserName() + " 님이 업무를 수정했습니다.");
			response.getWriter().print("success");
		}else {
			response.getWriter().print("failed");
		}
	}
	
	public void updateFeedback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		

		int isDel = Integer.parseInt((String) parsedData.get("isDel"));
		int tIdx = Integer.parseInt((String)parsedData.get("tIdx"));
		
		String feedbackComment = (String) parsedData.get("feedbackComment");
		Member user = (Member) request.getSession().getAttribute("user");
		String userId = user.getUserID();
		
		int res = taskService.updateFeedback(isDel, tIdx, userId, feedbackComment);
	
		
		if(res > 0) {
			response.getWriter().print("success");
		}else {
			response.getWriter().print("failed");
		}
	}
}
