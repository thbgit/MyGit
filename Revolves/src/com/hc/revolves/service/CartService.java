package com.hc.revolves.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CartService {

	/**
	 * 查询购物车功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void queryCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 添加到购物车功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void addtocart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 
	 * 购物车确认支付功能
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void confirmpayment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

	/**
	 * 删除购物车中的商品
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	void deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
