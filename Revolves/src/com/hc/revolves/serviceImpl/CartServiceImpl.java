package com.hc.revolves.serviceImpl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hc.revolves.bean.Addr;
import com.hc.revolves.bean.Cart;
import com.hc.revolves.bean.Goods;
import com.hc.revolves.bean.User;
import com.hc.revolves.dao.AddrDao;
import com.hc.revolves.dao.CartDao;
import com.hc.revolves.dao.GoodsDao;
import com.hc.revolves.dao.UserDao;
import com.hc.revolves.dao.impl.AddrDaoImpl;
import com.hc.revolves.dao.impl.CartDaoImpl;
import com.hc.revolves.dao.impl.GoodsDaoImpl;
import com.hc.revolves.dao.impl.UserDaoImpl;
import com.hc.revolves.service.CartService;

public class CartServiceImpl implements CartService {

	// 支付功能，更改购物车商品的支付状态
	public void confirmpayment(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		ArrayList<Cart> cartInfo = (ArrayList<Cart>) req.getSession().getAttribute("cartInfo");
		User user = (User) req.getSession().getAttribute("user");
		int totalPrice = (int) req.getSession().getAttribute("totalPrice");
		// 如果用户余额大于商品总价 则支付成功 否则跳转到充值页面
		// 判断用户余额与订单金额，如果余额不足则到个人中心充值页面，如果余额充足则到支付成功页面
		if (user.getBalance() > totalPrice) {
			int balance = user.getBalance() - totalPrice;
			UserDao userDao = new UserDaoImpl();
			CartDao cartDao = new CartDaoImpl();
			// 执行更新用户余额和购物车商品状态
			for (Cart cart : cartInfo) {
				cartDao.confirmpayment(user, cart.getGoodsId());
			}

			userDao.updateUserbalance(user, balance);
			resp.sendRedirect(path + "/emptionprocess/paysuccess.jsp");
		} else {// 否则跳转到充值页面
			resp.sendRedirect(path + "/mycore/unindext.jsp");
		}
	}

	// 查询功能
	public void queryCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		// 获取商品id
		String cont = req.getParameter("continue");
		// 获取用户
		User jspuser = (User) req.getSession().getAttribute("user");
		if (jspuser != null) {
			UserDao userDao = new UserDaoImpl();
			User user = userDao.getUser(jspuser.getUserName());
			GoodsDao goodsDao = new GoodsDaoImpl();
			// 根据用户名和商品 获取到该用户的购物车信息
			CartDao cartDao = new CartDaoImpl();
			ArrayList<Cart> cartInfo = cartDao.getCartInfo(user);

			int cartCount = cartDao.selectCartCountByUser(user);
			int totalPrice = cartDao.selectTotalPriceByUser(user);
			ArrayList<Goods> goodslist = new ArrayList();
			Goods querygoods = null;
			for (Cart cart : cartInfo) {
				Integer goodsId = cart.getGoodsId();
				querygoods = goodsDao.getGoods(goodsId);
				goodslist.add(querygoods);
			}
			req.getSession().setAttribute("cartCount", cartCount);
			req.getSession().setAttribute("querygoods", querygoods);
			req.getSession().setAttribute("cartInfo", cartInfo);
			req.getSession().setAttribute("totalPrice", totalPrice);
			req.getSession().setAttribute("goodslist", goodslist);
			if ("继续购物".equals(cont)) {
				req.getSession().setAttribute("cartCount", cartCount);
				resp.sendRedirect(path + "/index.jsp");
			} else {
				resp.sendRedirect(path + "/emptionprocess/emptycart.jsp");
			}
		} else {
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}

