package com.wwe.project.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.leader.model.vo.ProjUser;
import com.wwe.member.model.vo.Alarm;
import com.wwe.member.model.vo.Member;
import com.wwe.project.model.vo.Project;
import com.wwe.project.model.vo.ProjectMaster;

public class ProDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	
	//새 프로젝트 생성해서 DB에 추가
	public int insertNewProject(Connection conn, Project project) {
	      int res = 0;
	      PreparedStatement pstm = null;
	      
	      try {
	    	 String sql = "insert into tb_project "
		    		  	+ "(project_id, due_date, progress, leader_id) "
		    		  	+ "values(?, ?, 0, ?)";
    	  
	         pstm = conn.prepareStatement(sql);
	         pstm.setString(1, project.getProjectId());
	         pstm.setString(2, project.getDueDate());
	         pstm.setString(3, project.getLeaderId());
	         res = pstm.executeUpdate();
	         	         
	      } catch (SQLException e) {
	         throw new DataAccessException(ErrorCode.IB01, e); 
	
	      }finally {
	    	  jdt.close(pstm);
	      }
	      
	      //성공하면 1, 실패하면 0 반환
	      //(1은 쿼리를 실행한 횟수)
	      return res;
	   }
	
	
	//tb_project_master 디비에 전달
	public int projectMaster(Connection conn, ProjectMaster projectMaster) {
		int res = 0;
		PreparedStatement pstm = null;
		
		try {
			String sql = "insert into tb_project_master "
					+ "(project_id, user_id, work_time) "
					+ "values(?, ?, sysdate)";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, projectMaster.getProjectId());
			pstm.setString(2, projectMaster.getUserId());
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IB01, e); 
			
		}finally {
			jdt.close(pstm);
		}

		return res;
	}
	
	
	//새 프로젝트의 참여자 추가
	public ArrayList<Member> selectMember(Connection conn) {
		ArrayList<Member> memberList = new ArrayList<Member>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "select * from tb_user";
			
			//주소창처럼 => 아이디로 입력을 받고, 이 아이디로 검색해서 추가
			pstm = conn.prepareStatement(query);
			rset = pstm.executeQuery();
			while(rset.next()) {
				Member member = new Member();
				member.setUserID(rset.getString("user_id"));
				member.setUserName(rset.getString("user_name"));
				memberList.add(member);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return memberList;
	}
	
	
	//팀원 추가에서 추가버튼 눌렀을 때 => 본인이나 유저테이블에 없는 아이디 거르기
		public Member selectMemberForFilter(Connection conn, String userId, String leaderId){ //userId: 입력된 값, leaderId: 세션에 있는 본인아이디
			Member member = null;
			PreparedStatement pstm = null;
			ResultSet rset = null;
			
			try{
				String query = "select * from tb_user "
							+ "where user_id = ? and user_id != ?"; //첫번째 ?: 입력한 id, 두번째 ?: 본인아이디
	
				//주소창처럼 => 아이디로 입력을 받고, 이 아이디로 검색해서 추가
				//projUserList.size()-1
				pstm = conn.prepareStatement(query);
				pstm.setString(1, userId);
				pstm.setString(2, leaderId);
				rset = pstm.executeQuery();
				
				//rset값(조회한 결과)이 있을때만 실행
				while(rset.next()) {
					member = new Member();
					member.setUserID(rset.getString("user_id")); 				
				}
				
			} catch (SQLException e) {
				throw new DataAccessException(ErrorCode.IN01, e);
			}finally {
				jdt.close(rset,pstm);
			}
			
			return member;
		}
	
	
	//추가된 팀원을 DB에 넣기
	public int insertMember(Connection conn, ArrayList<ProjUser> projUserList){
		PreparedStatement pstm = null;
		int res = 0;
		try{
			String query = "insert into tb_project_user(project_id,user_id,authority) ";
						
			for(int i = 0; i < projUserList.size(); i++) {
				if(i == projUserList.size()-1) {
					query += "select ?, ?, ? from dual";
				}else {
					query += "select ?, ?, ? from dual union all ";
				}
			}
			
			//주소창처럼 => 아이디로 입력을 받고, 이 아이디로 검색해서 추가
			//projUserList.size()-1
			pstm = conn.prepareStatement(query);
			for(int i = 0; i < projUserList.size(); i++) {
					pstm.setString(i +(i*2+1), projUserList.get(i).getProjectId());
					pstm.setString(i +(i*2+2), projUserList.get(i).getUserId());
					pstm.setString(i +(i*2+3), projUserList.get(i).getAuthority());
			}
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.IN01, e);
		}finally {
			jdt.close(pstm);
		}
		
		return res;
	}
	
	

	//최근 프로젝트 받아오기 (최근 작업시간 순으로)
	public ArrayList<ProjectMaster> selectRecentProject(Connection conn, String userId){
		ArrayList<ProjectMaster> recentProject = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try{
			String query = "select user_id, project_id, work_time, p.leader_id "
							+ "from tb_project_master pm "
								+ "join tb_project p "
								+ "using(project_id) "
								+ "where user_id = ? "
								+ "order by work_time desc";
	
			//= sql에 쿼리 입력
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);

			//= sql의 쿼리 실행
			rset = pstm.executeQuery();
			
			//쿼리를 실행해서 얻은 데이터가 다음값이 없을 때까지(= false) 반복
			while(rset.next()) {
				ProjectMaster promaster = new ProjectMaster();
				promaster.setUserId(rset.getString("user_id"));
				promaster.setProjectId(rset.getString("project_id"));
				promaster.setWorkTime(rset.getString("work_time"));
				promaster.setLeaderId(rset.getString("leader_id"));
				
				//얻어진 project 객체를 list에 붙임
				recentProject.add(promaster);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
			
		}finally {
			jdt.close(rset,pstm);
		}
		
		return recentProject;
	}
	
	
	//초대된 프로젝트 받아오기
	public ArrayList<ProjUser> selectInvitedProject(Connection conn, String userId) {
		ArrayList<ProjUser> projectList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		try {
			String query = "select * from tb_project_user pu "
							+ "join tb_project p "
							+ "using(project_id) "
							+ "where pu.user_id = ?";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);
			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				ProjUser proj = new ProjUser();
				proj.setProjectId(rset.getString("project_id"));
				proj.setUserId(rset.getString("user_id"));
				proj.setLeaderId(rset.getString("leader_id"));
				
				projectList.add(proj);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.SM01, e);
		}finally {
			jdt.close(rset,pstm);
		}
		
		return projectList;
	}
}
