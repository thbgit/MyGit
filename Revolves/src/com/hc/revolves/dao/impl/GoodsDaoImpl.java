package com.hc.revolves.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import com.hc.revolves.bean.Goods;
import com.hc.revolves.dao.GoodsDao;
import com.hc.revolves.util.DBUtil;

public class GoodsDaoImpl implements GoodsDao {

	// 查询所有商品信息总条数
	@Override
	public int getAllGoods() {
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		String sql = "select count(*) from tb_goods";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

	// 查询指定类别商品信息总条数
	@Override
	public int getGoodsClass(String id) {
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		String sql = "select count(*) from tb_goods where type=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

	// 分页功能
	public ArrayList<Goods> getGoodsPaging(String type, int begin, int end) {
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		String sql = "select * from (select s.*,rownum n from (select goodsid,cname,ename,price,descri,imgurl from tb_goods where type=?) s where rownum<=?) where n>=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		ArrayList<Goods> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setInt(2, end);
			pstmt.setInt(3, begin);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsid"));
				goods.setCname(rs.getString("cname"));
				goods.setEname(rs.getString("ename"));
				goods.setPrice(rs.getInt("price"));
				goods.setDescri(rs.getString("descri"));
				goods.setImgurl(rs.getString("imgurl"));
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}

		return list;

	}

	// 查询数据库里的商品信息
	@Override
	public Map<String, Goods> selectGoods(int begin, int end) {
		Map<String, Goods> goodsMap = new LinkedHashMap<String, Goods>();
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		String sql = "select * from (select s.*,rownum n from (select goodsid,cname,ename,price,descri,imgurl from tb_goods) s where rownum<=?) where n>=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, begin);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsid"));
				goods.setCname(rs.getString("cname"));
				goods.setEname(rs.getString("ename"));
				goods.setPrice(rs.getInt("price"));
				goods.setDescri(rs.getString("descri"));
				goods.setImgurl(rs.getString("imgurl"));
				goodsMap.put(String.valueOf(goods.getGoodsId()), goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return goodsMap;

	}

	@Override
	public Goods getGoods(int id) {
		// 获取一个数据库链接
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中指定商品信息
		String sql = "select * from tb_goods where goodsid=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsid"));
				goods.setCname(rs.getString("cname"));
				goods.setEname(rs.getString("ename"));
				goods.setPrice(rs.getInt("price"));
				goods.setDescri(rs.getString("descri"));
				goods.setSpec(rs.getInt("spec"));
				return goods;
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

	// 搜索功能 查询搜索关键字相关的所有商品信息
	@Override
	public ArrayList<Goods> search(String str, int begin, int end) {
		ArrayList<Goods> list = new ArrayList();
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中指定商品信息
		String sql = "select * from (select s.*,rownum n from (select goodsid,cname,ename,price,descri,imgurl from tb_goods where ename like ? or cname like ? or xtype like ? or price like ? or brand like ? or filed like ? or spec like ? or prev like ? or centre like ? or back like ? or descri like ?) s where rownum<=?) where n>=?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + str + "%");
			pstmt.setString(2, "%" + str + "%");
			pstmt.setString(3, "%" + str + "%");
			pstmt.setString(4, "%" + str + "%");
			pstmt.setString(5, "%" + str + "%");
			pstmt.setString(6, "%" + str + "%");
			pstmt.setString(7, "%" + str + "%");
			pstmt.setString(8, "%" + str + "%");
			pstmt.setString(9, "%" + str + "%");
			pstmt.setString(10, "%" + str + "%");
			pstmt.setString(11, "%" + str + "%");
			pstmt.setInt(12, end);
			pstmt.setInt(13, begin);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Goods goods = new Goods();
				goods.setGoodsId(rs.getInt("goodsId"));
				goods.setCname(rs.getString("cname"));
				goods.setEname(rs.getString("ename"));
				goods.setPrice(rs.getInt("price"));
				goods.setDescri(rs.getString("descri"));
				goods.setImgurl(rs.getString("imgurl"));
				list.add(goods);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return list;
	}

	// 搜索功能 查询搜索关键字相关的所有商品总条数
	@Override
	public int getsearchGoods(String str) {
		Connection conn = DBUtil.getConnection();
		// 数据库查询语句 查询数据库中所有商品信息
		String sql = "select count(*) from tb_goods where ename like ? or cname like ? or xtype like ? or price like ? or brand like ? or filed like ? or spec like ? or prev like ? or centre like ? or back like ? or descri like ?";
		// 预处理对象
		PreparedStatement pstmt = null;
		// 处理后的结果集
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + str + "%");
			pstmt.setString(2, "%" + str + "%");
			pstmt.setString(3, "%" + str + "%");
			pstmt.setString(4, "%" + str + "%");
			pstmt.setString(5, "%" + str + "%");
			pstmt.setString(6, "%" + str + "%");
			pstmt.setString(7, "%" + str + "%");
			pstmt.setString(8, "%" + str + "%");
			pstmt.setString(9, "%" + str + "%");
			pstmt.setString(10, "%" + str + "%");
			pstmt.setString(11, "%" + str + "%");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 关闭资源
			DBUtil.closeResource(conn, null, pstmt, rs);
		}
		return 0;
	}

}
