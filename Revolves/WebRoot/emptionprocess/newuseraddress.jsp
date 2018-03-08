<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title>REVOLVE 新用户地址</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/buy.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/goods.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/pay.js"></script>

	</head>

	<body>
		<!--
        	整体框架
        -->
		<div class="container">

			<!--
	头部框架包含logo和登录注册框架
-->
			<div class="page">
				<!--
                	logo
                -->
				<div class="logo">
					<img src="${pageContext.request.contextPath }/img/homeimages/logo.png" />
				</div>

				<!--
                	登录注册
                -->
				
				<div class="register">
					<div class="entrybar">
					<c:if test="${sessionScope.user==null }" var="notlogin">
					<div class="navi">
							<ul class="nav">
								<li class="navsort"><a href="${pageContext.request.contextPath }/register/register.jsp">个人中心</a>
									<ul class="sub-nav">
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">我的订单</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">我的账户</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">我的收藏</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">个人信息</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">密码设置</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">收货地址</a></li>
										<li><a href="${pageContext.request.contextPath }/register/register.jsp">商品管理</a></li>
									</ul></li>
								<li class="liimg"><img src="${pageContext.request.contextPath }/img/homeimages/arrows.png" /></li>
								<li class="navsort"><a href="#">客户服务</a>
									<ul class="sub-nav">
										<li><a href="#">客户中心</a></li>
										<li><a href="#">客服中心</a></li>
										<li><a href="#">商家中心</a></li>
									</ul></li>
								<li class="liimg"><img src="${pageContext.request.contextPath }/img/homeimages/arrows.png" /></li>
							</ul>
							<div class="entry">
								<p>
									<span> 欢迎来 REVOLVE </span>
										<a name="logininfo" class="logininfo" id="logininfo"
											href="${pageContext.request.contextPath }/register/register.jsp">登录</a>|
										<a name="signinfo" class="signinfo" id="signinfo"
											href="${pageContext.request.contextPath }/register/signin.jsp">注册</a>
								</p>
							</div>
						</div>
						<form action="search.do">
					<div class="searchbar">
						<div class="subsearch">
							<input type="text" name="searchtext" id="searchtext"
							placeholder="搜索"/>
							<input type="image" src="${pageContext.request.contextPath }/img/homeimages/search.png"/>
						</div>
						
						<a href="${pageContext.request.contextPath }/emptionprocess/emptycart.jsp"><img src="${pageContext.request.contextPath }/img/homeimages/shoppingcart.png" /></a>
						<span class="bag"><a href="${pageContext.request.contextPath }/emptionprocess/emptycart.jsp">我的购物袋</a></span>
						<span id="amount">0</span>
					</div>
				</form>
					</c:if>
					
					<c:if test="${!notlogin }">
						<div class="navi">
							<ul class="nav">
								<li class="navsort"><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">个人中心</a>
									<ul class="sub-nav">
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">我的订单</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">我的账户</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">我的收藏</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">个人信息</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">密码设置</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">收货地址</a></li>
										<li><a href="${pageContext.request.contextPath }/mycore/unindext.jsp">商品管理</a></li>
									</ul></li>
								<li class="liimg"><img src="${pageContext.request.contextPath }/img/homeimages/arrows.png" /></li>
								<li class="navsort"><a href="#">客户服务</a>
									<ul class="sub-nav">
										<li><a href="#">客户中心</a></li>
										<li><a href="#">客服中心</a></li>
										<li><a href="#">商家中心</a></li>
									</ul></li>
								<li class="liimg"><img src="${pageContext.request.contextPath }/img/homeimages/arrows.png" /></li>
							</ul>
							<div class="entry">
								<p>
									<span> 欢迎来 REVOLVE </span>
										<c:choose>
											<c:when test="${cookie.lastTime.value==null }">
											第一次登录<a name="logininfo" class="logininfo" id="logininfo"
													href="${pageContext.request.contextPath }/mycore/unindext.jsp">${sessionScope.user.userName }</a>|
											<a name="signinfo" class="signinfo" id="signinfo"
													href="quit.do">注销</a>
											</c:when>
											<c:when test="${cookie.lastTime.value!=null }">
											上次登录时间${cookie.lastTime.value } 
											<a name="logininfo" class="logininfo" id="logininfo"
													href="${pageContext.request.contextPath }/mycore/unindext.jsp">${sessionScope.user.userName }</a>|
											<a name="signinfo" class="signinfo" id="signinfo"
													href="quit.do">注销</a>
											</c:when>
										</c:choose>
								</p>
							</div>
						</div>
						<form action="search.do">
					<div class="searchbar">
						<div class="subsearch">
							<input type="text" name="searchtext" id="searchtext"
							placeholder="搜索"/>
							<input type="image" src="${pageContext.request.contextPath }/img/homeimages/search.png"/>
						</div>
						<a href="${pageContext.request.contextPath }/emptionprocess/emptycart.jsp"><img src="${pageContext.request.contextPath }/img/homeimages/shoppingcart.png" /></a>
						<span class="bag"><a href="queryCart.do">我的购物袋</a></span>
						<span id="amount">${cartCount }</span>
					</div>
				</form>
						</c:if>
					</div>
					<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
				</div>
			
				<!-- 登录注册结束 -->
			</div>

			<!--
            	导航栏
            -->
			<div class="links">
				<ul class="links_list">
					<li>
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
					</li>
					<li>
						<a href="selectAll.do">所有商品</a>
					</li>
					<li>
						<a href="selectGoods.do?classid=1">女士香水</a>
					</li>
					<li>
						<a href="selectGoods.do?classid=2">男士香水</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/index.jsp">会员尊享</a>
					</li>
				</ul>
			</div>

			<div class="main">

				<div class="left">
					<form class="info" action="addAddress.do" method="post" name="creator">
						<p>输入收货地址</p>
						<p>收件人姓名&nbsp;<span>*</span></p>
						<input type="text" name="name"/>
						<p>省&nbsp;<span>*</span></p>
						<div class="selectdiv">
							<select id="province" onchange="initcity();" name="province">
								<script>creatprovince();</script>
							</select>
						</div>
						<p>市/县&nbsp;<span>*</span></p>
						<div class="selectdiv">
							<select id="city" name="city">
								<option value="">请选择市区</option>
							</select>
						</div>
						<p>街道地址&nbsp;<span>*</span></p>
						<input type="text" name="street"/>
						<p>邮政编码&nbsp;<span>*</span></p>
						<input type="text" name="postcode"/>
						<p>联系方式&nbsp;<span>*</span></p>
						<input type="text" class="telway" name="telway"/>
						<div class="mycheck">
							<input type="checkbox" name="chb" id="chb" value="1" />
							<label for="chb"></label>
						</div>
						<span class="subscribe">订阅最新资讯</span>
						<input class="sub" type="submit" value="保存并继续" />
					</form>
				</div>

				<div class="right">
					<div class="outline">
						<p>订单概要</p>
						<ul>
							<li><span>小计</span><span>￥10000</span></li>
							<li><span>优惠</span><span>￥1000</span></li>
							<li><span>实付</span><span>￥2000</span></li>
						</ul>
					</div>

					<div class="include">
						<p>您的订单包括以下商品(?)</p>
						<div class="goods1">
							<div class="goosimg">
								<img src="${pageContext.request.contextPath }/img/flow/flowgoos.png" />
							</div>

							<div class="intro">
								<ul>
									<li>LIME BASIL &amp; MANDARIN COLOGNE</li>
									<li>青柠罗勒与柑橘香水</li>
									<li>规格：100ml</li>
									<li>数量：1</li>
									<li>价格：￥2300.00</li>
								</ul>
							</div>
						</div>

						<div class="goods1">
							<div class="goosimg">
								<img src="${pageContext.request.contextPath }/img/flow/flowgoos.png" />
							</div>

							<div class="intro">
								<ul>
									<li>LIME BASIL &amp; MANDARIN COLOGNE</li>
									<li>青柠罗勒与柑橘香水</li>
									<li>规格：100ml</li>
									<li>数量：1</li>
									<li>价格：￥2300.00</li>
								</ul>
							</div>
						</div>
					</div>
					<!--<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>-->
				</div>
				<!--清除浮动 让内不框架自动将外框架撑开 （外部框架自适应高度）-->
				<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
			</div>

			<!--底部整体框架-->
			<div class="footer_outter">
				<!--底部内框架-->
				<div class="footer_inner">
					<!--底部上部分-->
					<div class="serve">

						<div class="serveleft">
							<div class="serveup">
								<div>
									<img src="${pageContext.request.contextPath }/img/homeimages/service.png" />&nbsp;
								</div>
								<div>
									<span>客服</span>
								</div>
							</div>
							<div class="serveleftdown">
								<p>REVOLVE 专业客服团队将竭诚为您服务，请联系</p>
								<p>线上客服或致电4009-555-888</p>
							</div>
						</div>
						<div class="servecenter">
							<div class="serveup">
								<div>
									<img src="${pageContext.request.contextPath }/img/homeimages/logstics.png" />&nbsp;
								</div>
								<div>
									<span>购买</span>
								</div>
							</div>
							<div class="servecenterdown">
								<p>每笔订单均附赠定制体验装,</p>
								<p>并享受免费订单配送。</p>
							</div>
						</div>
						<div class="serveright">
							<div class="serveup">
								<div>
									<img src="${pageContext.request.contextPath }/img/homeimages/subscription.png" />&nbsp;
								</div>
								<div>
									<span>订阅</span>
								</div>
							</div>
							<div class="serverightdown">
								<p>订阅最新资讯：限量系列，心意好礼，尽在掌握。</p>
							</div>
						</div>

					</div>

				</div>
			</div>
			<!--底部版权框架-->
			<div class="copyright_outter">
				<div class="copyright_inner">
					<div>
						2017&nbsp;Eminent股份有限公司。版权所有
					</div>
					<div>
						隐私政策&nbsp;常见问题&nbsp;联系我们&nbsp;关于我们&nbsp;法律声明
					</div>
					<div>
						黔ICP备16006431号-12
					</div>
				</div>
			</div>
		</div>

	</body>

</html>