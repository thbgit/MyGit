package com.hc.revolves.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 商品相关功能实现
 * 
 * @author Administrator
 *
 */
public interface GoodsService {

	/**
	 * 浏览记录
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void record(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 查询所有商品信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void selectAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 查询指定商品信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void selectDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 搜索功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 分页功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void selectGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
