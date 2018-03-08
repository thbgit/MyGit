<%@ page language="java" import="java.util.*"
	import="com.hc.revolves.bean.Goods" pageEncoding="UTF-8"%>
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
<title>REVOLVE 商品详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/goodsdetails.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js"></script>
<script type="text/javascript">
	$(function() {
		$('.norms1 label').click(function() {
			var labelLength = $('.norms1 label').length;
			for (var i = 0; i < labelLength; i++) {
				if (this == $('.norms1 label').get(i)) {
					$('.norms1 label').eq(i).addClass('red');
				} else {
					$('.norms1 label').eq(i).removeClass('red');
				}
			}
		});
	});
</script>
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
				<li><a href="${pageContext.request.contextPath }/index.jsp">首页</a></li>
				<li><a href="allgoods.jsp">所有商品</a></li>
				<li><a href="goods.jsp">女士香水</a></li>
				<li><a href="goodsman.jsp">男士香水</a></li>
				<li><a href="${pageContext.request.contextPath }/index.jsp">会员尊享</a></li>
			</ul>
		</div>

		<!--
            	主体框架
            -->

		<div class="main">
			<!--第一部分：分层显示-->
			<c:if test="${sessionScope.goods==null }">
              	<div class="layer1">
					<a href="${pageContext.request.contextPath }/index.jsp">首页</a> <img
						src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" /> <a
						href="recordServlet.do?id=${sessionScope.goods.goodsId }&name=${sessionScope.goods.cname }">女士香水</a> <img
						src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" /> <span>${sessionScope.goods.xtype }香水</span>
				</div>
			</c:if>
			<c:if test="${sessionScope.goods!=null }">
				<div class="layer1">
					<a href="${pageContext.request.contextPath }/index.jsp">首页</a> <img
						src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" /> <a
						href="recordServlet.do?id=${sessionScope.goods.goodsId }&name=${sessionScope.goods.cname }">女士香水</a> <img
						src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" /> <span>青柠罗勒与柑橘香水</span>
				</div>
			</c:if>

			

			<!--第二部分：产品详情   <p class="describetwo">调,宛如加勒比海的微风,堪称现代经典。</p>-->
			<form action="cartServlet.do?id=${sessionScope.goods.goodsId }" method="post">
				<div class="layer2">
					<div class="layerleft">
						<img src="${pageContext.request.contextPath }/img/goodsimages/goodsimg.png" />
					</div>
					<div class="layerright">
						<div class="describe">
							<p class="describeone">${sessionScope.goods.ename }</p>
							<p class="describeone">${sessionScope.goods.cname }</p>
							<p class="describetwo">${sessionScope.goods.descri }</p>
						</div>
						<div class="price">
							<div>
								<span class="designation">售价</span><span>￥${sessionScope.goods.price }</span>
							</div>
							<div class="privilegeout">
								<div class="designation privilege">优惠</div>
								<div class="privilege1">
									<span class="subprivilege1">满&nbsp;599&nbsp;元直减&nbsp;60&nbsp;元</span>
									<span>满&nbsp;1099&nbsp;元直减&nbsp;100&nbsp;元</span>
									<div class="subprivilege2">全场订单均享受免费配送服务</div>
								</div>
							</div>
							<div class="workoff">
								<span>已售</span><span>60件</span><span>评论</span><span>60条</span>
							</div>
						</div>
						<div class="classes">
							<div class="norms1" id="designation" onclick="checked()">
								<span class="designation">规格</span>
								<label>
									<p>30ml</p>
									<input type="radio" name="standard" value="30ml" />
								</label>
								<label>
									<p>50ml</p>
									<input type="radio" name="standard" value="50ml" />
								</label>
								<label>
									<p>100ml</p>
									<input type="radio" name="standard" value="100ml" />
								</label>
							</div>
							<div class="norms2">
								<span class="quantity">数量</span>
								<div class="amount_box">
									<a href="javascript:;" class="reduce reSty">-</a> <input
										type="text" value="1" class="sum" id="sum" name="quantity"> <a
										href="javascript:;" class="plus">+</a>
								</div>
							</div>

							<div class="downbutton">
								<input class="buy" type="submit" value="立即购买" name="pay" /> <input
									class="add" type="submit" value="加入购物袋" name="pay" />
							</div>
						</div>
					</div>
				</div>
			</form>

			<!--第三部分：香调   -->
			<div class="layer3">
				<div class="name">香调</div>
				<div class="classifyimg">
					<div class="imgone">
						<img src="${pageContext.request.contextPath }/img/goodsimages/citrus.bmp" />
						<p>前调:柑橘</p>
					</div>
					<div class="imgone">
						<img src="${pageContext.request.contextPath }/img/goodsimages/mid.bmp" />
						<p>中调:罗勒</p>
					</div>

					<div class="imgone">
						<img src="${pageContext.request.contextPath }/img/goodsimages/right.bmp" />
						<p>后调:琥珀木,檀香木,雪松木</p>
					</div>
				</div>
			</div>


			<!--同类香调推荐     -->
			<div class="recommend">
				<div class="name">同类香调推荐&nbsp;</div>
				<div class="recommendimg">
					<div class="arw1">
						<img src="${pageContext.request.contextPath }/img/goodsimages/arrows2.png" />
					</div>
					<div class="recommendimg">
						<img src="${pageContext.request.contextPath }/img/goodsimages/recommend.png" />
						<p>BASIL &amp; MANDARIN COLOGNE</p>
						<p>罗勒与橙花香水</p>
						<p>￥600.00-￥1200.00</p>
						<p class="details">
							<a href="#">了解详情</a>
						</p>
					</div>
					<div class="recommendimg">
						<img src="${pageContext.request.contextPath }/img/goodsimages/recommend.png" />
						<p>BASIL &amp;  MANDARIN COLOGNE</p>
						<p>罗勒与橙花香水</p>
						<p>￥600.00-￥1200.00</p>
						<p class="details">
							<a href="#">了解详情</a>
						</p>
					</div>

					<div class="recommendimg">
						<img src="${pageContext.request.contextPath }/img/goodsimages/recommend.png" />
						<p>BASIL &amp;  MANDARIN COLOGNE</p>
						<p>罗勒与橙花香水</p>
						<p>￥600.00-￥1200.00</p>
						<p class="details">
							<a href="#">了解详情</a>
						</p>
					</div>
					<div class="arw2">
						<img src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" />
					</div>
				</div>
			</div>

			<!--优享服务     -->
			<div class="detailsServe">
				<div class="name">优享服务</div>
				<div class="serveimg">
					<div class="detailsServeimg1">
						<img src="${pageContext.request.contextPath }/img/goodsimages/serve1.bmp" />
						<p>典雅礼盒包装</p>
					</div>
					<div class="detailsServeimg2">
						<img src="${pageContext.request.contextPath }/img/goodsimages/serve2.bmp" />
						<p>香氛混搭主义</p>
					</div>
				</div>
			</div>

			<!--用户评论     -->
			<div class="comment">
				<div class="name">评论&nbsp;</div>
				<div class="commentimg">
					<div class="arw1">
						<img src="${pageContext.request.contextPath }/img/goodsimages/arrows2.png" />
					</div>
					<div class="commentimg1">
						<p>
							<span class="user">123456789</span><span class="data">2天前</span>
						</p>
						<p>闻起来很舒服哦~没让我失望现在和之前买的鼠尾草一起搭配着喷 很棒棒 会回购的喔！还想买红玫瑰</p>
						<img src="${pageContext.request.contextPath }/img/goodsimages/comment1.jpg" /> <img
							src="${pageContext.request.contextPath }/img/goodsimages/comment2.jpg" />
					</div>
					<div class="commentimg1">
						<p>
							<span class="user">123456789</span><span class="data">2天前</span>
						</p>
						<p>闻起来很舒服哦~没让我失望现在和之前买的鼠尾草一起搭配着喷 很棒棒 会回购的喔！还想买红玫瑰</p>
						<img src="${pageContext.request.contextPath }/img/goodsimages/comment1.jpg" /> <img
							src="${pageContext.request.contextPath }/img/goodsimages/comment2.jpg" />
					</div>

					<div class="commentimg1">
						<p>
							<span class="user">123456789</span><span class="data">2天前</span>
						</p>
						<p>闻起来很舒服哦~没让我失望现在和之前买的鼠尾草一起搭配着喷 很棒棒 会回购的喔！还想买红玫瑰</p>
						<img src="${pageContext.request.contextPath }/img/goodsimages/comment1.jpg" /> <img
							src="${pageContext.request.contextPath }/img/goodsimages/comment2.jpg" />
					</div>
					<div class="arw2">
						<img src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" />
					</div>
				</div>
			</div>
			<!--清除浮动 让内不框架自动将外框架撑开 （外部框架自适应高度）-->
			<div
				style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
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
				<div>2017&nbsp;Eminent股份有限公司。版权所有</div>
				<div>隐私政策&nbsp;常见问题&nbsp;联系我们&nbsp;关于我们&nbsp;法律声明</div>
				<div>黔ICP备16006431号-12</div>
			</div>
		</div>
	</div>
</body>
</html>