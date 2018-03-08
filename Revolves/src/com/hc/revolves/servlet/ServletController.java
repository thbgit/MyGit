package com.hc.revolves.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hc.revolves.service.AddrService;
import com.hc.revolves.service.CartService;
import com.hc.revolves.service.GoodsService;
import com.hc.revolves.service.UserService;
import com.hc.revolves.serviceImpl.AddrServiceImpl;
import com.hc.revolves.serviceImpl.CartServiceImpl;
import com.hc.revolves.serviceImpl.GoodsServiceImpl;
import com.hc.revolves.serviceImpl.UserServiceImpl;

public class ServletController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 处理乱码
		// req.setCharacterEncoding("utf-8");
		// resp.setContentType("text/html;charset=utf-8");
		// 获取路径
		String urlPath = req.getServletPath();
		String uriPath = (String) urlPath.subSequence(urlPath.lastIndexOf("/") + 1, urlPath.lastIndexOf("."));

		// 负责项目分发
		// login负责登录功能
		UserService userService = new UserServiceImpl();
		GoodsService goodsService = new GoodsServiceImpl();
		CartService cartService = new CartServiceImpl();
		AddrService addrService = new AddrServiceImpl();
		if ("login".equals(uriPath)) {// 登录功能
			userService.login(req, resp);
		} else if ("register".equals(uriPath)) {// 注册功能
			userService.register(req, resp);
		} else if ("ver".equals(uriPath)) {// 获取验证码
			userService.ver(req, resp);
		} else if ("quit".equals(uriPath)) {// 退出功能
			userService.quit(req, resp);
		} else if ("recordServlet".equals(uriPath)) {// 浏览记录功能
			goodsService.record(req, resp);
		} else if ("selectAll".equals(uriPath)) {// 所有商品信息
			goodsService.selectAll(req, resp);
		} else if ("selectDetails".equals(uriPath)) {// 商品详细信息
			goodsService.selectDetails(req, resp);
		} else if ("selectGoods".equals(uriPath)) {// 分页
			goodsService.selectGoods(req, resp);
		} else if ("search".equals(uriPath)) {// 搜索功能
			goodsService.search(req, resp);
		} else if ("cartServlet".equals(uriPath)) {// 购物车
			cartService.addtocart(req, resp);
		} else if ("queryCart".equals(uriPath)) {// 查询购物车
			cartService.queryCart(req, resp);
		} else if ("deleteGoods".equals(uriPath)) {// 删除购物车
			cartService.deleteGoods(req, resp);
		} else if ("userAddress".equals(uriPath)) {// 判断地址
			addrService.userAddress(req, resp);
		} else if ("addAddress".equals(uriPath)) {// 添加地址
			addrService.addAddress(req, resp);
		} else if ("payorder".equals(uriPath)) {// 选择地址
			addrService.choiceAddr(req, resp);
		} else if ("confirmpayment".equals(uriPath)) {// 确认支付
			cartService.confirmpayment(req, resp);
		}

	}
}
