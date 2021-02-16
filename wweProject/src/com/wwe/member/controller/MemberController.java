package com.wwe.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.wwe.common.code.AddAlarmCode;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.mail.MailSender;
import com.wwe.member.model.service.MemberService;
import com.wwe.member.model.vo.Member;
import com.wwe.project.model.vo.Project;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String[] uriArr = uri.split("/");
		
		switch(uriArr[uriArr.length-1]) {
		
			case "signin" : signIn(request, response);
				break;
			case "signup" : signUp(request, response);
				break;
			case "signinimpl" : signInImpl(request, response);
				break;
			case "signupimpl" : signUpImpl(request, response);
				break;
				
			case "find" : find(request, response);
				break;
			case "findresult" : findResult(request, response);
				break;
			case "findidimpl" : findIDImpl(request, response);
				break;
			case "findpwimpl" : findPWImpl(request, response);
				break;
			
			case "modifyimpl" : modifyImpl(request, response);
				break;
			
			case "mailsender" : sendMail(request, response);
				break;
			case "mypage" : myPage(request, response);
				break;
			case "kakao" : kakao(request, response);
				break;
				
			case "alarm" : alarmModule(request, response);
				break;
				
			case "logout" : logout(request, response);
				break;
			default : ;	
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/SignIn.jsp")
		.forward(request, response);
	}
	
	private void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/SignUp.jsp")
		.forward(request, response);
	}
	
	private void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/view/member/FindSign.jsp")
		.forward(request, response);
	}
	
	private void findResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/FindResult.jsp")
		.forward(request, response);
	}
	
	private void myPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		request.getRequestDispatcher("/WEB-INF/view/member/MyPage.jsp")
		.forward(request, response);
	}
	
	private void signInImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);

		String userID = (String) parsedData.get("userID");
		String userPW = (String) parsedData.get("userPW");
		
		Member user = memberService.memberAuthenticate(userID, userPW);
		Member userProject = memberService.getMemberProject(userID);
		
		
		if(user != null) {
			//session scope로 user 전달
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("project", userProject);
			
			request
			.getRequestDispatcher("/WEB-INF/view/project/newProject2.jsp")
			.forward(request, response);
		}else {
			response.getWriter().print("fail");
		}
		
		
		
	}
	
	private void signUpImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		
		String userID = (String) parsedData.get("userID");
		String userPW = (String) parsedData.get("userPW");
		String userEmail = (String) parsedData.get("userEmail");
		String userName = (String) parsedData.get("userName");
		String userAdd = (String) parsedData.get("userAdd");
		String userTell = (String) parsedData.get("userTell");
		String userBirth = (String) parsedData.get("userBirth");
	
		
		
		Member member = new Member();
		member.setUserID(userID);
		member.setUserPW(userPW);
		member.setUserEmail(userEmail);
		member.setUserName(userName);
		member.setUserAdd(userAdd);
		member.setUserTell(userTell);
		member.setUserBirth(userBirth);
		
		int res = memberService.insertMember(member);
		
		if(res != 0) {	
			System.out.println("회원가입 성공");
			request
			.getRequestDispatcher("/WEB-INF/view/project/newProject2.jsp")
			.forward(request, response);
		}else {
			System.out.println("회원가입 실패");
			request
			.getRequestDispatcher("/WEB-INF/view/member/Logout.jsp")
			.forward(request, response);
		}
	}
	
	private void findTools(Member user, HttpServletRequest request) {
		if(user != null) {
			request.getSession().setAttribute("user", user);
		}
	}
	
	private void findIDImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);

		String userEmail = (String) parsedData.get("userEmail");
		
		System.out.println(userEmail);
		
		Member user = memberService.findMemberID(userEmail);
		
		findTools(user, request);
	}
	
	private void findPWImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);

		String userID = (String) parsedData.get("userID");
		String userEmail = (String) parsedData.get("userEmail");
		
		Member user = memberService.findMemberPW(userID, userEmail);
		
		findTools(user, request);
	}
	
	
	
	private void kakao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		String code = request.getParameter("code");
		System.out.println(code);
		String access_Token = memberService.getAccessToken(code);
		Member userInfo = memberService.kakaoUserInfo(access_Token);
		//memberService.kakaoFriendList(access_Token);
		
		if(userInfo.getUserEmail() != null) {
			
			userInfo = memberService.memberAuthenticateWithEmail(userInfo.getUserEmail());
			
			Member userProject = memberService.getMemberProject(userInfo.getUserID());
			
			request.getSession().setAttribute("user", userInfo);
			request.getSession().setAttribute("project", userProject);
			request.getSession().setAttribute("access_Token", access_Token);
			
		}
		
		request
		.getRequestDispatcher("/project/loadpro")
		.forward(request, response);
		
		System.out.println("token : " + access_Token);
		memberService.kakaoSendMessage(access_Token, userInfo.getUserName() + " 님이 카카오 로그인했슴둥");
		
	}
	
	private void sendMail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MailSender ms = new MailSender();
		
		String data = request.getParameter("data");
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		
		String userEmail = (String) parsedData.get("userEmail");
		String userAuthCode = (String) parsedData.get("userAuthCode");
		System.out.println(userAuthCode);
		
		ms.GmailSet(userEmail, "wwe 인증메일", "인증번호는?? 뚜둔 \n" + userAuthCode);
		System.out.println("메일 전송송");
	}
	
	private void modifyImpl(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String data = request.getParameter("data");
		System.out.println(data);
		
		Gson gson = new Gson();
		Map parsedData = gson.fromJson(data, Map.class);
		
		String userID = (String) parsedData.get("userID");
		String userPW = (String) parsedData.get("userPW");
		String userEmail = (String) parsedData.get("userEmail");
		String userName = (String) parsedData.get("userName");
		String userAdd = (String) parsedData.get("userAdd");
		String userTell = (String) parsedData.get("userTell");
		String userBirth = (String) parsedData.get("userBirth");
	
		Member member = new Member();
		member.setUserID(userID);
		member.setUserPW(userPW);
		member.setUserEmail(userEmail);
		member.setUserName(userName);
		member.setUserAdd(userAdd);
		member.setUserTell(userTell);
		member.setUserBirth(userBirth);
		
		int res = memberService.modifyMember(member);
		
		
		if(res == 1) {	
			System.out.println("회원가입 성공");
			request
			.getRequestDispatcher("/WEB-INF/view/project/newProject2.jsp")
			.forward(request, response);
		}else {
			System.out.println("회원가입 실패");
			request
			.getRequestDispatcher("/WEB-INF/view/member/Logout.jsp")
			.forward(request, response);
		}
	}
	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getAttribute("access_Token") != null) {
			memberService.kakaoLogout((String)request.getAttribute("access_Token"));
		}
		request.getSession().removeAttribute("project");
		request.getSession().removeAttribute("user");
		request.getSession().removeAttribute("selectProject");
		request.getSession().removeAttribute("projUserInfo");
		request.getSession().removeAttribute("alarmList");
		request.getSession().removeAttribute("access_Token");
		request.getRequestDispatcher("/WEB-INF/view/index/index.jsp")
		.forward(request, response);
	}
	
	// 알람기능을 위한 처리부분
	public void alarmModule(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("user");
		ProjUser projUser = (ProjUser) session.getAttribute("selectProject");
		
		Map<String, Object> commandMap = memberService.selectAlarm(member.getUserID(), projUser.getProjectId());
		List<Object> alarmList = (List<Object>) commandMap.get("alarmList");
		
		request.setAttribute("alarmList", alarmList);
		request.setAttribute("alarmListSize", alarmList.size());
	}
	
	
}
