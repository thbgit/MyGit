package com.hc.revolves.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hc.revolves.bean.Cart;
import com.hc.revolves.bean.Goods;
import com.hc.revolves.bean.User;
import com.hc.revolves.dao.CartDao;
import com.hc.revolves.util.DBUtil;

public class CartDaoImpl implements CartDao {

	// 查询指定用户的购物车数量
	@Override
	public int selectCartCountByUser(User user) {
		Connection conn = DBUtil.getConnection();
		// 查询该用户下未支付的购物车里的商品信息
		String sql = "select count(*) from tb_indext where userid=? and pay=0";
		// 预处理对象
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

	// 更新用户购物车信息
	@Override
	public void updateCartByUser(User user, int quantity, Goods goods) {
		Connection conn = DBUtil.getConnection();
		// 商品状态 字段pay 0代表未支付状态,1代表已支付
		String sql = "update tb_indext cart set cart.num=? where userid=? and goodsid=? and pay=0";
		// 预处理对象
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, quantity);
			pstmt.setInt(2, user.getUserId());
			pstmt.setInt(3, goods.getGoodsId());
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}

	}

	// 查询指定用户下的购物车 指定商品数量
	@Override
	public int selectCartByUser(User user, int goodsid) {
		Connection conn = DBUtil.getConnection();
		// 查询该用户下未支付的购物车里的商品信息
		String sql = "select * from tb_indext where userid=? and goodsid=? and pay=0";
		// 预处理对象
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			pstmt.setInt(2, goodsid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("num");
			} else {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

	// 查询指定用户下的购物车 所有未付款的商品总价
	@Override
	public int selectTotalPriceByUser(User user) {
		Connection conn = DBUtil.getConnection();
		// 查询该用户下未支付的购物车里的商品信息
		String sql = "select sum(i.num*g.price) from tb_indext i,tb_goods g where userid=? and i.pay=0 and i.goodsid=g.goodsid";
		// 预处理对象
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

	// 删除功能
	@Override
	public void deleteGoods(User user, Goods goods) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete tb_indext where userid=? and goodsid=? and pay=0";
		// 预处理对象
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			pstmt.setInt(2, goods.getGoodsId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
	}

	// 在购物车表中插入数据
	@Override
	public void insertCart(User user, Goods goods, int quantity) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		// 需要订单id 用户id 订单状态, buydate购买时间,商品id,商品数量,收藏,付款,发货状态,收货地址
		String sql = "insert into tb_indext values(seq_tb_indext.nextval,?,0,to_date('2018-01-01','yyyy-MM-dd'),?,?,?,0,0,0)";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			pstmt.setInt(2, goods.getGoodsId());// 商品id
			pstmt.setInt(3, quantity);// 商品数量
			pstmt.setInt(4, 0);// 收藏
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}

	}

	// 查询购物车所有商品
	@Override
	public ArrayList<Cart> getCartInfo(User user) {
		ArrayList<Cart> cartList = new ArrayList();
		int productid = user.getUserId();
		// 获取数据库连接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		// String sql2 = "select * from tb_indext where userid=?";
		String sql = "select t.* ,g.*  from tb_indext t,tb_goods g where t.goodsid=g.goodsid and t.userid=? and t.pay=0";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, productid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Cart cart = new Cart();
				cart.setIndextId(rs.getInt("indextid"));// 购物车id
				cart.setGoodsId(rs.getInt("goodsid"));// 商品id
				cart.setStatus(rs.getInt("status"));// 购物车状态
				cart.setUserId(rs.getInt("userId"));// 用户id
				cart.setNum(rs.getInt("num"));// 商品数量
				cart.setCollect(rs.getInt("collect"));// 收藏
				cart.setPay(rs.getInt("pay"));// 是否支付
				cart.setShipments(rs.getInt("shipments"));// 发货状态
				cart.setAddrid(rs.getInt("addrid"));// 收货地址
				cartList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return cartList;
	}

	// 确认支付功能
	@Override
	public void confirmpayment(User user, int goodsId) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		// 更新该用户订单状态，账户余额，发货状态等
		String sql = "update tb_indext i set i.pay=1 where i.userid=? and i.goodsid=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			pstmt.setInt(2, goodsId);// 商品id
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
	}

}
