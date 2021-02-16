package com.wwe.task.model.vo;

public class Task {
	
	private int tIdx;
	private String taskId;
	private String taskContent;
	private String taskPriority;
	private String deadLine;
	private String taskState;
	private String userId;
	private String projectId;
	private String startDate;
	private int taskHelp;
	private String proContents;
	
	public Task() {
		super();
	}

	public int gettIdx() {
		return tIdx;
	}

	public void settIdx(int tIdx) {
		this.tIdx = tIdx;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getTaskContent() {
		return taskContent;
	}

	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}

	public String getTaskPriority() {
		return taskPriority;
	}

	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}

	public String getDeadLine() {
		return deadLine;
	}

	public void setDeadLine(String deadLine) {
		this.deadLine = deadLine;
	}

	public String getTaskState() {
		return taskState;
	}

	public void setTaskState(String taskState) {
		this.taskState = taskState;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public int getTaskHelp() {
		return taskHelp;
	}

	public void setTaskHelp(int taskHelp) {
		this.taskHelp = taskHelp;
	}

	public String getProContents() {
		return proContents;
	}

	public void setProContents(String proContents) {
		this.proContents = proContents;
	}


}