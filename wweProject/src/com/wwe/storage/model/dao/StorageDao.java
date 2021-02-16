package com.wwe.storage.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.common.util.file.FileVo;

public class StorageDao {
	
	JDBCTemplate jdt = JDBCTemplate.getInstance(); 
	
	public int insertPersonalStorage(Connection conn, FileVo fileData) {
		int res = 0;
		
		String sql = "insert into tb_private_file"
						+ "(file_idx,user_id,file_name,file_content,file_path,file_rename)"
						+ " values(sc_puf_idx.nextval,?,?,?,?,?)";
		
		PreparedStatement pstm = null;
		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, fileData.getUserId());
			pstm.setString(2, fileData.getFileName());
			pstm.setString(3, fileData.getFileContent());
			pstm.setString(4, fileData.getFilePath());
			pstm.setString(5, fileData.getFileRename());
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public int insertShareStorage(Connection conn, FileVo fileData) {
		int res = 0;
		
		String teamSql = "insert into tb_public_file"
						+ "(file_idx,user_id,file_name,file_content,file_path,file_rename,project_id)"
						+ " values(sc_puf_idx.nextval,?,?,?,?,?,?)";
		
		PreparedStatement pstm = null;
		
		try {
			pstm = conn.prepareStatement(teamSql);
			pstm.setString(1, fileData.getUserId());
			pstm.setString(2, fileData.getFileName());
			pstm.setString(3, fileData.getFileContent());
			pstm.setString(4, fileData.getFilePath());
			pstm.setString(5, fileData.getFileRename());
			pstm.setString(6, fileData.getProjectId());

			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(pstm);
		}
		return res;
	}
	
	public void deletePersonalStorage(Connection conn,String idx) {
		PreparedStatement pstm = null;
		String sql = "update tb_private_file set is_del = 1 where file_idx = ?";
		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idx);
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(pstm);
		}
	}
	
	public void deleteShareStorage(Connection conn,String idx) {
		PreparedStatement pstm = null;
		String sql = "update tb_public_file set is_del = 1 where file_idx = ?";
		
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idx);
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(pstm);
		}
	}
	
	public List<FileVo> selectPersonalStorage(Connection conn, String idx){
		List<FileVo> res = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String sql = "select file_name,file_content,file_path,update_date,file_rename,file_idx,user_id "
					+ "from tb_private_file "
					+ "where user_id = ? and is_del = 0 "
					+ "order by file_idx desc";
		
		res = new ArrayList<FileVo>();

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, idx);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				FileVo fileVo = new FileVo();
				fileVo.setFileName(rset.getString(1));
				fileVo.setFileContent(rset.getString(2));
				fileVo.setFilePath(rset.getString(3));
				fileVo.setUpdateDate(rset.getDate(4));
				fileVo.setFileRename(rset.getString(5));
				fileVo.setFileIdx(rset.getString(6));
				fileVo.setUserId(rset.getString(7));
				res.add(fileVo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(rset,pstm);
		}

		return res;
	}
	
	public List<FileVo> selectShareStorage(Connection conn, String idx){
		List<FileVo> res = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		String teamSql = "select file_name,file_content,file_path,update_date,file_rename,file_idx,user_id "
						+ "from tb_public_file "
						+ "where project_id = ? and is_del = 0 "
						+ "order by file_idx desc";
			
		res = new ArrayList<FileVo>();

		try {
			pstm = conn.prepareStatement(teamSql);
			pstm.setString(1, idx);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				FileVo fileVo = new FileVo();
				fileVo.setFileName(rset.getString(1));
				fileVo.setFileContent(rset.getString(2));
				fileVo.setFilePath(rset.getString(3));
				fileVo.setUpdateDate(rset.getDate(4));
				fileVo.setFileRename(rset.getString(5));
				fileVo.setFileIdx(rset.getString(6));
				fileVo.setUserId(rset.getString(7));
				res.add(fileVo);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(ErrorCode.FILE01,e);
		} finally {
			jdt.close(rset,pstm);
		}

		return res;
	}

}
