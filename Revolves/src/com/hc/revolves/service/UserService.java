package com.hc.revolves.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Administrator 用户相关业务处理
 */
public interface UserService {

	/**
	 * 登录功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 注册功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 验证码
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void ver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 退出功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void quit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

}
