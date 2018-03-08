package com.hc.revolves.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 数据库链接工具类
 *
 */
public class DBUtil {
	private static String username;
	private static String password;
	private static String url;
	private static String driver;

	// 注册驱动
	static {
		getProperties();
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取配置文件db_oracle.properties中的信息 驱动， oracled url，用户名密码
	 */
	public static void getProperties() {
		Properties properties = new Properties();
		String path = DBUtil.class.getClassLoader().getResource("db_oracle.properties").getPath();
		// DBUtil.class.getResourceAsStream("db_oracle.properties");
		File file = new File(path);
		InputStream in = null;
		// System.out.println(file.exists() + "---" + path);
		try {
			in = new FileInputStream(file);
			properties.load(in);
			username = properties.getProperty("username");
			password = properties.getProperty("password");
			url = properties.getProperty("url");
			driver = properties.getProperty("driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库链接
	 * 
	 * @return 返回一个链接
	 */
	public static Connection getConnection() {
		// getProperties();
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	/**
	 * 关闭资源
	 * 
	 * @param conn
	 * @param stmt
	 * @param pstmt
	 * @param rs
	 */
	public static void closeResource(Connection conn, Statement stmt, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (conn != null) {
				conn.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
