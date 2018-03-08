package com.hc.revolves.dao;

import java.util.ArrayList;
import java.util.Map;

import com.hc.revolves.bean.Goods;

public interface GoodsDao {

	/**
	 * 查询所有商品信息
	 * 
	 * @param begin
	 * @param end
	 * @return 返回所有商品到map里面
	 */
	Map<String, Goods> selectGoods(int begin, int end);

	/**
	 * 查询指定商品信息
	 * 
	 * @param id
	 * @return 返回指定id商品
	 */
	Goods getGoods(int id);

	/**
	 * 搜索功能
	 * 
	 * @param str
	 * @param begin
	 * @param end
	 * @return 返回指定搜索字段的所有商品信息
	 */
	ArrayList<Goods> search(String str, int begin, int end);

	/**
	 * 模糊查询指定商品总条数
	 * 
	 * @param str
	 * @return 返回指定商品信息总条数
	 */
	int getsearchGoods(String str);

	/**
	 * 查询指定类别商品信息的数量
	 * 
	 * @param id
	 * @return 返回指定类别商品信息的条数
	 */
	int getGoodsClass(String id);

	//
	/**
	 * 查询指定类别商品信息的条数
	 * 
	 * @return 返回指定类别商品信息的条数
	 */
	int getAllGoods();

	/**
	 * 根据商品类别查询商品信息
	 * 
	 * @param type
	 * @param begin
	 * @param end
	 * @return 返回指定商品的信息
	 */
	ArrayList<Goods> getGoodsPaging(String type, int begin, int end);
}
