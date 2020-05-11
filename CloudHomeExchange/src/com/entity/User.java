package com.entity;

public class User {
	private String uid;
	private String nickName;
	private int type;
	private int gender;
	private String birth;
	private String email;
	private int telephone;
	private String psw;
	private int state;
	
	public User(String uid, String nickName, int gender, String birth, String email, int telephone) {
		super();
		this.uid = uid;
		this.nickName = nickName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.telephone = telephone;
	}
	
	public User() {
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTelephone() {
		return telephone;
	}
	public void setTelephone(int telephone) {
		this.telephone = telephone;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	

}
