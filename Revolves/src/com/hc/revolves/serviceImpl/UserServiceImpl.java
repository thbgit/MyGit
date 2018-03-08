package com.hc.revolves.serviceImpl;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hc.revolves.bean.User;
import com.hc.revolves.dao.UserDao;
import com.hc.revolves.dao.impl.UserDaoImpl;
import com.hc.revolves.service.UserService;

/**
 * 具体功能实现
 * 
 * @author Mr 唐
 *
 */
public class UserServiceImpl implements UserService {

	// 登录功能
	@Override
	public void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 获取应用根路径
		String path = req.getContextPath();

		// 获取前台表单数据
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		String ids = (String) req.getSession().getAttribute("id");
		// 调用dao链接数据库
		UserDao dao = new UserDaoImpl();
		// 新建用户 给用户设置用户名密码
		User user = new User();
		user.setUserName(username);
		user.setPassword(password);

		// 调用dao中的登录方法 查询数据库中是否存在该用户 获取返回值
		User newUser = dao.userLogin(user);
		boolean userJudge = dao.userJudge(user);
		// 判断返回的用户是否存在
		if (newUser != null) {

			// 登录时间
			String lastTime = "lastTime";
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				Cookie timeCookie1 = null;
				for (int i = 0; i < cookies.length; i++) {
					if (lastTime.equals(cookies[i].getName())) {
						timeCookie1 = cookies[i];
					}
					if (timeCookie1 == null) {
						String time1 = getTime();
						timeCookie1 = new Cookie(lastTime, time1);
						timeCookie1.setMaxAge(1000);
						resp.addCookie(timeCookie1);
					} else {
						String ips = timeCookie1.getName();
						String times = timeCookie1.getValue();
						timeCookie1.setMaxAge(1000);
						timeCookie1.setPath(path);
						resp.addCookie(timeCookie1);
					}
				}
			}
			// 防止用户重复登录利用监听器
			ServletContext context = req.getServletContext();
			Map<String, HttpSession> map = (Map<String, HttpSession>) context.getAttribute("map");
			HttpSession oldSession = map.get(newUser.getUserName());
			if (oldSession != null) {
				oldSession.invalidate();
			}
			HttpSession session = req.getSession();
			session.setAttribute("user", newUser);
			if (ids != null) {
				resp.sendRedirect(path + "/goods/goodsdetails.jsp?id=" + ids);
			} else {
				// 重定向 成功后跳转到成功登录页面,或者个人中心
				// req.getRequestDispatcher("/index.jsp").forward(req, resp);
				resp.sendRedirect(path + "/index.jsp");
			}
			// 创建域 将获取到的用户名发送给前端

		} else if (userJudge == false) {
			resp.sendRedirect(path + "/register/signin.jsp");
		} else {
			Cookie cookie1 = new Cookie("username1", username);
			Cookie cookie2 = new Cookie("password", password);
			cookie1.setMaxAge(3600 * 24);
			cookie2.setMaxAge(3600 * 24);
			resp.addCookie(cookie1);
			resp.addCookie(cookie2);
			// 重定向 失败后返回登录页面继续登录
			resp.sendRedirect(path + "/register/register.jsp");
		}
	}

	// 获取时间
	public String getTime() {
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd-HH:mm");
		String time = format.format(date);
		return time;
	}

	// 注册功能
	@Override
	public void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取应用的路径
		String path = req.getContextPath();
		// 获取前台表单数据
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String userTel = req.getParameter("telnum");
		String ver = req.getParameter("verfirst");
		String ver2 = (String) req.getSession().getAttribute("verimg1");
		if (!ver.equals(ver2)) {
			Cookie cookie1 = new Cookie("susername", username);
			Cookie cookie2 = new Cookie("stelnum", userTel);
			cookie1.setMaxAge(10);
			cookie2.setMaxAge(10);
			resp.addCookie(cookie1);
			resp.addCookie(cookie2);
			resp.sendRedirect(path + "/register/signin.jsp");
		} else {
			// 注册时 查询单个用户是否存在 存在时则提示该用户已存在
			UserDao dao = new UserDaoImpl();
			User user = new User();
			user.setUserName(username);
			user.setPassword(password);
			user.setTelNum(userTel);
			boolean userJudge = dao.userJudge(user);
			if (userJudge) {
				Cookie cookie1 = new Cookie("susername", username);
				Cookie cookie2 = new Cookie("stelnum", userTel);
				cookie1.setMaxAge(10);
				cookie2.setMaxAge(10);
				resp.addCookie(cookie1);
				resp.addCookie(cookie2);
				System.out.println("该用户已存在");
				req.setAttribute("newusername", username);
				resp.sendRedirect(path + "/register/signin.jsp");

			} else {
				// 防止重复提交
				try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				// 根据前台发来的随机数来判断是否重复提交
				String num = (String) req.getSession().getAttribute("num");
				String num2 = req.getParameter("reg");
				if (num != null && num2 != null && num.equals(num2)) {
					req.getSession().removeAttribute("num");
					System.out.println(username + "====该数据注册成功");
					// 调用dao处理前台数据
					boolean b = dao.userRegister(user);
					if (b == true) {
						// 如果注册成功,返回到首页或者登录页面 页面地址需要改变
						req.getSession().setAttribute("newusername", user.getUserName());
						resp.sendRedirect(path + "/register/signinsuccess.jsp");
					} else {

						// 如果失败,重新注册 页面url不需要改变
						req.getRequestDispatcher("/register/signin.jsp").forward(req, resp);
					}
				} else {
					req.getRequestDispatcher("/error.jsp").forward(req, resp);
				}
			}
		}
	}

	// 退出功能
	@Override
	public void quit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getContextPath();
		if (req.getSession(false) != null) {
			req.getSession(false).invalidate();
			resp.sendRedirect(path + "/index.jsp");
		}
	}

	// 验证码
	@Override
	public void ver(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int width = 137;
		int height = 46;
		BufferedImage bImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		// 获取图层上的Graphics对象，画布
		Graphics2D graphics = (Graphics2D) bImage.getGraphics();
		// 在画布上进行绘制：设置颜色形状内容
		graphics.setColor(new Color(75, 180, 167));
		graphics.fillRect(0, 0, width, height);
		// 绘制矩形边框:边框颜色，位置
		// 绘制干扰线
		graphics.setColor(Color.ORANGE);
		for (int i = 0; i < 5; i++) {// 干扰线的数量
			graphics.drawLine(getRandom(1, width - 1), getRandom(1, height - 1), getRandom(1, width - 1),
					getRandom(1, height - 1));// 坐标随机
			// 两点确定一线
		}
		// 内容偏移量
		int xpyl = 12;
		int ypyl = 30;
		// 设置验证码内容（中文，数字，字母。。。）
		// 常用文字
		// String base =
		// "\u7684\u4e00\u4e86\u662f\u6211\u4e0d\u5728\u4eba\u4eec\u6709\u6765\u4ed6\u8fd9\u4e0a\u7740\u4e2a\u5730\u5230\u5927\u91cc\u8bf4\u5c31\u53bb\u5b50\u5f97\u4e5f\u548c\u90a3\u8981\u4e0b\u770b\u5929\u65f6\u8fc7\u51fa\u5c0f\u4e48\u8d77\u4f60\u90fd\u628a\u597d\u8fd8\u591a\u6ca1\u4e3a\u53c8\u53ef\u5bb6\u5b66\u53ea\u4ee5\u4e3b\u4f1a\u6837\u5e74\u60f3\u751f\u540c\u8001\u4e2d\u5341\u4ece\u81ea\u9762\u524d\u5934\u9053\u5b83\u540e\u7136\u8d70\u5f88\u50cf\u89c1\u4e24\u7528\u5979\u56fd\u52a8\u8fdb\u6210\u56de\u4ec0\u8fb9\u4f5c\u5bf9\u5f00\u800c\u5df1\u4e9b\u73b0\u5c71\u6c11\u5019\u7ecf\u53d1\u5de5\u5411\u4e8b\u547d\u7ed9\u957f\u6c34\u51e0\u4e49\u4e09\u58f0\u4e8e\u9ad8\u624b\u77e5\u7406\u773c\u5fd7\u70b9\u5fc3\u6218\u4e8c\u95ee\u4f46\u8eab\u65b9\u5b9e\u5403\u505a\u53eb\u5f53\u4f4f\u542c\u9769\u6253\u5462\u771f\u5168\u624d\u56db\u5df2\u6240\u654c\u4e4b\u6700\u5149\u4ea7\u60c5\u8def\u5206\u603b\u6761\u767d\u8bdd\u4e1c\u5e2d\u6b21\u4eb2\u5982\u88ab\u82b1\u53e3\u653e\u513f\u5e38\u6c14\u4e94\u7b2c\u4f7f\u5199\u519b\u5427\u6587\u8fd0\u518d\u679c\u600e\u5b9a\u8bb8\u5feb\u660e\u884c\u56e0\u522b\u98de\u5916\u6811\u7269\u6d3b\u90e8\u95e8\u65e0\u5f80\u8239\u671b\u65b0\u5e26\u961f\u5148\u529b\u5b8c\u5374\u7ad9\u4ee3\u5458\u673a\u66f4\u4e5d\u60a8\u6bcf\u98ce\u7ea7\u8ddf\u7b11\u554a\u5b69\u4e07\u5c11\u76f4\u610f\u591c\u6bd4\u9636\u8fde\u8f66\u91cd\u4fbf\u6597\u9a6c\u54ea\u5316\u592a\u6307\u53d8\u793e\u4f3c\u58eb\u8005\u5e72\u77f3\u6ee1\u65e5\u51b3\u767e\u539f\u62ff\u7fa4\u7a76\u5404\u516d\u672c\u601d\u89e3\u7acb\u6cb3\u6751\u516b\u96be\u65e9\u8bba\u5417\u6839\u5171\u8ba9\u76f8\u7814\u4eca\u5176\u4e66\u5750\u63a5\u5e94\u5173\u4fe1\u89c9\u6b65\u53cd\u5904\u8bb0\u5c06\u5343\u627e\u4e89\u9886\u6216\u5e08\u7ed3\u5757\u8dd1\u8c01\u8349\u8d8a\u5b57\u52a0\u811a\u7d27\u7231\u7b49\u4e60\u9635\u6015\u6708\u9752\u534a\u706b\u6cd5\u9898\u5efa\u8d76\u4f4d\u5531\u6d77\u4e03\u5973\u4efb\u4ef6\u611f\u51c6\u5f20\u56e2\u5c4b\u79bb\u8272\u8138\u7247\u79d1\u5012\u775b\u5229\u4e16\u521a\u4e14\u7531\u9001\u5207\u661f\u5bfc\u665a\u8868\u591f\u6574\u8ba4\u54cd\u96ea\u6d41\u672a\u573a\u8be5\u5e76\u5e95\u6df1\u523b\u5e73\u4f1f\u5fd9\u63d0\u786e\u8fd1\u4eae\u8f7b\u8bb2\u519c\u53e4\u9ed1\u544a\u754c\u62c9\u540d\u5440\u571f\u6e05\u9633\u7167\u529e\u53f2\u6539\u5386\u8f6c\u753b\u9020\u5634\u6b64\u6cbb\u5317\u5fc5\u670d\u96e8\u7a7f\u5185\u8bc6\u9a8c\u4f20\u4e1a\u83dc\u722c\u7761\u5174\u5f62\u91cf\u54b1\u89c2\u82e6\u4f53\u4f17\u901a\u51b2\u5408\u7834\u53cb\u5ea6\u672f\u996d\u516c\u65c1\u623f\u6781\u5357\u67aa\u8bfb\u6c99\u5c81\u7ebf\u91ce\u575a\u7a7a\u6536\u7b97\u81f3\u653f\u57ce\u52b3\u843d\u94b1\u7279\u56f4\u5f1f\u80dc\u6559\u70ed\u5c55\u5305\u6b4c\u7c7b\u6e10\u5f3a\u6570\u4e61\u547c\u6027\u97f3\u7b54\u54e5\u9645\u65e7\u795e\u5ea7\u7ae0\u5e2e\u5566\u53d7\u7cfb\u4ee4\u8df3\u975e\u4f55\u725b\u53d6\u5165\u5cb8\u6562\u6389\u5ffd\u79cd\u88c5\u9876\u6025\u6797\u505c\u606f\u53e5\u533a\u8863\u822c\u62a5\u53f6\u538b\u6162\u53d4\u80cc\u7ec6";
		// 字母和数字
		String base = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		// 设置文字样式大小颜色等
		String fontName = "微软雅黑";
		int fontType = Font.BOLD;
		int fontBang = 24;// 字体大小：磅
		Font font = new Font(fontName, fontType, fontBang);
		graphics.setFont(font);
		String v = "";
		for (int i = 0; i < 4; i++) {
			Color c = new Color(getRandom(0, 255), getRandom(0, 255), getRandom(0, 255));
			graphics.setColor(c);// 随机颜色
			int angle = getRandom(-45, 45);// 偏移角度
			double theta = 1.0 * angle / 180 * Math.PI;// 偏移弧度
			graphics.rotate(theta, xpyl + (i * 30), ypyl);
			String value = base.charAt(getRandom(0, base.length() - 1)) + "";
			v += value;
			graphics.drawString(value, xpyl + (i * 30), ypyl);
			// 还原弧度
			double theta2 = 1.0 * -angle / 180 * Math.PI;
			graphics.rotate(theta2, xpyl + (i * 30), ypyl);
		}
		// 拖过ImageIO响应给客户端
		ImageIO.write(bImage, "jpg", resp.getOutputStream());
		// 通过域传递给另一个servlet
		HttpSession session = req.getSession();
		session.setAttribute("verimg1", v);
	}

	// 获取随机数
	public int getRandom(int start, int end) {
		Random ran = new Random();
		int random = ran.nextInt(end - start) + start;
		return random;
	}

}
