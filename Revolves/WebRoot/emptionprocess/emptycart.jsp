<%@ page language="java" import="java.util.*,com.hc.revolves.bean.*,com.hc.revolves.dao.*,com.hc.revolves.dao.impl.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title>REVOLVE 购物车</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/buy.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/spinner.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js"></script>
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
						
						<a href="${pageContext.request.contextPath }emptionprocess/emptycart.jsp"><img src="${pageContext.request.contextPath }/img/homeimages/shoppingcart.png" /></a>
						<span class="bag"><a href="${pageContext.request.contextPath }emptionprocess/emptycart.jsp">我的购物袋</a></span>
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
				<div class="cartup">
					<div class="cartleft">购物袋(${cartCount })</div>
					<div class="cartright">
						<span>需要联系客服？</span>
						<span>400 866 6789</span>
						<span>|</span>
						<span><img src="${pageContext.request.contextPath }/img/flow/msg.png" /></span>
						<span><a href="#">在线聊天</a></span>
					</div>
				</div>
		
					<!--新的框架-->
					 <div class="cartMain_hd">
            <ul class="cartTop">
                <li class="list_img">商品</li>
                <li class="list_describe">描述</li>
                <li class="list_ml">规格</li>
                <li class="list_amount">数量</li>
                <li class="list_price">价格</li>
                <li class="list_op">选项</li>
            </ul>
        </div>
        
         <form action="userAddress.do" method="post">
        			<c:choose>
        				<c:when test="${sessionScope.user==null }">
        				还未登录请先登录吧!!!!
        				</c:when>
        				<c:when test="${sessionScope.cartInfo==null||fn:length(sessionScope.cartInfo)==0 }">
        				购物车空空如也~~~~赶紧去抢购吧!!!!
        				<div class="only">
				<div class="contine">
					<a href="selectAll.do"><img src="${pageContext.request.contextPath }/img/flow/shoparrows.png" />继续购物</a>
				</div>
				<div class="cartdown" id="cartdown">
					<ul>
						<li><span>小计</span><span class="subtotal" id="subtotal">￥0</span></li>
						<li><span>优惠</span><span class="discount" id="discount">￥0</span></li>
						<li><span>实付</span><span class="sumtotal" id="sumtotal">￥0</span></li>
					</ul>
						<input class="cartbut" type="submit" value="前往结账" />
				</div>
				</div>
        				</c:when>
        				<c:when test="${sessionScope.cartInfo!=null }">
					<div class="order_content">
					<c:set var="index" value="0"></c:set>
        			<c:forEach items="${sessionScope.cartInfo }" var="list" begin="${index}" >
                <ul class="order_lists">
                    <li class="list_img1">
                        <img src="${pageContext.request.contextPath }/img/flow/shoppingcart.jpg"/>
                    </li>
                    <c:forEach items="${goodslist }" var="list2" begin="${index}" end="${index}" >
                    <li class="list_describe1">
                        <div class="list_text">
                        	<a href="${pageContext.request.contextPath }/goods/goodsdetails.jsp?id=${list.goodsId}">
                        		${list2.ename }<br/>
                        		${list2.cname }
                        	</a>
                        </div>
                    </li>
                    <li class="list_ml1">
                        <p>${list2.spec }ml</p>
                    </li>
                    </c:forEach>
                    <li class="list_amount1">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="${list.num}" class="sum" id="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <c:forEach items="${goodslist }" var="list3" begin="${index}" end="${index}" >
                    <li class="list_price1">
                        <p class="price" id="price1">￥${list3.price }</p>
                    </li>
                    </c:forEach>
                    <c:set var="index" value="${index+1 }"></c:set>
                    <li class="list_op1">
                    	<p class="collect"><a href="javascript:;" class="delBtn">移入我的收藏夹</a></p>
                        <p class="del"><a href="deleteGoods.do?gid=${list.goodsId}&username=${sessionScope.user.userName }" class="delBtn">删除</a></p>
                    </li>
                </ul>
                </c:forEach>
                	
                 </div>
                 <!-- 新的框架结尾 -->
               
				<div class="only">
				<div class="contine">
					<a href="selectAll.do"><img src="${pageContext.request.contextPath }/img/flow/shoparrows.png" />继续购物</a>
				</div>
				<div class="cartdown" id="cartdown">
					<ul>
						<li><span>小计</span><span class="subtotal" id="subtotal">￥${totalPrice }</span></li>
						<li><span>优惠</span><span class="discount" id="discount">￥${totalPrice*0.1 }</span></li>
						<li><span>实付</span><span class="sumtotal" id="sumtotal">￥${totalPrice-totalPrice*0.1 }</span></li>
					</ul>
						<input class="cartbut" type="submit" value="前往结账" name="checkout"/>
				</div>
				</div>
				
			</c:when>
        			</c:choose>
        			</form>
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