	// 删除功能
	public void deleteGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		// 获取商品id
		String gid = req.getParameter("gid");
		GoodsDao goodsDao = new GoodsDaoImpl();
		Goods goods = goodsDao.getGoods(Integer.parseInt(gid));
		// 获取用户
		String username = req.getParameter("username");
		UserDao userDao = new UserDaoImpl();
		User user = userDao.getUser(username);
		// 根据用户名和商品 获取到该用户的购物车信息
		CartDao cartDao = new CartDaoImpl();
		cartDao.deleteGoods(user, goods);
		int cartCount = cartDao.selectCartCountByUser(user);
		int totalPrice = cartDao.selectTotalPriceByUser(user);
		ArrayList<Cart> cartInfo = cartDao.getCartInfo(user);
		req.getSession().setAttribute("cartInfo", cartInfo);
		req.getSession().setAttribute("cartCount", cartCount);
		req.getSession().setAttribute("totalPrice", totalPrice);
		resp.sendRedirect(path + "/emptionprocess/emptycart.jsp");
	}

	// 获取时间
	public String getTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		String time = format.format(date);
		return time;
	}

	// 购物车功能 包括直接插入新的购物车信息和只更新已存在的购物车信息 插入后再查询
	@Override
	public void addtocart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		String standard = req.getParameter("standard");
		String pay = req.getParameter("pay");

		// 判断是否登录，如果没有登录应该先登录，
		User olduser = (User) req.getSession().getAttribute("user");
		UserDao userDao = new UserDaoImpl();
		// 商品页传过来的商品id 先查询改用户购物车中是否已经存在该商品 如果已经存在则将原有的商品数量增加 否则插入新的商品
		String id = req.getParameter("id");
		// 先查询改用户下的购物车 quantity前台传过来的商品数量
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		GoodsDao goodsDao = new GoodsDaoImpl();

		if (id != "") {
			Goods goods = goodsDao.getGoods(Integer.parseInt(id));
			CartDao cartDao = new CartDaoImpl();
			// 如果用户已经登录 则在该用户的购物车表下面插入一条购物车信息
			if (olduser != null) {
				User user = userDao.getUser(olduser.getUserName());
				if ("立即购买".equals(pay)) {
					// 如果点击立即购买则跳转到选择地址页面,将该商品信息传过去
					// 先查询改用户是否已经存在地址

					AddrDao addrDao = new AddrDaoImpl();
					boolean hasAddr = addrDao.queryAddressByUser(user);
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
					req.getSession().setAttribute("quantity", quantity);
					req.getSession().setAttribute("singlegoods", goods);
				} else if ("加入购物袋".equals(pay)) {
					// 加入购物袋则跳转到购物车页面
					// 先查询改用户购物车中是否已经存在该商品 根据用户id和商品id 以及购物车状态来查询 返回结果为商品原先的数量
					int oldquantity = cartDao.selectCartByUser(user, Integer.parseInt(id));
					// 如果返回结果大于0则证明该用户购物车中已经存在该商品 则在原有的商品数量上增加即可(执行更新)
					if (oldquantity > 0) {
						cartDao.updateCartByUser(user, oldquantity + quantity, goods);
					} else {// 否则执行插入
						cartDao.insertCart(user, goods, quantity);
					}
					ArrayList<Cart> cartInfo = cartDao.getCartInfo(user);
					ArrayList<Goods> goodslist = new ArrayList();
					Goods querygoods = null;
					for (Cart cart : cartInfo) {
						Integer goodsId = cart.getGoodsId();
						querygoods = goodsDao.getGoods(goodsId);
						goodslist.add(querygoods);
					}
					int cartCount = cartDao.selectCartCountByUser(user);
					int totalPrice = cartDao.selectTotalPriceByUser(user);
					req.getSession().setAttribute("cartCount", cartCount);
					req.getSession().setAttribute("cartInfo", cartInfo);
					req.getSession().setAttribute("standard", standard);
					req.getSession().setAttribute("totalPrice", totalPrice);
					req.getSession().setAttribute("querygoods", querygoods);
					req.getSession().setAttribute("goodslist", goodslist);
					// 重定向到购物车
					resp.sendRedirect(path + "/emptionprocess/emptycart.jsp");

				} else {// 如果用户名为空 则跳转到登录页面
					req.getSession().setAttribute("id", id);
					resp.sendRedirect(path + "/register/register.jsp");
				}
			}
		} else {
			req.getSession().setAttribute("id", id);
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}

}
