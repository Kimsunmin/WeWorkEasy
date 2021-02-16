package com.wwe.task.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.wwe.common.exception.DataAccessException;
import com.wwe.common.exception.ToAlertException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.task.feedback.Feedback;
import com.wwe.task.model.dao.TaskDao;
import com.wwe.task.model.vo.Task;

public class TaskService {
	
	TaskDao taskDao = new TaskDao();
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	//서비스단의 업무추가
	public int insertTask(Task task) {
			
			Connection conn = jdt.getConnection();
			int res = 0;
			
			try {
				res = taskDao.insertTask(conn, task);
				jdt.commit(conn);
			} catch (DataAccessException e) {
				jdt.rollback(conn);
				throw new ToAlertException(e.error);
			} finally {
				jdt.close(conn);
			}
			
			return res;
	}
	
	//서비스단의 프로젝트별 업무리스트조회
	public ArrayList<Task> selectAllTaskList(String projectId){
		
		Connection conn = jdt.getConnection();
		ArrayList<Task> taskList = null;
		
		try {
			
			taskList = taskDao.selectAllTaskList(conn, projectId);
			
		} finally {
			jdt.close(conn);
		}
		
		return taskList;
		
	}
	
	//업무 별 상세내용 조회
	public ArrayList<Task> detailTask(String taskId){
		

		Connection conn = jdt.getConnection();
		ArrayList<Task> detailList = null;
		
		try {
			
			detailList = taskDao.detailTask(conn, taskId);
			
		} finally {
			jdt.close(conn);
		}
		
		return detailList;
	}

	//피드백 추가
	public int insertFeedback(Feedback feedback) {
		
		Connection conn = jdt.getConnection();
		int res = 0;
		
		try {
			
			res = taskDao.insertFeedback(conn, feedback);
			jdt.commit(conn);
			
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		
		return res;
	}
	
	//내 업무리스트 불러오기
	public ArrayList<Task> selectMyList(String userId,String projectId){
		
		Connection conn = jdt.getConnection();
		ArrayList<Task> myList = null;
		
		try {
			
			myList = taskDao.selectMyList(conn, userId, projectId);
			
		} finally {
			jdt.close(conn);
		}
		
		return myList;
	}
	
	//프로젝트 별 이름 불러오기
	public ArrayList<ProjUser> selectName(String projectId){
		
		Connection conn = jdt.getConnection();
		ArrayList<ProjUser> memberList = null;
		
		try {
			
			memberList = taskDao.selectName(conn, projectId);
			
		} finally {
			jdt.close(conn);
		}
		
		return memberList;
		
	}
	
	public ArrayList<Task> selectTaskbyMem(String projectId,String userId, String leaderId){

		Connection conn = jdt.getConnection();
		ArrayList<Task> taskByMember = null;
		
		try {
			
			taskByMember = taskDao.selectTaskbyMem(conn, projectId, userId, leaderId);
			
		} finally {
			jdt.close(conn);
		}
		
		return taskByMember;
	}

	public int updateTaskState(String projectId, String taskState) {
		
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = taskDao.updateTaskState(conn, projectId, taskState);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		return res;	
	}
	
	//업무상태 변경해주는 메서드
	public int updateState(String taskState, String taskId, String userId) {
		
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = taskDao.updateState(conn, taskState, taskId, userId);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		return res;	
	}
	
	//업무상태 변경해주는 메서드
	public int updateTask(Task task, String bTaskId) {
			
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = taskDao.updateTask(conn, task, bTaskId);
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
			return res;	
	}
	
	public ArrayList<Feedback> selectFeedback(int tIdx){
		
		Connection conn = jdt.getConnection();
		ArrayList<Feedback> feedList = null;
		
		try {
			
			feedList = taskDao.selectFeedback(conn, tIdx);
			
		} finally {
			jdt.close(conn);
		}
		
		return feedList;
	}
	
	public int updateFeedback(int isDel,int tIdx, String userId, String feedbackComment) {
		
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = taskDao.updateFeedback(conn, isDel, tIdx, userId, feedbackComment) ;
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		return res;	
	}
	
	public int updatePriority(String taskPriority,String projectId) {
		
		Connection conn = jdt.getConnection();
		int res = 0;
		try {
			res = taskDao.updatePriority(conn, taskPriority, projectId) ;
			jdt.commit(conn);
		} catch (DataAccessException e) {
			jdt.rollback(conn);
			throw new ToAlertException(e.error);
		} finally {
			jdt.close(conn);
		}
		return res;	
	}

}
