package com.wwe.leader.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.tomcat.dbcp.dbcp2.SQLExceptionList;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.task.model.vo.Task;

public class LeaderDao {

	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	// 유저에게 권한을 추가하는 메소드
	public int inviteUser(Connection conn, String userId, String authority, String projectId) {
		
		int res =0;
		PreparedStatement pstm = null;
		

		try {
			String query = "INSERT INTO TB_PROJECT_USER"
					+"(USER_ID, AUTHORITY, PROJECT_ID) "
					+"VALUES(?,?,?)";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			pstm.setString(2, authority);
			pstm.setString(3, projectId);
			res = pstm.executeUpdate();
			
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.IN01,e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//팀원 초대 시 입력한 아이디가 유효한 아이디인지 체크하는 메소드
	public String chkInvalidUser(Connection conn, String userId) {
		
		String mUserid = " ";
		int res =0;
		PreparedStatement pstm =null;
		ResultSet rset = null;
		
		String query = "SELECT USER_ID FROM TB_USER "
				+"WHERE USER_ID =?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				mUserid = rset.getString("USER_ID");
			}
		}catch (SQLException e) {
			//커스텀 예외를 처리해주어야 할 부분
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset,pstm);
		}
		return mUserid;
	}
	
	//프로젝트에서 각 팀원이 맡은 업무 리스트를 가져오는 메소드
	public ArrayList<Task> selectTaskList(Connection conn,String projectId){
		ArrayList<Task> taskList = new ArrayList<>();
		PreparedStatement pstm =null;
		ResultSet rset = null;
		
		String query = "SELECT *FROM TB_TASK "
				+"WHERE PROJECT_ID = ? AND TASK_STATE != ? "
				+"ORDER BY T_IDX ASC";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1,projectId);
			pstm.setString(2, "ST03");
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task task = new Task();
				task.settIdx(rset.getInt("T_IDX"));
				task.setProjectId(rset.getString("PROJECT_ID"));
				task.setTaskId(rset.getString("TASK_ID"));
				task.setTaskContent(rset.getString("TASK_CONTENT"));
				task.setUserId(rset.getString("USER_ID"));
				task.setDeadLine(rset.getString("DEAD_LINE"));
				task.setStartDate(rset.getString("START_DATE"));
				taskList.add(task);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.TK01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		return taskList;
	}
	
	//프로젝트의 팀원 정보를 가져오는 메소드
	public ArrayList<ProjUser> selectUserListByPid(Connection conn,String projectId){
		ArrayList<ProjUser> userList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String query = "SELECT *FROM TB_PROJECT_USER "
				+"WHERE PROJECT_ID =?";
		try {
		
			pstm = conn.prepareStatement(query);
			pstm.setString(1,projectId);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				ProjUser user = new ProjUser();
				user.setUserId(rset.getString("USER_ID"));
				user.setAuthority(rset.getString("AUTHORITY"));
				user.setProjectId(rset.getString("PROJECT_ID"));
				userList.add(user);
			}
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.SM02, e);
		}finally {
			jdt.close(rset,pstm);
		}
		return userList;
	}
	
	//프로젝트에 속한 팀원의 권한을 변경하는 메소드
	public int updateAuthority(Connection conn, ProjUser projUser) {
			int res = 0;
			PreparedStatement pstm = null;
			
			String query = "UPDATE TB_PROJECT_USER "
					+"SET AUTHORITY = ? "
					+"WHERE PROJECT_ID = ? AND USER_ID = ?";
			try {
				pstm = conn.prepareStatement(query);
				pstm.setString(1, projUser.getAuthority());
				pstm.setString(2, projUser.getProjectId());
				pstm.setString(3, projUser.getUserId());
				res = pstm.executeUpdate();
				System.out.println(res);
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.UU01, e);
			}finally {
				jdt.close(pstm);
			}
			return res;
	}
	
	//팀장 권한을 넘겨주는 메소드
	public int changeLeader(Connection conn, ProjUser user) {
		int res = 0;
		PreparedStatement pstm = null;
		
		String query =  "UPDATE TB_PROJECT_USER "
				+"SET AUTHORITY =? WHERE PROJECT_ID =? AND USER_ID =?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1,user.getAuthority());
			pstm.setString(2,user.getProjectId());
			pstm.setString(3,user.getUserId());
			res = pstm.executeUpdate();
			
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UU01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//TB_PROJECT의 프로젝트의 팀장을 변경하는 메소드
	public int changeProLeader(Connection conn, ProjUser user) {
		int res = 0;
		PreparedStatement pstm = null;
		
		String query = "UPDATE TB_PROJECT "
				+"SET LEADER_ID = ? WHERE PROJECT_ID = ?";
		
		System.out.println("다오에서 받은 프로젝트아이디 : "+ user.getProjectId());
		System.out.println("다오에서 받은 리더아이디 : "+ user.getUserId());
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, user.getUserId());
			pstm.setString(2, user.getProjectId());
			res = pstm.executeUpdate();
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.UU01, e);
		}finally {
			jdt.close(pstm);
		}
		
		return res;
	}
	
	//업무명으로 업무 검색하는 메소드
	public ArrayList<Task> selectTaskByTask(Connection conn,Task task){
		ArrayList<Task> taskList = new ArrayList<Task>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		System.out.println(task.getProjectId());
		System.out.println(task.getTaskId());
		String query = "SELECT*FROM TB_TASK "
				+"WHERE PROJECT_ID = ? AND TASK_ID LIKE '%'||?||'%' AND TASK_STATE != ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, task.getProjectId());
			pstm.setString(2, task.getTaskId());
			pstm.setString(3, "ST03");
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task mTask = new Task();
				System.out.println(rset.getString("TASK_ID"));
				mTask.settIdx(rset.getInt("T_IDX"));
				mTask.setProjectId(rset.getString("PROJECT_ID"));
				mTask.setTaskId(rset.getString("TASK_ID"));
				mTask.setTaskContent(rset.getString("TASK_CONTENT"));
				mTask.setUserId(rset.getString("USER_ID"));
				mTask.setDeadLine(rset.getString("DEAD_LINE"));
				mTask.setStartDate(rset.getString("START_DATE"));
				taskList.add(mTask);
			}
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.SC01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		return taskList;
	}
	
	//유저아이디로 업무를 검색하는 메소드
	public ArrayList<Task> selectTaskById(Connection conn,Task task){
		ArrayList<Task> taskList = new ArrayList<Task>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		System.out.println(task.getProjectId());
		System.out.println(task.getTaskId());
		String query = "SELECT * FROM TB_TASK "
				+"WHERE PROJECT_ID = ? AND USER_ID LIKE '%'||?||'%' AND TASK_STATE != ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, task.getProjectId());
			pstm.setString(2, task.getUserId());
			pstm.setString(3, "ST03");
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Task mTask = new Task();
				System.out.println(rset.getString("TASK_ID"));
				mTask.settIdx(rset.getInt("T_IDX"));
				mTask.setProjectId(rset.getString("PROJECT_ID"));
				mTask.setTaskId(rset.getString("TASK_ID"));
				mTask.setTaskContent(rset.getString("TASK_CONTENT"));
				mTask.setUserId(rset.getString("USER_ID"));
				mTask.setDeadLine(rset.getString("DEAD_LINE"));
				mTask.setStartDate(rset.getString("START_DATE"));
				taskList.add(mTask);
			}
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.SC01,e);
		}finally {
			jdt.close(rset,pstm);
		}
		return taskList;
	}
	
	//업무수정을하는 메소드
	public int updateTask(Connection conn, Task task) {
		int res=0;
		PreparedStatement pstm = null;
		
		String query = "UPDATE TB_TASK SET USER_ID = ?, TASK_ID =?, DEAD_LINE = ?, TASK_CONTENT = ? "
				+"WHERE T_IDX = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, task.getUserId());
			pstm.setString(2, task.getTaskId());
			pstm.setString(3, task.getDeadLine());
			pstm.setString(4, task.getTaskContent());
			pstm.setInt(5, task.gettIdx());
			res = pstm.executeUpdate();
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UT01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//선택한 업무를 삭제하는 메소드
	public int deleteTask(Connection conn, ArrayList<Integer> tIdx) {
		int res = 0;
		PreparedStatement pstm = null;
		
		String query = "UPDATE TB_TASK SET TASK_STATE = ? "
				+"WHERE T_IDX IN ( ";
		
		for(int i = 0; i<tIdx.size(); i++) {
			if(i==tIdx.size()-1) {
				query += "? )";
				
			}else {
				query += "?,";
			}
			  
		}
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, "ST03");
			for(int i = 0; i< tIdx.size(); i++) {
				System.out.println("삭제할 업무 : "+String.valueOf(tIdx.get(i)));
				pstm.setInt(i+2,Integer.parseInt(String.valueOf(tIdx.get(i))));
			}
			res = pstm.executeUpdate();
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.DT01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//프로젝트에서 팀원을 삭제하는 메소드
	public int deleteMember(Connection conn, ProjUser user) {
		int res =0;
		PreparedStatement pstm = null;
		
		String query = "DELETE FROM TB_PROJECT_USER "
				+"WHERE PROJECT_ID = ? AND USER_ID = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, user.getProjectId());
			pstm.setString(2, user.getUserId());
			res = pstm.executeUpdate();
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.DU01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//프로젝트에서 팀원을 삭제한 뒤 업무테이블에서 그 팀원의 업무를 삭제하는 메소드
	public int deleteMemberTask(Connection conn, ProjUser user) {
		int res =0;
		PreparedStatement pstm = null;
		
		String query = "DELETE FROM TB_TASK "
				+"WHERE PROJECT_ID = ? AND USER_ID = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, user.getProjectId());
			pstm.setString(2, user.getUserId());
			res = pstm.executeUpdate();
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.DU01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public int deleteProjectMaster(Connection conn, ProjUser user) {
		int res = 0;
		PreparedStatement pstm = null;
		
		String query = "DELETE FROM TB_PROJECT_MASTER "
				+"WHERE PROJECT_ID = ? AND USER_ID =?";
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, user.getProjectId());
			pstm.setString(2, user.getUserId());
			res = pstm.executeUpdate();
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.DU01, e);
		}finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	//유저의 권한을 체크하는 메소드
	public ProjUser chkAuthority(Connection conn, ProjUser user) {
		ProjUser pUser = null;
		PreparedStatement pstm =null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM TB_PROJECT_USER "
				+"WHERE PROJECT_ID =? AND USER_ID =?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, user.getProjectId());
			pstm.setString(2, user.getUserId());
			rset = pstm.executeQuery();
			while(rset.next()) {
				pUser = new ProjUser();
				pUser.setProjectId(rset.getString("PROJECT_ID"));
				pUser.setUserId(rset.getString("USER_ID"));
				pUser.setAuthority(rset.getString("AUTHORITY"));
			}
		}catch (SQLException e) {
			throw new DataAccessException(ErrorCode.UA01, e);
		}finally{
			jdt.close(rset,pstm);
		}
		return pUser;
	}
	
	public int deleteProject(Connection conn, String projectId) {
		int res = 0;
		PreparedStatement pstm = null;
		
		String query = "DELETE FROM TB_PROJECT WHERE PROJECT_ID = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, projectId);
			res = pstm.executeUpdate();
		}catch(SQLException e) {
			throw new DataAccessException(ErrorCode.DP01, e);
		}finally {
			jdt.close(pstm);
		}
		
		return res;
	}
	
	
}