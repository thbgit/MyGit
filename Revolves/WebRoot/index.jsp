<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<meta charset="UTF-8">
<title>REVOLVE</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/head.js"></script>

</head>

<body>
	<!--
        	整体框架
        -->
	<div class="main">

		<!--头部框架包含logo和登录注册框架-->
		<div class="page">
			<!--
                	logo
                -->
			<div class="logo">
				<img src="img/homeimages/logo.png" />
			</div>

			<!--
                	登录注册
                -->
			
				<div class="register">
					<div class="entrybar">
					<c:if test="${sessionScope.user==null }" var="notlogin">
					<div class="navi">
							<ul class="nav">
								<li class="navsort"><a href="./register/register.jsp">个人中心</a>
									<ul class="sub-nav">
										<li><a href="./register/register.jsp">我的订单</a></li>
										<li><a href="./register/register.jsp">我的账户</a></li>
										<li><a href="./register/register.jsp">我的收藏</a></li>
										<li><a href="./register/register.jsp">个人信息</a></li>
										<li><a href="./register/register.jsp">密码设置</a></li>
										<li><a href="./register/register.jsp">收货地址</a></li>
										<li><a href="./register/register.jsp">商品管理</a></li>
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
											href="./register/register.jsp">登录</a>|
										<a name="signinfo" class="signinfo" id="signinfo"
											href="./register/signin.jsp">注册</a>
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
						
						<a href="./emptionprocess/emptycart.jsp"><img src="${pageContext.request.contextPath }/img/homeimages/shoppingcart.png" /></a>
						<span class="bag"><a href="./emptionprocess/emptycart.jsp">我的购物袋</a></span>
						<span id="amount">0</span>
					</div>
				</form>
					</c:if>
					
					<c:if test="${!notlogin }">
						<div class="navi">
							<ul class="nav">
								<li class="navsort"><a href="./mycore/unindext.jsp">个人中心</a>
									<ul class="sub-nav">
										<li><a href="./mycore/unindext.jsp">我的订单</a></li>
										<li><a href="./mycore/unindext.jsp">我的账户</a></li>
										<li><a href="./mycore/unindext.jsp">我的收藏</a></li>
										<li><a href="./mycore/unindext.jsp">个人信息</a></li>
										<li><a href="./mycore/unindext.jsp">密码设置</a></li>
										<li><a href="./mycore/unindext.jsp">收货地址</a></li>
										<li><a href="./mycore/unindext.jsp">商品管理</a></li>
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
													href="./mycore/unindext.jsp">${sessionScope.user.userName }</a>|
											<a name="signinfo" class="signinfo" id="signinfo"
													href="quit.do">注销</a>
											</c:when>
											<c:when test="${cookie.lastTime.value!=null }">
											上次登录时间${cookie.lastTime.value } 
											<a name="logininfo" class="logininfo" id="logininfo"
													href="./mycore/unindext.jsp">${sessionScope.user.userName }</a>|
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
						<a href="./emptionprocess/emptycart.jsp"><img src="${pageContext.request.contextPath }/img/homeimages/shoppingcart.png" /></a>
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
				<li class="homepage"><a href="index.jsp"
					style="padding-bottom: 3px;border-bottom: 1px solid #F6F6F6;">首页</a></li>
				<li class="perfume"><a href="selectAll.do">所有商品</a></li>
				<li class="lady"><a href="selectGoods.do?classid=1">女士香水</a></li>
				<li class="gentleman"><a href="selectGoods.do?classid=2">男士香水</a></li>
				<li class="vip"><a href="index.jsp">会员尊享</a></li>
			</ul>
		</div>

		<!--
	banner大图
-->
		<div class="banner">
			<img src="img/homeimages/banner.jpg" />
		</div>

		<!--
            	内容
            -->
		<div class="content">

			<!--
                	内容上半部分
                -->
			<div class="up">
				<!--
                	内容上左部分
                -->
				<div class="up_left">
					<div class="image">
						<a href="selectGoods.do?classid=3"><img src="img/homeimages/hot.jpg" /></a>
					</div>

					<div class="word">
						<span>人气精选</span>
						<p>限量套装全新上市,跃动惊喜的圣诞奇趣物语等你开启</p>
						<a href="#">挑选礼物</a>
						<hr width="40px" align="center" />
					</div>
				</div>

				<!--内容上右部分-->
				<div class="up_right">
					<div class="image">
						<a href="selectGoods.do?classid=4"><img src="img/homeimages/gift.png" /></a>
					</div>
					<div class="word">
						<span>限时礼遇</span>
						<p>附赠定制香氛体验套装、挑选2款限量摩登包装</p>
						<a href="#">挑选礼物</a>
						<hr width="40px" align="center" />
					</div>
				</div>
			</div>

			<!--
                	内容下半部分
                -->
			<div class="down">
				<!--内容下左部分-->
				<div class="down_left">
					<div class="image">
						<a href="selectGoods.do?classid=2"><img src="img/homeimages/gentry.jpg" /></a>
					</div>
					<div class="word">
						<span>绅士格调</span>
						<p>It’s for you,gents.</p>
						<a href="selectGoods.do?classid=2">挑选礼物</a>
						<hr width="40px" align="center" />
					</div>
				</div>
				<!--内容下右部分-->
				<div class="down_right">

					<div class="image">
						<a href="selectGoods.do?classid=1"><img src="img/homeimages/lady.jpg" /></a>
					</div>
					<div class="word">
						<span>酷女孩</span>
						<p>It’s for you,girls.</p>
						<a href="selectGoods.do?classid=1">挑选礼物</a>
						<hr />
					</div>
				</div>
			</div>
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
								<img src="img/homeimages/service.png" />&nbsp;
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
								<img src="img/homeimages/logstics.png" />&nbsp;
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
								<img src="img/homeimages/subscription.png" />&nbsp;
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
				<div>2017&nbsp;Eminent股份有限公司。版权所有</div>
				<div>隐私政策&nbsp;常见问题&nbsp;联系我们&nbsp;关于我们&nbsp;法律声明</div>
				<div>黔ICP备16006431号-12</div>
			</div>
		</div>
	</div>
</body>

</html>