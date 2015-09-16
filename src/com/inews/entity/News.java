package com.inews.entity;

/**
 * 对应数据库news实体类--新闻详细信息表 
 * @author chenzhijun
 *
 */
public class News {

	private int newsId;
	private String newsTitle;
	private String newsBody;
	private String newsDate;
	private String newsAuthor;
	private String newsImage;
	private String newsVideo;
	private int typeId;
	private int isPublish;
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsBody() {
		return newsBody;
	}
	public void setNewsBody(String newsBody) {
		this.newsBody = newsBody;
	}
	public String getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(String newsDate) {
		this.newsDate = newsDate;
	}
	public String getNewsAuthor() {
		return newsAuthor;
	}
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	public String getNewsImage() {
		return newsImage;
	}
	public void setNewsImage(String newsImage) {
		this.newsImage = newsImage;
	}
	public String getNewsVideo() {
		return newsVideo;
	}
	public void setNewsVideo(String newsVideo) {
		this.newsVideo = newsVideo;
	}
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public int getIsPublish() {
		return isPublish;
	}
	public void setIsPublish(int isPublish) {
		this.isPublish = isPublish;
	}

	
}

