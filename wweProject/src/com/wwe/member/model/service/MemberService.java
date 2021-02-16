package com.wwe.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.member.model.dao.MemberDao;
import com.wwe.member.model.vo.Alarm;
import com.wwe.member.model.vo.Member;

public class MemberService {

	public MemberService() {}

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	MemberDao memberDao = new MemberDao();

	//로그인을 위한 메소드
	public Member memberAuthenticate(String userID, String userPW) {

		Connection conn = jdt.getConnection();
		Member res = null;

		try {
			res = memberDao.memberAuthenticate(conn, userID, userPW);
		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}


		return res;
	}

	//이메일 인증 메소드
	public Member memberAuthenticateWithEmail(String userEmail) {

		Connection conn = jdt.getConnection();
		Member res = null;

		try {
			res = memberDao.memberAuthenticateWithEmail(conn, userEmail);
		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return res;
	}

	//이메일 전송 메소드
	public void mailSender(String user, String title, String content) {

		Connection conn = jdt.getConnection();

		MemberDao memberDao = new MemberDao();
		try {
			memberDao.mailSender(conn, user, title, content);
			jdt.commit(conn);
		}finally {
			jdt.close(conn);
		}
	}

	//userId가 참여중인 프로젝트를 받기 위한 메소드
	public Member getMemberProject(String userID) {

		Connection conn = jdt.getConnection();
		Member res = null;

		try{
			res = memberDao.getMemberProject(conn, userID);
		}catch (Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return res;
	}

	//회원가입을 위한 메소드
	public int insertMember(Member member) {

		Connection conn = jdt.getConnection();
		int res = 0;

		try {
			res = memberDao.insertMember(conn,member);
			jdt.commit(conn);

		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}
		finally {
			jdt.close(conn);
		}

		return res;



	}

	//ID찾기 메소드
	public Member findMemberID(String userEmail) {

		Connection conn = jdt.getConnection();
		Member res = null;

		try {
			res = memberDao.findMemberID(conn, userEmail);
		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return res;
	}

	//PW찾기 메소드
	public Member findMemberPW(String userID, String userEmail) {

		Connection conn = jdt.getConnection();
		Member res = null;

		try {
			res = memberDao.findMemberPW(conn, userID, userEmail);
		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return res;
	}


	//회원정보 수정 메소드
	public int modifyMember(Member member) {

		Connection conn = jdt.getConnection();
		int res = 0;

		try {

			res = memberDao.modifyMember(conn,member);
			jdt.commit(conn);

		}catch(Exception e) {
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return res;

	}	

	//유저별 출력되는 알럼 history를 위한 메소드
	public Map<String, Object> selectAlarm(String userID, String projectID){
		Map<String, Object> commandMap = new HashMap<String, Object>();
		List<Alarm> alarmList = null;
		Connection conn = jdt.getConnection();

		try {
			alarmList = memberDao.selectAlarm(conn, userID, projectID);
			commandMap.put("alarmList", alarmList);

		}catch(Exception e) {
			System.out.println("Service Error");
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

		return commandMap;

	}

	//업무추가, 팀장업무, 파일클라우드를 위한 tb_user_issue 등록 메소드
	public void addAlarm(String userID, String projectID, String type_alarm){
		int res = 0;
		Connection conn = jdt.getConnection();

		try {
			//*********************************받아온 프로젝트로 수정 요망******************************************
			res = memberDao.addAlarm(conn, userID, projectID, type_alarm);
			//res = memberDao.addAlarm(conn, userID, "프로젝트 1", type_alarm);

			if(res == 0) {
				System.out.println("등록오류");
			}else {
				jdt.commit(conn);
				System.out.println("등록완료");
			}

		}catch(Exception e) {
			System.out.println("Service Error");
			e.printStackTrace();
			jdt.rollback(conn);
		}finally {
			jdt.close(conn);
		}

	}

	//카카오 로그인 토큰 획득 메소드
	public String getAccessToken(String authorize_code) {

		String access_Token = memberDao.getAccessToken(authorize_code);
		return access_Token;
	}
	
	public void kakaoFriendList(String access_Token) {
		memberDao.kakaoFriendList(access_Token);
	}


	//카카오로그인을 위한 메소드
	public Member kakaoUserInfo(String access_Token){

		Member userInfo = memberDao.kakaoUserInfo(access_Token);

		return userInfo;
	}
	

	//카카오메시지를 전송하기 위한 메소드
	public void kakaoSendMessage(String access_Token, String content) {
		memberDao.kakaoSendMessage(access_Token, content);
	}

	//카카오 토큰삭제 메소드
	public void kakaoLogout(String access_Token) {
		memberDao.kakaoLogout(access_Token);
	}





}
