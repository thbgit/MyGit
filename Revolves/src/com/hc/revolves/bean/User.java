package com.hc.revolves.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class User implements Serializable, HttpSessionBindingListener {
	private int userId;
	private String userName;
	private String password;
	private String name;
	private String sex;
	private String nickName;
	private String telNum;
	private String email;
	private Integer balance;
	private Date birthday;
	private String addr1;
	private String addr2;
	private String addr3;
	private int status;
	private int identity;

	public User() {

	}

	public User(String userName, String password, String name, String sex, String nickName, String telNum, String email,
			Integer balance, Date birthday, String addr1, String addr2, String addr3, int status, int identity) {
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.nickName = nickName;
		this.telNum = telNum;
		this.email = email;
		this.balance = balance;
		this.birthday = birthday;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.status = status;
		this.identity = identity;
	}

	public User(int userId, String userName, String password, String name, String sex, String nickName, String telNum,
			String email, Integer balance, Date birthday, String addr1, String addr2, String addr3, int status,
			int identity) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.nickName = nickName;
		this.telNum = telNum;
		this.email = email;
		this.balance = balance;
		this.birthday = birthday;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.status = status;
		this.identity = identity;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTelNum() {
		return telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getIdentity() {
		return identity;
	}

	public void setIdentity(int identity) {
		this.identity = identity;
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// 每当用户登录时 将用户的session保存到map中
		HttpSession session = event.getSession();
		Map<String, HttpSession> map = (Map<String, HttpSession>) session.getServletContext().getAttribute("map");
		map.put(this.userName, session);
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// 每当该用户正常注销时,将用户的session从map中移除
		HttpSession session = event.getSession();
		Map<String, HttpSession> map = (Map<String, HttpSession>) session.getServletContext().getAttribute("map");
		map.remove(this.userName);
	}

}
