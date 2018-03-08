package com.hc.revolves.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hc.revolves.bean.Addr;
import com.hc.revolves.bean.User;
import com.hc.revolves.dao.AddrDao;
import com.hc.revolves.util.DBUtil;

public class AddrDaoImpl implements AddrDao {

	// 添加用户地址
	@Override
	public void addAddress(String name, String province, String city, String street, String postcode, String telway,
			int userId) {
		Connection conn = DBUtil.getConnection();
		// 姓名，省份，市县，街道，邮编，电话，用户id
		String sql = "insert into tb_addr values(seq_tb_addr.nextval,?,?,?,?,?,?,?)";
		// 预处理对象
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, province);
			pstmt.setString(3, city);
			pstmt.setString(4, street);
			pstmt.setString(5, postcode);
			pstmt.setString(6, telway);
			pstmt.setInt(7, userId);
			pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
	}

	// 查询指定用户下的所有地址
	@Override
	public ArrayList<Addr> queryAllAddressByUser(User user) {
		ArrayList<Addr> list = new ArrayList();
		Connection conn = DBUtil.getConnection();
		String sql = "select * from tb_addr where userid=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Addr addr = new Addr();
				addr.setAddrid(rs.getInt("addrid"));// 收货人姓名
				addr.setAddr1(rs.getString("addr1"));// 收货人姓名
				addr.setAddr2(rs.getString("addr2"));// 收货人姓名
				addr.setAddr3(rs.getString("addr3"));// 收货人姓名
				addr.setAddr4(rs.getString("addr4"));// 收货人姓名
				addr.setCode(rs.getString("code"));// 收货人姓名
				addr.setTelnum(rs.getString("telnum"));// 收货人姓名
				addr.setUserid(rs.getInt("userid"));// 收货人姓名
				list.add(addr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return list;
	}

	// 查询该用户是否已经存在地址
	public boolean queryAddressByUser(User user) {
		Connection conn = DBUtil.getConnection();
		// 查询该用户下未支付的购物车里的商品信息
		String sql = "select * from tb_addr where userid=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user.getUserId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return false;
	}

}
