package com.wwe.leader.model.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.exception.ToAlertException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.leader.model.dao.LeaderDao;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.task.model.vo.Task;

public class LeaderService {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	LeaderDao leaderDao = new LeaderDao();
	
	// 유저에게 권한을 추가하는 메소드
	public int inviteUser(String userId, String authorty, String projectId) {
		
		int res = 0;
		Connection conn  = jdt.getConnection();
		
		try {
			res = leaderDao.inviteUser(conn, userId,authorty,projectId);
			jdt.commit(conn);
		}catch (DataAccessException  e) {
			//커스텀 예외처리를  해주어야 할 부분
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	//팀원 초대 시 입력한 아이디가 유효한 아이디인지 체크하는 메소드
	public String chkInvalidUser(String userId) {
		Connection conn = jdt.getConnection();
		String mUserId= " ";
		try {
			mUserId = leaderDao.chkInvalidUser(conn, userId);
		}finally {
			jdt.close(conn);
		}
		return mUserId;
		
	}
	
	//프로젝트에서 각 팀원이 맡은 업무 리스트를 가져오는 메소드
	public ArrayList<Task> selectTaskList(String projectId) {
		Connection conn = jdt.getConnection();
		ArrayList<Task> taskList = null;
		try {
		 taskList = leaderDao.selectTaskList(conn, projectId);
		}finally {
			jdt.close(conn);
		}
		return taskList;
	}
	
	//프로젝트의 팀원 정보를 가져오는 메소드
	public ArrayList<ProjUser> selectUserListByPid(String projectId){
		Connection conn = jdt.getConnection();
		ArrayList<ProjUser> userList = null;
		try {
			userList = leaderDao.selectUserListByPid(conn, projectId);
		}finally {
			jdt.close(conn);
		}
		return userList;
	}
	
	//프로젝트에 속한 팀원의 권한을 변경하는 메소드
	public int updateAuthority(ProjUser projUser) {
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = leaderDao.updateAuthority(conn, projUser);
			System.out.println("service : "+res);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		
		return res;
	}
	
	//팀장 권한을 넘겨주는 메소드
	public int changeLeader(ProjUser user) {
		int res = 0;
		Connection conn = jdt.getConnection();
		try {
			res = leaderDao.changeLeader(conn, user);
			jdt.commit(conn);
		}catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		return res;
	}
		
	//TB_PROJECT의 프로젝트의 팀장을 변경하는 메소드
	public int changeProLeader(ProjUser user) {
		int res = 0;
		Connection conn = jdt.getConnection();
		try {
			res = leaderDao.changeProLeader(conn, user);
			jdt.commit(conn);
		}catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
			// TODO: handle exception
		}
		return res;
	}
	
	//업무명으로 업무 검색하는 메소드
	public ArrayList<Task> selectTaskByTask(Task task){
		Connection conn = jdt.getConnection();
		ArrayList<Task> taskList = new ArrayList<>();
		try {
			taskList = leaderDao.selectTaskByTask(conn, task);
		}finally {
			jdt.close(conn);
		}
		
		return taskList;
	}
	
	//유저아이디로 업무를 검색하는 메소드
	public ArrayList<Task> selectTaskById(Task task){
		Connection conn = jdt.getConnection();
		ArrayList<Task> taskList = new ArrayList<>();
		try {
			taskList = leaderDao.selectTaskById(conn, task);
		}finally {
			jdt.close(conn);
		}
		return taskList;
	}
	
	//업무를 수정하는 메소드
	public int updateTask(Task task) {
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = leaderDao.updateTask(conn, task);
			jdt.commit(conn);
		}catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		return res;
	}
	
	//선택한 업무를 삭제하는 메소드
	public int deleteTask(ArrayList<Integer> tIdx) {
		Connection conn = jdt.getConnection();
		int res =0;
		try {
			res = leaderDao.deleteTask(conn, tIdx);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		return res;
	}
	
	//프로젝트에서 팀원을 삭제하는 메소드
	public int deleteMember(ProjUser user) {
		int res =0;
		Connection conn = jdt.getConnection();	
		
		try {
			res = leaderDao.deleteMember(conn, user);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		return res;
	}
	
	//프로젝트에서 팀원을 삭제한뒤 업무테이블에서 그 팀원의 업무를 삭제하는 메소드
		public int deleteMemberTask(ProjUser user) {
			int res =0;
			Connection conn = jdt.getConnection();	
			
			try {
				res = leaderDao.deleteMemberTask(conn, user);
				jdt.commit(conn);
			}catch(DataAccessException e) {
				jdt.rollback(conn);
				throw new ToAlertException(e.error);
			}finally {
				jdt.close(conn);
			}
			return res;
		}
	
	public int deleteProjectMaster(ProjUser user) {
		int res = 0;
		Connection conn = jdt.getConnection();
		
		try {
			res = leaderDao.deleteProjectMaster(conn, user);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		return res;
	}
		
	//유저의 권한을 체크하는 메소드
	public ProjUser chkAuthority(ProjUser user) {
		
		Connection conn = jdt.getConnection();
		ProjUser pUser = null;
		try {
			
			pUser = leaderDao.chkAuthority(conn, user);
		}finally {
			jdt.close(conn);
		}
		
		return pUser;
	}
	
	
	public int deleteProject(String projectId) {
		Connection conn = jdt.getConnection();
		int res = 0;
		
		try {
			res = leaderDao.deleteProject(conn, projectId);
			jdt.commit(conn);
		}catch(DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		}finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	
	
	
	
	
	
	
}
