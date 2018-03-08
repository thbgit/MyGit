package com.hc.revolves.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hc.revolves.bean.User;
import com.hc.revolves.dao.UserDao;
import com.hc.revolves.util.DBUtil;

/**
 * 链接数据库,servlet所对应的功能对数据库的操作
 * 
 * @author Mr 唐
 *
 */
public class UserDaoImpl implements UserDao {

	@Override
	public User getUser(String username) {
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		String sql = "select * from tb_user where username=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		try {
			User user = new User();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setUserName(rs.getString("username"));
				user.setUserId(rs.getInt("userId"));
				return user;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return null;

	}

	// 用户登录
	@Override
	public User userLogin(User user) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		String sql = "select username,password,userid,name,sex,telnum,balance,status,identity from tb_user where username=? and password=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setUserId(rs.getInt("userid"));
				user.setUserName(rs.getString("username"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setTelNum(rs.getString("telnum"));
				user.setBalance(rs.getInt("balance"));
				user.setStatus(rs.getInt("status"));
				user.setIdentity(rs.getInt("identity"));
				return user;
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return null;
	}

	// 注册时 查询单个用户是否存在 存在时则提示该用户已存在
	@Override
	public boolean userJudge(User user) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		String sql = "select username from tb_user where username=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 处理后的结果集
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 如果存在 返回一个true
				return true;
			} else {
				// 如果不存在返回false
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
		return false;
	}

	// 注册
	@Override
	public boolean userRegister(User user) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		// String sql = "insert into revolves_usertab
		// values(revolves_seq.nextval,?,?,?,'y')";
		String sql = "insert into tb_user values(seq_tb_user.nextval,?,?,'','','',?,'email',10000,to_date('1991-12-2','yyyy-MM-dd'),'','','',1,1)";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getTelNum());
			int result = pstmt.executeUpdate();
			if (result > 0) {
				return true;
			} else {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
		return false;
	}

	// 修改用户余额
	@Override
	public void updateUserbalance(User user, int balance) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中是否存在该用户
		// 更新该用户订单状态，账户余额，发货状态等
		String sql = "update tb_user u set u.balance=? where u.userid=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, balance);
			pstmt.setInt(2, user.getUserId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, null);
		}
	}
}
