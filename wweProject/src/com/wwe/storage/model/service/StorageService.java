package com.wwe.storage.model.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.wwe.common.code.ErrorCode;
import com.wwe.common.exception.DataAccessException;
import com.wwe.common.exception.ToAlertException;
import com.wwe.common.jdbc.JDBCTemplate;
import com.wwe.common.util.file.FileUtils;
import com.wwe.common.util.file.FileVo;
import com.wwe.storage.model.dao.StorageDao;

public class StorageService {
	JDBCTemplate jdt = JDBCTemplate.getInstance();
	StorageDao storageDao = new StorageDao();
	
	public void insertStroage(String userId, String projectId,boolean isTeam ,HttpServletRequest request) {
		Connection conn = jdt.getConnection();
		
		Map<String,List> StorageData = new FileUtils().fileUpload(request);
		
		FileVo Storage = new FileVo();
		
		try {
			//storageDao.insertStorage(conn, Storage);
			for(FileVo data : (List<FileVo>)StorageData.get("fileData")) {
				data.setUserId(userId);
				data.setProjectId(projectId);
				data.setFileContent(StorageData.get("content").get(0).toString());
				if(isTeam) {
					storageDao.insertShareStorage(conn, data);
				}else {
					storageDao.insertPersonalStorage(conn, data);
				}
			}
			jdt.commit(conn);
		} catch (Exception e) {
			jdt.rollback(conn);
			throw new ToAlertException(ErrorCode.IF01,e);
		} finally {
			jdt.close(conn);
		}	
	}
	
	public void deleteStorage(String idx,boolean isTeam) {
		Connection conn = jdt.getConnection();

		try {
			if(isTeam) {
				storageDao.deleteShareStorage(conn, idx);
			}else {
				storageDao.deletePersonalStorage(conn, idx);
			}
		} catch (Exception e) {
			throw new ToAlertException(ErrorCode.IF01,e);
		} finally {
			jdt.close(conn);
		}
		
	}
	
	public Map<String, Object> selectStorage(String idx, boolean isTeam){
		Map<String, Object> commendMap = new HashMap<String, Object>();
		List<FileVo> fileList = null;
		Connection conn = jdt.getConnection();
		
		try {
			if(isTeam) {
				fileList = storageDao.selectShareStorage(conn, idx);
			}else {
				fileList = storageDao.selectPersonalStorage(conn, idx);
			}
			commendMap.put("fileList", fileList);
		}catch (Exception e) {
			throw new ToAlertException(ErrorCode.IF01,e);
		} finally {
			jdt.close(conn);
		}
		
		return commendMap;
	}
	
}
