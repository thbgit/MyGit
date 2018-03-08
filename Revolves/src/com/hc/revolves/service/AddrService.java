package com.hc.revolves.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 用户地址功能
 * 
 * @author haibin
 *
 */
public interface AddrService {

	/**
	 * 判断指定用户是否存在地址
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void userAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 给指定用户增加地址
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void addAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 
	 * 地址选择功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void choiceAddr(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

}
