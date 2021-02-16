package com.wwe.task.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.task.feedback.Feedback;
import com.wwe.task.model.vo.Task;

public class TaskDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	//업무추가
	public int insertTask(Connection conn, Task task) {
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into tb_task(t_idx,task_id,task_content,dead_line,user_id,project_id)"
					+ "values(sc_t_idx.nextval,?,?,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, task.getTaskId());
			pstm.setString(2, task.getTaskContent());
			pstm.setString(3, task.getDeadLine());
			pstm.setString(4, task.getUserId());
			pstm.setString(5, task.getProjectId());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.TK02, e);
		}finally {
			jdt.close(pstm);
		}

		return res;
	}
	
	//프로젝트 별 업무리스트 조회
	public ArrayList<Task> selectAllTaskList(Connection conn, String projectId){
		
		ArrayList<Task> taskList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "SELECT * FROM TB_TASK WHERE PROJECT_ID = ?";
			
			//3. 쿼리문 실행용 객체를 생성
			pstm = conn.prepareStatement(query);
			//4. PreparedStatement의 쿼리문을 완성
			pstm.setString(1, projectId);
			//5. 쿼리문 실행하고 결과(resultSet)를 받음
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task task = new Task();
				task.setProjectId(projectId);
				task.setTaskId(rset.getString("TASK_ID"));
				task.setDeadLine(rset.getString("DEAD_LINE"));
				task.setTaskContent(rset.getString("TASK_CONTENT"));
				task.setTaskPriority(rset.getString("TASK_PRIORITY"));
				task.setTaskState(rset.getString("TASK_STATE"));
				task.setUserId(rset.getString("user_id"));
				
				taskList.add(task);
			}

		} catch (SQLException e) {;
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return taskList;
	}
	
	//업무 별 상세내용 조회
	public ArrayList<Task> detailTask(Connection conn, String taskId){
		
		ArrayList<Task> detailList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "SELECT * FROM TB_TASK WHERE TASK_ID = ?";
			
			//3. 쿼리문 실행용 객체를 생성
			pstm = conn.prepareStatement(query);
			//4. PreparedStatement의 쿼리문을 완성
			pstm.setString(1, taskId);
			//5. 쿼리문 실행하고 결과(resultSet)를 받음
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task task = new Task();
				task.setTaskId(taskId);
				task.setTaskContent(rset.getString("task_content"));
				task.setDeadLine(rset.getString("dead_line"));
				task.setTaskPriority(rset.getString("task_priority"));
				task.setTaskState(rset.getString("task_state"));
				task.setUserId(rset.getString("user_id"));
				task.settIdx(rset.getInt("t_idx"));
				
				detailList.add(task);
			}

		} catch (SQLException e) {;
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return detailList;
	}
	
	public int insertFeedback(Connection conn, Feedback feedback) {
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "insert into tb_feedback(TASK_ID,FEEDBACK_COMMENT,ISDEL,USER_ID,T_IDX) "
					+ "values(?,?,?,?,?)";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, feedback.getTaskId());
			pstm.setString(2, feedback.getFeedbackComment());
			pstm.setInt(3, feedback.getIsDel());
			pstm.setString(4, feedback.getUserId());
			pstm.setInt(5, feedback.gettIdx());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FK01, e);
		}finally {
			jdt.close(pstm);
		}

		return res;
	}
	
	//내 업무리스트 불러오기
	public ArrayList<Task> selectMyList(Connection conn, String userId,String projectId){
		
		ArrayList<Task> myList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "SELECT * FROM TB_TASK WHERE USER_ID = ? AND PROJECT_ID = ?";
			
			//3. 쿼리문 실행용 객체를 생성
			pstm = conn.prepareStatement(query);
			//4. PreparedStatement의 쿼리문을 완성
			pstm.setString(1, userId);
			pstm.setString(2, projectId);
			//5. 쿼리문 실행하고 결과(resultSet)를 받음
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task task = new Task();
				task.setUserId(userId);
				task.setTaskId(rset.getString("task_id"));
				task.setTaskPriority(rset.getString("task_priority"));
				task.setTaskState(rset.getString("task_state"));
				task.setDeadLine(rset.getString("dead_line"));
				task.setStartDate(rset.getString("start_date"));
				task.setProjectId(rset.getString("project_id"));
				
				myList.add(task);
			}

		} catch (SQLException e) {;
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return myList;
	}
	
	//프로젝트 멤버이름 불러오기
	public ArrayList<ProjUser> selectName(Connection conn, String projectId){
		
		ArrayList<ProjUser> memberList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "SELECT * FROM TB_PROJECT_USER WHERE PROJECT_ID = ?";

			pstm = conn.prepareStatement(query);
			pstm.setString(1, projectId);
			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				ProjUser projUser = new ProjUser();
				projUser.setUserId(rset.getString("user_id"));
				projUser.setAuthority(rset.getString("authority"));
				
				
				memberList.add(projUser);
			}

		} catch (SQLException e) {;
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return memberList;
		
	}
	
	public ArrayList<Task> selectTaskbyMem(Connection conn, String projectId, String userId, String leaderId){
		
		ArrayList<Task> taskByMember = new ArrayList<>();
			PreparedStatement pstm = null;
			ResultSet rset = null;
			
			try{
				String query = "SELECT * FROM TB_TASK WHERE PROJECT_ID = ? AND USER_ID != ? AND USER_ID = ?";
				
				//3. 쿼리문 실행용 객체를 생성
				pstm = conn.prepareStatement(query);
				//4. PreparedStatement의 쿼리문을 완성
				pstm.setString(1, projectId);
				pstm.setString(2, userId);
				pstm.setString(3, leaderId);
				//5. 쿼리문 실행하고 결과(resultSet)를 받음
				rset = pstm.executeQuery();
				
				while(rset.next()) {
					Task task = new Task();
					task.setProjectId(projectId);
					task.setTaskId(rset.getString("TASK_ID"));
					task.setDeadLine(rset.getString("DEAD_LINE"));
					task.setTaskContent(rset.getString("TASK_CONTENT"));
					task.setTaskPriority(rset.getString("TASK_PRIORITY"));
					task.setTaskState(rset.getString("TASK_STATE"));
					task.setUserId(rset.getString("user_id"));
					
					taskByMember.add(task);
				}

			} catch (SQLException e) {;
				throw new DataAccessException(ErrorCode.TK01,e);
			}finally {
				jdt.close(rset,pstm);
			}
			
			return taskByMember;
	}

	
	public int updateTaskState(Connection conn,String projectId,String taskState) {
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "UPDATE TB_TASK SET TASK_STATE = ? WHERE PROJECT_ID = ? AND TASK_STATE != 'ST03' AND DEAD_LINE + 1 < SYSDATE";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, taskState);
			pstm.setString(2, projectId);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UT02,e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//업무상태 변경 메서드
	public int updateState(Connection conn, String taskState, String taskId, String userId) {
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "UPDATE TB_TASK SET TASK_STATE = ? WHERE TASK_ID = ? AND USER_ID = ?"; 
			
			System.out.println(taskState);
			System.out.println(taskId);
			System.out.println(userId);
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, taskState);
			pstm.setString(2, taskId);
			pstm.setString(3, userId);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UT02,e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public int updateTask(Connection conn, Task task, String bTaskId) {
		
		int res=0;
		PreparedStatement pstm = null;
		
		String query = "UPDATE TB_TASK SET USER_ID = ?, TASK_ID =?, DEAD_LINE = ?, TASK_CONTENT = ? "
				+"WHERE TASK_ID = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, task.getUserId());
			pstm.setString(2, task.getTaskId());
			pstm.setString(3, task.getDeadLine());
			pstm.setString(4, task.getTaskContent());
			pstm.setString(5, bTaskId);
			res = pstm.executeUpdate();
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UT01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//feedback 불러오기
	public ArrayList<Feedback> selectFeedback(Connection conn, int tIdx){
		
		ArrayList<Feedback> feedList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "SELECT * FROM TB_FEEDBACK WHERE T_IDX = ?";

			pstm = conn.prepareStatement(query);
			pstm.setInt(1, tIdx);

			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Feedback feedback = new Feedback();
				feedback.setUserId(rset.getString("user_id"));
				feedback.setTaskId(rset.getString("task_id"));
				feedback.setFeedbackComment(rset.getString("feedback_comment"));
				feedback.setIsDel(rset.getInt("isdel"));
				
				feedList.add(feedback);
			}

		} catch (SQLException e) {;
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return feedList;
	}
	
	public int updateFeedback(Connection conn, int isDel, int tIdx, String userId, String feedbackComment) {
		
		int res=0;
		PreparedStatement pstm = null;
		
		String query = "UPDATE TB_FEEDBACK SET ISDEL = ? WHERE USER_ID = ? AND FEEDBACK_COMMENT = ? AND T_IDX = ?";

		try {
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, isDel);
			pstm.setString(2, userId);
			pstm.setString(3, feedbackComment);
			pstm.setInt(4, tIdx);
			res = pstm.executeUpdate();
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FK02, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public int updatePriority(Connection conn, String taskPriority, String projectId) {
		
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String query = "UPDATE TB_TASK SET TASK_PRIORITY = ? WHERE PROJECT_ID = ? AND (DEAD_LINE - SYSDATE < 3) AND TASK_STATE != 'ST03' AND TASK_STATE != 'ST04'";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, taskPriority);
			pstm.setString(2, projectId);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UT02,e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
}
