<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

	String goback = (String)session.getAttribute("goback");
	String loginsuc = (String)session.getAttribute("goback");
	Integer counts = (Integer)session.getAttribute("counts");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Revolve</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="./css/base.css"/>
		<link rel="stylesheet" type="text/css" href="./css/base.css"/>
		<link rel="stylesheet" type="text/css" href="./css/manage.css"/>
		<link rel="stylesheet" type="text/css" href="./css/address.css"/>
		<link rel="stylesheet" type="text/css" href="./css/safeset.css"/>
		<link rel="stylesheet" type="text/css" href="./css/uncollect.css"/>

		<script type="text/javascript" src="../js/goods.js" ></script>
	</head>
	<body>
		<div class="container">
			<div class="nav">
				<!--
				page:首页logo和欢迎div框架
				-->
				<div class="page">

					<div class="logo">
						<img src="img/homeimages/logo.png" />
					</div>
	
					<div class="register">
						<div class="one">
							<select class="own">
								<option value="个人中心">个人中心</option>
								<option value="我的订单">我的订单</option>
								<option value="我的账户">我的账户</option>
								<option value="我的收藏">我的收藏</option>
								<option value="个人信息">个人信息</option>
								<option value="密码设置">密码设置</option>
								<option value="收货地址">收货地址</option>
								<option value="商品管理">商品管理</option>
							</select>
							<select class="custom">
								<option value="客服服务">客户服务</option>							
							</select>
							欢迎来 REVOLVE <a href="#">,${sessionScope.user.userName }</a>  <a href="#">登出</a>
						</div>
						<div class="two">
							<div class="search">
								<input type="text" class="input" id="searchInfo" onfocus="setNull('searchInfo')" onblur="setSearch('searchInfo')"  value="搜索" /><img src="img/homeimages/search.png" />		
							</div>	
							<img class="shoppingcart" src="./img/homeimages/shoppingcart.png" /> 我的购物袋 <span class="count">${cartCount }</span>
						</div>
						
					</div>
				</div>
	
				
				<div class="links">
					<ul class="links_list">
						<li>
							<a href="index.jsp" class="">首页</a>
						</li>
						<li>
							<a href="allgoods.jsp" class="">所有商品</a>
						</li>
						<li>
							<a href="girlgoods.jsp" class="">女士香水</a>
						</li>
						<li>
							<a href="gentgoods.jsp" class="">男士香水</a>
						</li>
						<li>
							<a href="vip.jsp" class="">会员尊享</a>
						</li>
					</ul>
				</div>
				<!--
					banner：首页轮播图div
				-->
				<!--<div class="banner">
					<img src="../img/homeimages/banner.jpg" />
				</div>-->  
				<!--
					links:首页超链接div框架
				-->
			</div>
			
			
			<div class="main">
				<div class="navi">
					<p><span class="owncentre">个人中心</span></p>
					<hr />
					<p><a href="unindext.jsp" class="indext">我的订单</a></p>
					<p><a href="#" >我的账户</a></p>
					<p><a href="uncollect.jsp">我的收藏</a></p>
					<p><a href="userinfo.jsp">个人信息</a></p>
					<p><a href="safeset.jsp">安全设置</a></p>
					<p><a href="address.jsp">收货地址</a></p>
					<p><a href="manage.jsp">商品管理</a></p>
				</div>
				<div class="content">
					<div>
						<div class="mycollect" >我的订单</div>
						<p class="allgoods">全部订单</p>
						<div class="showcollect">
							<p>您还没有订单，赶快去逛逛吧1</p>
						</div>						
					</div>
				</div>
				
				
			</div>
			<hr class="hr4" />
			<!--				
				footer_outter：页脚广告
			-->
			<div class="footer">
					<div class="subfooter">
							<div class="serve">
								<table >
									<tr>
										<td>
											<img src="../img/homeimages/service.png" /><span>客服</span>
										</td>
	
									</tr>
									<tr>
										<td class="info">REVOLVE 专业客服团队将竭诚为您服务，请联系<p>线上客服或致电4009-555-888</p></td>
									</tr>
								</table>
							</div>
							<div class="serve">
								<table >
									<tr>
										<td>
											<img src="../img/homeimages/logstics.png" /><span>购买</span>
										</td>
									</tr>
									<trstyle="margin-top: 6px;">
										<td class="info">每笔订单均附赠定制体验装,<p>并享受免费订单配送。</p></td>
									</tr>
								</table>
							</div>
							<div class="serve other">
								<table >
									<tr>
										<td>
											<img src="../img/homeimages/subscription.png" /><span>订阅</span>
										</td>
									</tr>
									<tr>
										<td class="info">订阅最新资讯：限量系列，心意好礼，尽在掌握。</td>
									</tr>
								</table>
							</div>
					</div>
					
					<!--
					copyright_outter：版权信息
					-->
					<div class="copyright">					
						<table>
							<tr>
								<td id="one">2017 Eminent 股份有限公司。版权所有</td>
								<td id="two">
									<a href="#">隐私政策</a>
									<a href="#">常见问题</a>
									<a href="#">联系我们</a>
									<a href="#">关于我们</a> 
									<a href="#">法律声明</a>
								</td>
								<td id="thi">黔ICP备16006431号-12</td>
							</tr>
						</table>
					</div>
			</div>
						
		</div>
	</body>
</html>
