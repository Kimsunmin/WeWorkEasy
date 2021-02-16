package com.wwe.views.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.wwe.leader.model.service.LeaderService;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.vo.Member;
import com.wwe.task.model.service.TaskService;
import com.wwe.task.model.vo.Task;
import com.wwe.views.model.vo.GraphDataSetVo;
import com.wwe.views.model.vo.UserByTaskVo;

/**
 * 
 * @author 김선민
 *
 */
@WebServlet("/views/*")
public class ViewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LeaderService leaderService = new LeaderService();
	TaskService taskService = new TaskService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		switch (uriArr[uriArr.length-1]) {
		case "calendar":
			calendar(request,response);
			break;
		case "graph":
			viewgraph(request,response);
			break;
		case "calendarimpl":
			viewcalendar(request,response);
			break;
		case "graphimpl":
			graphimpl(request,response);
			break;
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
	
	private void calendar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		List<ProjUser> userList = getProjectId(request, response);
		
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/WEB-INF/view/calendar/calendar.jsp").forward(request, response);
	}
	
	private void viewgraph(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProjUser> userList = getProjectId(request, response);
				
		request.setAttribute("userList", userList);
		request.getRequestDispatcher("/WEB-INF/view/calendar/graph.jsp").forward(request, response);
	}
	
	private void viewcalendar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<UserByTaskVo> taskList = new ArrayList<>(); //calendar.js 에 넣을 event리스트
		Gson gson = new Gson();
		String[] colorList = {"#F9D9CA","#D18063","#F0E4D4","#917B56","yellow","green","red","blue"};
		int colorIdx = 0;
		
		String filterData = request.getParameter("data");
		Map filterMap = gson.fromJson(filterData, Map.class);
		List<String> filterList = (List<String>) filterMap.get("name");
		
		List<ProjUser> userList = getProjectId(request, response);		
		
		// 해당 프로젝트의 구성원들의 각 업무리스트 가져오기
		for (ProjUser users : userList) { // 각 인원별
			
			if(!filterList.contains(users.getUserId())){
				
				for (Task task : taskService.selectMyList(users.getUserId(),users.getProjectId())) { // 업무리스트 순환
					if(!task.getTaskState().equals("ST03")) {
						System.out.println(task.getDeadLine());
						taskList.add(new UserByTaskVo(task.getTaskId()
								,task.getStartDate()
								,task.getDeadLine()
								,colorList[colorIdx]
								)); // 파싱파싱
					}
				}
			}
			colorIdx++;
		}
		
		String data = gson.toJson(taskList);
		
		response.setContentType("application/json");
		response.getWriter().print(data);
	}
	
	private void graphimpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Gson gson = new Gson();
		GraphDataSetVo dataSet = new GraphDataSetVo();
		
		String filterData = request.getParameter("data");
		Map filterMap = gson.fromJson(filterData, Map.class);
		List<String> filterList = (List<String>) filterMap.get("name");
		List<ProjUser> userList = getProjectId(request, response);
		
		for (ProjUser users : userList) { // 각 인원별
			double doingNum = 0;
			double doneNum = 0;
			double result = 0;
				for (Task task : taskService.selectMyList(users.getUserId(),users.getProjectId())) { // 업무리스트 순환
					if(task.getTaskState().equals("ST02")) {
						doneNum++;
						doingNum++;
					}else if(!task.getTaskState().equals("ST03")) {
						doingNum++;
					}
					System.out.println(doneNum + " : " + doingNum + " : " + result + " : " + task.getUserId());
					result = doneNum == 0 ? 0 : doneNum/doingNum;
				}
				dataSet.SetDataSet(result, "rgba(255, 99, 132, 0.2)", "purple");
		}
		
		String data = gson.toJson(dataSet);
		response.setContentType("application/json");
		response.getWriter().print(data);
	}
	
	// 프로젝트 아이디를 받아와 해당프로젝트의 구성원 리스트를 반환
	private List<ProjUser> getProjectId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 해당 프로젝트의 이름을 받아온다...
		HttpSession session = request.getSession();
		ProjUser project = (ProjUser) session.getAttribute("selectProject");
		String pId = project.getProjectId(); // 향후 세션값으로 교체 
						
		//해당 프로젝트의 구성원 정보를 받기
		List<ProjUser> userList = leaderService.selectUserListByPid(pId);
		return userList;
	}
	

}
