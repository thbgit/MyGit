<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title>REVOLVE 购物车</title>
		<link rel="stylesheet" type="text/css" href="../css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="../css/backstage.css" />
		<script>
			window.onload = function() {
				setInterval('count()', 1000);
			}

			function count() {
				var time = document.getElementById('time');
				var btn = document.getElementById('Btn');
				if(time.innerHTML > 0) {
					time.innerHTML = time.innerHTML - 1;
				} else {
					location.href = btn.href;
				}
			}
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
			<div class="alterpage">
				<!--
                	logo
                -->
				<div class="alterlogo">
					<img src="../img/homeimages/logo.png" />
				</div>

				<!--
                	在线咨询客服
                -->
				<div class="linkman">
					<span>
						需要帮助&nbsp;?
					</span>
					<span>400&nbsp;123&nbsp;4567</span>
					<span>联系在线客服</span>
				</div>
			</div>
		<hr />
					<!--<div class="one">
						<a href="#" style="margin-right: 24px;">个人中心
							<img src="../img/homeimages/arrows.png" />
						</a>
						<a href="#" style="margin-right: 22px;">客户服务
							<img src="../img/homeimages/arrows.png" />
						</a>
						欢迎来 REVOLVE
						<a href="#" style="margin-left: 8px;">登录</a> |
						<a href="#">注册</a>
					</div>
					<div style="position: absolute;width: 66px;background: white;visibility: hidden;">
						<p>我的订单</p>
						<p>我的账户</p>
						<p>我的收藏</p>
						<p>个人信息</p>
						<p>密码设置</p>
						<p>收货地址</p>
						<p>商品管理</p>
					</div>
					<div class="two">
						<div class="search">
							<input type="text" class="input" value="搜索" /><img src="../img/homeimages/search.png" />
						</div>
						<img class="shoppingcart" src="../img/homeimages/shoppingcart.png" /> 我的购物袋
						<span class="count" style="margin-right: 6px;color:red">0&nbsp;</span>
					</div>-->

			<!--
            	导航栏
            -->
			<!--<div class="links">
				<ul class="links_list">
					<li>
						<a href="index.jsp">首页</a>
					</li>
					<li>
						<a href="index.jsp">所有商品</a>
					</li>
					<li>
						<a href="goods.jsp">女士香水</a>
					</li>
					<li>
						<a href="index.jsp">男士香水</a>
					</li>
					<li>
						<a href="index.jsp">会员尊享</a>
					</li>
				</ul>
			</div>-->

			<div class="altermain">
				<div class="alter">
					<form action="../index.jsp" method="post">
							<p class="suc">修改成功&nbsp;!</p>
							<p class="user"><span>尊敬的用户:</span><span>1234567891111</span></p>
							<p class="altersuc">您已成功修改&nbsp;!</p>
							<input class="alterbut" type="button" value="去登录" />
							<p class="time"><span id="time">30</span>秒之后页面会自动返回</p>
							<a id="Btn" href="../index.jsp"></a>
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
									<img src="../img/homeimages/service.png" />&nbsp;
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
									<img src="../img/homeimages/logstics.png" />&nbsp;
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
									<img src="../img/homeimages/subscription.png" />&nbsp;
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
						2017&nbsp;Eminent&nbsp;&nbsp;股份有限公司。版权所有
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