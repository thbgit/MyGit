package com.hc.revolves.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;

/**
 * 监听器监听用户是否重复登录
 * 
 * @author Administrator
 *
 */
public class UserLoginListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		//

	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		// 当前应用加载时，创建一个Map集合，用来保存session
		Map<String, HttpSession> map = new HashMap<String, HttpSession>();
		event.getServletContext().setAttribute("map", map);
	}

}
