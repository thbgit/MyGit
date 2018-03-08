package com.hc.revolves.dao;

import com.hc.revolves.bean.User;

//功能实现 的接口
public interface UserDao {

	/**
	 * 登录
	 * 
	 * @param user
	 * @return 返回改用户
	 */
	User userLogin(User user);

	/**
	 * 注册
	 * 
	 * @param user
	 * @return 返回注册是否成功
	 */
	boolean userRegister(User user);

	/**
	 * 判断用户是否存在
	 * 
	 * @param user
	 * @return 返回是否已经存在该用户名
	 */
	boolean userJudge(User user);

	/**
	 * 根据用户名获取一个用户对象
	 * 
	 * @param username
	 * @return 返回指定用户
	 */
	User getUser(String username);

	/**
	 * 更新用户余额，用户支付功能
	 * 
	 * @param user
	 * @param balance
	 */
	void updateUserbalance(User user, int balance);
}
