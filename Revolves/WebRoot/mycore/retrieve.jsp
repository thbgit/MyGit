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
		<script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="../js/pay.js" ></script>
	</head>

	<body>
		<!--
        	整体框架
        -->
		<div class="container">

			<!--头部框架包含logo-->
			<div class="page">
				<!--
                	logo
                -->
				<div class="logo">
					<img src="../img/homeimages/logo.png" />
				</div>
				
				<!--在线客服-->
				<div class="linkman">
					<span>
						需要帮助&nbsp;?
					</span>
					<span>400&nbsp;123&nbsp;4567</span>
					<span>联系在线客服</span>
				</div>
			</div>
		<hr />
				<!--
                	登录注册
                -->
				<!--<div class="register">
					<div class="one">
						<a href="#" style="margin-right: 24px;">个人中心
							<img src="../img/homeimages/arrows.png" />
						</a>
						<a href="#" style="margin-right: 22px;">客户服务
							<img src="../img/homeimages/arrows.png" />
						</a>
						欢迎来 REVOLVE
						<a href="../登录注册/register.jsp" style="margin-left: 8px;">登录</a> |
						<a href="../登录注册/signin.jsp">注册</a>
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

					</div>
				</div>-->
			<!--</div>
			<hr />-->
			<!--
            	导航栏
            -->
			<!--<div class="links">
				<ul class="links_list">
					<li>
						<a href="/index.jsp">首页</a>
					</li>
					<li>
						<a href="../商品/allgoods.jsp">所有商品</a>
					</li>
					<li>
						<a href="../商品/goods.jsp">女士香水</a>
					</li>
					<li>
						<a href="../商品/goodsman.jsp">男士香水</a>
					</li>
					<li>
						<a href="../商品/allgoods.jsp">会员尊享</a>
					</li>
				</ul>
			</div>-->

			<!--
            	主体框架
            -->
			<div class="retrievemain">
				<!--分层显示-->
				<form action="" method="post">
					<div class="contentout">
						<div class="content">
							<p class="reg">会员登录</p>
							<div class="switch" id="switch">
								<a class="mobileway" id="mobileway" href="javascript:void(0);">手机找回</a>
								<a class="emailway" id="emailway" href="javascript:void(0);">邮箱找回</a>
								
							</div>
							<!--手机找回div开始-->
							<div class="phone" id="phone" >
								<label class="user" for="phonetips">手机号码</label>
								<input class="text" type="text" name="phonename" id="phonetips" placeholder="输入注册时使用的手机号码" />
								<!--<p class="user">验证码</p>-->
								<label class="user" for="regexp">验证码</label><br />
								<input class="regexp" id="regexp" type="text" name="phonereg" placeholder="输入验证码" />
								<input class="getregexp" type="button" value="获取验证码" />
								
								<label class="user" for="phonetips">新密码</label>
								<input class="text" type="text" name="phonename" id="phonetips" placeholder="6-16位密码，区分大小写" />
								<label class="user" for="phonetips">确认新密码</label>
								<input class="text" type="text" name="phonename" id="phonetips" placeholder="6-16位密码，区分大小写" />
								<input class="signbut" type="button" value="提交" />
								<p class="skip">修改成功后自动跳转到首页</p>
								
							</div>
							<!--手机找回div结束-->

							<!--邮箱找回开始-->
							<div class="email" id="email" style="display: none;">
								<label class="user" for="emailtips">邮箱</label>
								<input class="text" type="text" name="emailname" id="emailtips" placeholder="输入注册时使用的邮箱" />
								<!--<p class="user">验证码</p>-->
								<label class="user" for="regexp">验证码</label><br />
								<input class="regexp" id="regexp" type="text" name="emailreg" placeholder="输入验证码" />
								<input class="getregexp" type="button" value="获取验证码" />
								<div class="hint">
									<div class="hintleft">
										<p>
											1.输入注册使用邮箱
										</p>
										<p>
											3.点击邮箱中的验证链接
										</p>
									</div>
									<div class="hintright">
										<p>
											2.系统向您发送邮箱验证
										</p>
										<p>
											4.重置密码
										</p>
									</div>
									<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
								</div>
								<input class="signbut" type="button" value="提交" />
								<p class="skip">修改成功后自动跳转到首页</p>
							</div>
						</div>
					</div>
				</form>
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