package com.wwe.task.feedback;

public class Feedback {
	
	private String taskId;
	private int isDel;
	private String feedbackComment;
	private String userId;
	private int tIdx;
	
	public String getTaskId() {
		return taskId;
	}
	
	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}
	
	public int getIsDel() {
		return isDel;
	}
	
	public void setIsDel(int isDel) {
		this.isDel = isDel;
	}
	
	public String getFeedbackComment() {
		return feedbackComment;
	}
	
	public void setFeedbackComment(String feedbackComment) {
		this.feedbackComment = feedbackComment;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int gettIdx() {
		return tIdx;
	}
	
	public void settIdx(int tIdx) {
		this.tIdx = tIdx;
	}
}
