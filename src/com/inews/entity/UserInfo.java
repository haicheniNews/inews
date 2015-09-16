package com.inews.entity;

/**
 * 对应数据库user_info实体类--用户详细信息表
 * @author chenzhijun
 *
 */
public class UserInfo {

	private String userId;
	private String userName;
	private String userSex;
	private int userAge;
	private String userAddress;
	private String userEmail;
	private String userBirth;
	private String userPhone;
	private String userCountry;
	private String userRemarks;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserCountry() {
		return userCountry;
	}
	public void setUserCountry(String userCountry) {
		this.userCountry = userCountry;
	}
	public String getUserRemarks() {
		return userRemarks;
	}
	public void setUserRemarks(String userRemarks) {
		this.userRemarks = userRemarks;
	}
	public UserInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserInfo(String userId, String userName, String userSex,
			int userAge, String userAddress, String userEmail,
			String userBirth, String userPhone, String userCountry,
			String userRemarks) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userSex = userSex;
		this.userAge = userAge;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.userPhone = userPhone;
		this.userCountry = userCountry;
		this.userRemarks = userRemarks;
	}
	


	
}

