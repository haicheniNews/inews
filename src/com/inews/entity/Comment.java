package com.inews.entity;

/**
 * 对应数据库实体类comment--评论
 * @author chenzhijun
 *
 */
public class Comment {

	private int commentId;
	private int newsId;
	private String commentDate;
	private String commentBody;
	private String userId;
	private String commentIp;
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentBody() {
		return commentBody;
	}
	public void setCommentBody(String commentBody) {
		this.commentBody = commentBody;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentIp() {
		return commentIp;
	}
	public void setCommentIp(String commentIp) {
		this.commentIp = commentIp;
	}

	

}

