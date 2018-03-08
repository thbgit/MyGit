package com.hc.revolves.dao;

import java.util.ArrayList;

import com.hc.revolves.bean.Cart;
import com.hc.revolves.bean.Goods;
import com.hc.revolves.bean.User;

/**
 * 购物车功能类
 * 
 * @author haibin
 *
 */
public interface CartDao {
	/**
	 * 获取购物车所有商品
	 * 
	 * @param user
	 * @return 返回所有商品信息
	 */
	ArrayList<Cart> getCartInfo(User user);

	/**
	 * 购物车中添加商品功能
	 * 
	 * @param user
	 * @param goods
	 * @param quantity
	 */
	void insertCart(User user, Goods goods, int quantity);

	/**
	 * 删除购物车中的商品信息
	 * 
	 * @param user
	 * @param goods
	 */
	void deleteGoods(User user, Goods goods);

	/**
	 * 查询指定用户下的购物车 指定商品数量
	 * 
	 * @param user
	 * @param goodsid
	 * @return 返回购物车商品数量
	 */
	int selectCartByUser(User user, int goodsid);

	/**
	 * 更新指定用户的购物车信息
	 * 
	 * @param user
	 * @param quantity
	 * @param goods
	 */
	void updateCartByUser(User user, int quantity, Goods goods);

	/**
	 * 查询指定用户的购物车数量
	 * 
	 * @param user
	 * @return 返回购物的数量
	 */
	int selectCartCountByUser(User user);

	/**
	 * 查询指定用户的所有商品数量
	 * 
	 * @param user
	 * @return 返回用户所有商品数量
	 */
	int selectTotalPriceByUser(User user);

	/**
	 * 确认支付，更新用户账户信息
	 * 
	 * @param user
	 * @param goods
	 */
	void confirmpayment(User user, int goodsId);
}
