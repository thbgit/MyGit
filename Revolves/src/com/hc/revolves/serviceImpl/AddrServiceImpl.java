package com.hc.revolves.serviceImpl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hc.revolves.bean.Addr;
import com.hc.revolves.bean.Cart;
import com.hc.revolves.bean.Goods;
import com.hc.revolves.bean.User;
import com.hc.revolves.dao.AddrDao;
import com.hc.revolves.dao.CartDao;
import com.hc.revolves.dao.UserDao;
import com.hc.revolves.dao.impl.AddrDaoImpl;
import com.hc.revolves.dao.impl.CartDaoImpl;
import com.hc.revolves.dao.impl.UserDaoImpl;
import com.hc.revolves.service.AddrService;

/**
 * 用户地址功能实现类
 * 
 * @author haibin
 *
 */
public class AddrServiceImpl implements AddrService {

	// 判断用户是否存在地址，用户如果已经有地址，则到选择地址页面
	@Override
	public void userAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		User jspuser = (User) req.getSession().getAttribute("user");
		String checkout = req.getParameter("checkout");
		Goods singlegoods = (Goods) req.getSession().getAttribute("singlegoods");
		// 先查询改用户是否已经存在地址
		if (jspuser != null) {// 如果用户已经登录则
			if ("前往结账".equals(checkout)) {
				singlegoods = null;
				AddrDao addrDao = new AddrDaoImpl();
				UserDao userDao = new UserDaoImpl();
				User user = userDao.getUser(jspuser.getUserName());
				boolean hasAddr = addrDao.queryAddressByUser(user);
				req.getSession().setAttribute("singlegoods", singlegoods);
				if (hasAddr) {
					// 如果存在则遍历该用户的地址
					ArrayList<Addr> addrList = addrDao.queryAllAddressByUser(user);
					req.getSession().setAttribute("addrList", addrList);
					// 如果已经存在地址则跳转到选择地址页面
					resp.sendRedirect(path + "/emptionprocess/useraddress.jsp");
				} else {
					// 如果不存在地址则跳转到添加地址页面
					resp.sendRedirect(path + "/emptionprocess/addaddress.jsp");
				}
			}
		} else {// 如果用户还未登录则到登录页面
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}

	// 添加地址页面
	@Override
	public void addAddress(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		User jspuser = (User) req.getSession().getAttribute("user");
		if (jspuser != null) {
			UserDao userDao = new UserDaoImpl();
			User user = userDao.getUser(jspuser.getUserName());
			String name = req.getParameter("name");// 收货人姓名
			String province = req.getParameter("province");// 省份
			String city = req.getParameter("city");// 市县
			String street = req.getParameter("street");// 街道地址
			String postcode = req.getParameter("postcode");// 邮编
			String telway = req.getParameter("telway");// 电话号码
			// 添加地址
			AddrDao addrDao = new AddrDaoImpl();
			addrDao.addAddress(name, province, city, street, postcode, telway, user.getUserId());
			// 遍历购物车信息
			CartDao cartDao = new CartDaoImpl();
			ArrayList<Cart> cartInfo = cartDao.getCartInfo(user);
			// 遍历用户地址信息
			ArrayList<Addr> addrList = addrDao.queryAllAddressByUser(user);
			req.getSession().setAttribute("addrList", addrList);
			req.getSession().setAttribute("cartInfo", cartInfo);
			// 添加完成后跳转到选择地址页面
			resp.sendRedirect(path + "/emptionprocess/useraddress.jsp");
		} else {
			// 如果用户没有登录则到登录页面
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}

	// 选择地址页面 选择完成后跳转到订单支付页面
	@Override
	public void choiceAddr(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		String addr = req.getParameter("addr");
		User jspuser = (User) req.getSession().getAttribute("user");
		if (jspuser != null) {
			// 如果已选择收货地址则到订单支付页面
			if (addr != null) {
				UserDao userDao = new UserDaoImpl();
				User user = userDao.getUser(jspuser.getUserName());
				// 用户选择地址后则跳转到订单支付页面
				CartDao cartDao = new CartDaoImpl();
				ArrayList<Cart> cartInfo = cartDao.getCartInfo(user);
				if (cartInfo != null && cartInfo.size() > 0) {
					// 先查看该用户下是否有未支付订单
					// 如果有则跳转到订单支付页面,将订单信息发过去
					resp.sendRedirect(path + "/emptionprocess/payorder.jsp");
				} else {// 如果该用户购物车没有未支付订单则跳转到购物车页面
					resp.sendRedirect(path + "/emptionprocess/emptycart.jsp");
				}
			} else {// 如果该用户还没有收货地址 则跳转到添加地址页面
				resp.sendRedirect(path + "/emptionprocess/addaddress.jsp");
			}
		} else {
			// 如果用户没有登录则到登录页面
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}
}
