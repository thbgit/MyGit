package com.hc.revolves.serviceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hc.revolves.bean.Goods;
import com.hc.revolves.dao.GoodsDao;
import com.hc.revolves.dao.impl.GoodsDaoImpl;
import com.hc.revolves.service.GoodsService;

/**
 * 商品功能实现类
 * 
 * @author Administrator
 *
 */
public class GoodsServiceImpl implements GoodsService {

	// 搜索功能
	@Override
	public void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchtext = req.getParameter("searchtext");
		GoodsDao goodsDao = new GoodsDaoImpl();
		String path = req.getContextPath();
		if (searchtext != "") {
			// 第一次进入页面时设置的当前页
			int page = 1;
			String pageIndex = req.getParameter("pageIndex");
			if (pageIndex != null) {
				page = Integer.parseInt(pageIndex);
			}
			// 每页显示条数
			int rowNum = 12;
			// 模糊查询出来的商品信息总条数
			int totalGoodsNum = goodsDao.getsearchGoods(searchtext);
			// 开始值
			int begin = (page - 1) * rowNum + 1;
			// 结束值
			int end = page * rowNum;
			// 总页数
			int pageCount = totalGoodsNum % rowNum == 0 ? totalGoodsNum / rowNum : totalGoodsNum / rowNum + 1;
			// 上一页
			int pre = page == 1 ? 1 : page - 1;
			// 下一页
			int next = page == pageCount ? pageCount : page + 1;
			// 查询指定商品分页数据
			// ArrayList<Goods> GoodsList = goodsDao.getGoodsPaging(classid,
			// begin,
			// end);
			// req.getSession().setAttribute("GoodsList", GoodsList);
			// 获取所有商品信息
			// GoodsDao dao = new GoodsDaoImpl();
			ArrayList<Goods> searchgoods = goodsDao.search(searchtext, begin, end);
			req.getSession().setAttribute("totalGoodsNum", totalGoodsNum);
			req.getSession().setAttribute("pageCount", pageCount);
			req.getSession().setAttribute("pre", pre);
			req.getSession().setAttribute("next", next);
			req.getSession().setAttribute("searchtext", searchtext);
			// 交给前台jsp进行展示
			req.getSession().setAttribute("searchgoods", searchgoods);
			resp.sendRedirect(path + "/goods/searchgoods.jsp");
		} else {
			resp.sendRedirect(path + "/index.jsp");
		}
	}

	// 分页功能
	@Override
	public void selectGoods(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();

		String classid = req.getParameter("classid");
		// 第一次进入页面时设置的当前页
		int page = 1;
		String pageIndex = req.getParameter("pageIndex");
		if (pageIndex != null) {
			page = Integer.parseInt(pageIndex);
		}
		// 每页显示条数
		int rowNum = 3;
		GoodsDao goodsDao = new GoodsDaoImpl();
		// 查询出来的商品信息总条数
		int totalGoodsNum = goodsDao.getGoodsClass(classid);
		// 开始值
		int begin = (page - 1) * rowNum + 1;
		// 结束值
		int end = page * rowNum;
		// 总页数
		int pageCount = totalGoodsNum % rowNum == 0 ? totalGoodsNum / rowNum : totalGoodsNum / rowNum + 1;
		// 上一页
		int pre = page == 1 ? 1 : page - 1;
		// 下一页
		int next = page == pageCount ? pageCount : page + 1;
		// 查询指定商品分页数据
		ArrayList<Goods> GoodsList = goodsDao.getGoodsPaging(classid, begin, end);
		req.getSession().setAttribute("GoodsList", GoodsList);
		req.getSession().setAttribute("totalGoodsNum", totalGoodsNum);
		req.getSession().setAttribute("pageCount", pageCount);
		req.getSession().setAttribute("classid", classid);
		req.getSession().setAttribute("pre", pre);
		req.getSession().setAttribute("next", next);
		// 跳转
		if ("1".equals(classid)) {
			resp.sendRedirect(path + "/goods/goods.jsp");
		} else if ("2".equals(classid)) {
			resp.sendRedirect(path + "/goods/goodsman.jsp");
		} else {
			resp.sendRedirect(path + "/goods/searchgoods.jsp");
		}
	}

	// 所有商品信息
	@Override
	public void selectAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		// 第一次进入页面时设置的当前页
		int page = 1;
		String pageIndex = req.getParameter("pageIndex");
		if (pageIndex != null) {
			page = Integer.parseInt(pageIndex);
		}
		// 每页显示条数
		int rowNum = 12;
		GoodsDao goodsDao = new GoodsDaoImpl();
		// 查询出来的商品信息总条数
		int totalGoodsNum = goodsDao.getAllGoods();
		// 开始值
		int begin = (page - 1) * rowNum + 1;
		// 结束值
		int end = page * rowNum;
		// 总页数
		int pageCount = totalGoodsNum % rowNum == 0 ? totalGoodsNum / rowNum : totalGoodsNum / rowNum + 1;
		// 上一页
		int pre = page == 1 ? 1 : page - 1;
		// 下一页
		int next = page == pageCount ? pageCount : page + 1;
		// 查询指定商品分页数据
		// ArrayList<Goods> GoodsList = goodsDao.getGoodsPaging(classid, begin,
		// end);
		// req.getSession().setAttribute("GoodsList", GoodsList);
		// 获取所有商品信息
		// GoodsDao dao = new GoodsDaoImpl();
		Map<String, Goods> allGoods = goodsDao.selectGoods(begin, end);
		req.getSession().setAttribute("totalGoodsNum", totalGoodsNum);
		req.getSession().setAttribute("pageCount", pageCount);
		req.getSession().setAttribute("pre", pre);
		req.getSession().setAttribute("next", next);

		// 交给前台jsp进行展示
		req.getSession().setAttribute("allGoods", allGoods);

		resp.sendRedirect(path + "/goods/allgoods.jsp");
	}

	// 商品详细信息
	@Override
	public void selectDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		// 查看某个具体商品的ID
		String gid = req.getParameter("gid");
		GoodsDao goodsDao = new GoodsDaoImpl();
		Goods goods = goodsDao.getGoods(Integer.parseInt(gid));
		String ids = "";
		// 1.先查看cookie
		Cookie[] cookies = req.getCookies();
		Cookie findCookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				String name = cookies[i].getName();
				if ("last".equals(name)) {
					findCookie = cookies[i];
					break;
				}
			}
			// 2.处理ids
			if (findCookie != null) {// 已经存有记录
				// 难点
				String value = findCookie.getValue();// 3#2#1#
				String[] str = value.split("#");
				StringBuffer buffer = new StringBuffer();
				buffer.append(gid + "#");
				for (int i = 0; i < str.length; i++) {// 只保留四个最新商品？扩展
					String oldid = str[i];
					if (!oldid.equals(gid)) {// 如果旧的id和新的id一致，则不拼接旧的id
						buffer.append(oldid + "#");
					}
				}
				ids = buffer.toString();
				// 去掉最后一个#号
				ids = ids.substring(0, ids.length() - 1);

			} else {// 第一次,直接保存id
				ids = gid;
			}
		}
		// 3.发送cookie,cookie的信息长度和数量有限的
		findCookie = new Cookie("last", ids);
		resp.addCookie(findCookie);
		// 交给前台jsp进行展示
		req.getSession().setAttribute("goods", goods);
		resp.sendRedirect(path + "/goods/goodsdetails.jsp");
	}

	// 浏览记录功能
	@Override
	public void record(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		GoodsDao goodsDao = new GoodsDaoImpl();
		// 4.查看cookie
		Cookie[] cookies = req.getCookies();
		Cookie findCookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				String name = cookies[i].getName();
				if ("last".equals(name)) {
					findCookie = cookies[i];
					break;
				}
			}
			// 3.处理ids
			ArrayList<Goods> glist = new ArrayList();
			if (findCookie != null) {// 遍历cookie
				String value = findCookie.getValue();
				String[] str = value.split("#");
				for (int i = 0; i < str.length; i++) {
					String goodsid = str[i];
					Goods goods = goodsDao.getGoods(Integer.parseInt(goodsid));
					glist.add(goods);
				}
			}
			req.getSession().setAttribute("glist", glist);
		}
		// 3.发送cookie,cookie的信息长度和数量有限的
		resp.sendRedirect(path + "/goods/allgoods.jsp");
	}

}
