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
		<title>REVOLVE 商品搜索页面</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/goods.css" />
	</head>

	<body>
		<!--
        	整体框架
        -->
		<div class="container">

			<!----头部框架包含logo和登录注册框架----->
			<div class="page">
				
				<!--logo-->
				<div class="logo">
					<img src="${pageContext.request.contextPath }/img/homeimages/logo.png" />
				</div>

				<!--登录注册-->
			
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

			<!--导航栏 -->
			<div class="links">
				<ul class="links_list">
					<li>
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
					</li>
					<li>
						<a href="selectAll.do">所有商品</a>
					</li>
					<li>
						<a href="selectGoods.do?classid=1" style="padding-bottom: 3px;border-bottom: 1px solid #F6F6F6;">女士香水</a>
					</li>
					<li>
						<a href="selectGoods.do?classid=2">男士香水</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/index.jsp">会员尊享</a>
					</li>
				</ul>
			</div>

			<!--banner大图-->

			<div class="banner">
				<img src="${pageContext.request.contextPath }/img/goodsimages/BANNER.jpg" />
			</div>

			<!-- 页面内容  -->
			<div class="main">

			
				<!--分类信息-->
				
				
				<!--具体类别-->	
				<div class="column">
					<span style="font-size: 18px; color: #333333;">香水</span>&nbsp;
					<span style="color:#C81D31; font-size: 14px;">${totalGoodsNum }</span>&nbsp;
					<span style="font-size: 18px; color: #333333;">件</span>
				</div>
		
				

				<!--品牌分类 用表格布局-->
				<div class="brand">
					<div class="left">
						品牌
					</div>
					<table class="right">
						<tr>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/dior.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/coach.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/dkny.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/arman.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/balenciaga.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/chanel.png" /></a></td>
						</tr>
						<tr>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/calvinklein.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/givenchy.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/lancome.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/yvessainilaurent.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/versace.png" /></a></td>
							<td><a href="#"><img src="${pageContext.request.contextPath }/img/goodsimages/prada.png" /></a></td>
						</tr>
					</table>
					
					<!--右边的更多选项-->
					<div class="more">
						<a href="selectAll.do">更多&nbsp;&nbsp;<img src="${pageContext.request.contextPath }/img/homeimages/arrows.png" /> </a>
					</div>
				</div>
				
				<!--品种分类-->
				<div class="opstion1">
					<div class="left">
						<a href="#">香调</a>
					</div>
					<div class="rigth">
						<a href="#">柑橘香类</a>
					</div>
					<div class="rigth">
						<a href="#">果香类</a>
					</div>
					<div class="rigth">
						<a href="#">清新淡花香类</a>
					</div>
					<div class="rigth">
						<a href="#">花香类</a>
					</div>
					<div class="rigth">
						<a href="#">辛辣香类</a>
					</div>
					<div class="rigth">
						<a href="#">本木香类</a>
					</div>
				</div>

				<!--规格分类-->
				<div class="opstion2">
					<div class="left">
						<a href="#">规格</a>
					</div>
					<div class="rigth">
						<a href="#">100ML</a>
					</div>
					<div class="rigth">
						<a href="#">75ML</a>
					</div>
					<div class="rigth">
						<a href="#">50ML</a>
					</div>
					<div class="rigth">
						<a href="#">40ML</a>
					</div>
					<div class="rigth">
						<a href="#">30ML</a>
					</div>
					<div class="rigth">
						<a href="#">其他</a>
					</div>
				</div>
				<c:if test="${searchgoods!=null&&fn:length(searchgoods)>0  }">
				<!--具体类别-->	
				<div class="kind">
					<a href="goods.jsp">香水</a><img src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" />
					<a href="goods.jsp">柑橘香类</a>
				</div>
			</c:if> 
			<c:if test="${searchgoods==null||fn:length(searchgoods)==0  }">
				<!--具体类别-->	
				<div class="kind">
					<a href="selectAll.do">您搜索的香水不存在</a><img src="${pageContext.request.contextPath }/img/goodsimages/arrows3.png" />
					
				</div>
			</c:if> 
			
				<!--商品内容-->
				<div class="goods">
					<div class="view">
					<c:forEach items="${searchgoods }" var="list">
						
						<div class="out">
							<div class="con">
								<img src="${list.imgurl }">
								<div class="txt">
									<img src="${pageContext.request.contextPath }/img/goodsimages/collect.png" />
									<p><a href="selectDetails.do?gid=${list.goodsId }">查看详情</a></p>
								</div>
							</div>
							<div class="introduce">
								<p>${list.ename }</p>
								<p>${list.cname }</p>
								<span class="price">￥${list.price }</span>
							</div>
						</div>
						</c:forEach>
						</div>
					</div>
					 
				</div>
			
				<div id="page" class="page_div">
				<a class="prePage" href="search.do?searchtext=${searchtext }&pageIndex=${pre }">
					<img src="${pageContext.request.contextPath }/img/goodsimages/arrows2.png" alt="上一页">
				</a>
				<c:forEach begin="1" end="${pageCount }" step="1" var="i">
					<a class="current" href="search.do?searchtext=${searchtext }&pageIndex=${i}">${i }</a>
				</c:forEach>
				<a class="nextPage" href="search.do?searchtext=${searchtext }&pageIndex=${next }">
					<img src="${pageContext.request.contextPath }/img/goodsimages/arrows1.png" alt="下一页">
				</a>
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

		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/goods.js"></script>

<!-- <script>
//分页
$("#page").paging({
	totalPage: 60,
	totalSize: 300,
}) -->
</script>
	</body>
</html>