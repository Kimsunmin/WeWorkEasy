package com.wwe.common.util.file;

import java.sql.Date;

public class FileVo {
	private String fileIdx;
	private String userId;
	private String projectId;
	private String fileName;
	private String fileRename;
	private String fileContent;
	private String filePath;
	private Date updateDate;
	
	public FileVo() {
		// TODO Auto-generated constructor stub
	}

	public String getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public String getFileContent() {
		return fileContent;
	}

	public void setFileContent(String fileContent) {
		this.fileContent = fileContent;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "FileVo [userId=" + userId + ", projectId=" + projectId + ", fileName=" + fileName + ", fileRename="
				+ fileRename + ", fileContent=" + fileContent + ", filePath=" + filePath + ", updateDate=" + updateDate
				+ ", uploader=" + "]";
	}

	
}
