package com.hc.revolves.dao;

import java.util.ArrayList;

import com.hc.revolves.bean.Addr;
import com.hc.revolves.bean.User;

/**
 * 选择地址功能
 * 
 * @author haibin
 *
 */
public interface AddrDao {
	/**
	 * 添加地址
	 * 
	 * @param name
	 * @param province
	 * @param city
	 * @param street
	 * @param postcode
	 * @param telway
	 * @param userId
	 */
	void addAddress(String name, String province, String city, String street, String postcode, String telway,
			int userId);

	/**
	 * 查询指定用户下的所有地址
	 * 
	 * @param user
	 * @return 返回改用户所有地址信息到集合里面
	 */
	ArrayList<Addr> queryAllAddressByUser(User user);

	/**
	 * 查询改用户是否已经有地址了
	 * 
	 * @param user
	 * @return 返回存在与否
	 */
	boolean queryAddressByUser(User user);

}
