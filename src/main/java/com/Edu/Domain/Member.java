package com.Edu.Domain;

import java.sql.Timestamp;

public class Member {
	private String name, id, pass, email, mobile, nick;
	private String phone, zipCode, address1, address2, birth, gender;
	private boolean emailGet;
	
	public boolean isEmailGet() {
		return emailGet;
	}

	public void setEmailGet(boolean emailGet) {
		this.emailGet = emailGet;
	}

	private Timestamp regDate;

	public Member() {
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

/*	public String getZipcode() {
		return zipCode;
	}
	
	public void setZipcode(String zipCode) {
		this.zipCode = zipCode;
	}*/

	public String getAddress1() {
		return address1;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public Timestamp getRegDate() {
		return regDate;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

}
