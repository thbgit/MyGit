<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<meta charset="UTF-8">
		<title>REVOLVE 购物车</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/buy.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/addr.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/pay.js"></script>
	</head>

	<body>
		<!--
        	整体框架
        -->
		<div class="container">


			<div class="main">

				<div class="left">
					<form class="info" action="addAddress.do" method="post" onsubmit="return checkall()" name="creator">
						<p>输入收货地址</p>
						<p>收件人姓名&nbsp;<span>*</span></p>
						<div class="namediv">
						<input onfocus="checkname()" onblur="checkname2()" type="text" name="username" id="name"/>
						<span class="nameprompt" id="nameprompt"></span>
						</div>
						
						<p>省&nbsp;<span>*</span></p>
						<div class="selectdiv">
							<select id="province" onchange="initcity();" name="province" onblur="return checkprovince()" onfocus="checkprovince()">
								<script>creatprovince();</script>
							</select>
							<span class="provinceprompt" id="provinceprompt"></span>
						</div>
						
						<p>市/县&nbsp;<span>*</span></p>
						<div class="selectdiv">
							<select id="city" name="city" onblur="return checkcity()" onfocus="checkcity()">
								<option value="">请选择市区</option>
							</select>
							<span class="cityprompt" id="cityprompt"></span>
						</div>
						<p>街道地址&nbsp;<span>*</span></p>
						<div class="detailaddrdiv">
						<input onblur="return checkdetailaddr()" onfocus="checkdetailaddr()" type="text" name="detailaddr" id="detailaddr"/>
						<span class="detailaddrprompt" id="detailaddrprompt"></span>
						</div>
						<p>邮政编码&nbsp;<span>*</span></p>
						<div class="codediv">
						<input onblur="return checkcode()" onfocus="checkcode2()" type="text" name="code" id="code"/>
						<span class="codeprompt" id="codeprompt"></span>
						</div>
						<p>联系方式&nbsp;<span>*</span></p>
						<div class="telnumdiv">
						<input onfocus="checktelnum2()" onblur="return checktelnum()" type="text" name="telnum" id="telnum"/>
						<span class="telnumprompt" id="telnumprompt"></span>
						</div>
						<div class="mycheck">
							<input type="checkbox" name="chb" id="chb"  />
							<label for="chb"></label>
						</div>
						<span>订阅最新资讯</span>
						<input class="sub" type="submit" value="保存并继续" />
						<input type="hidden" name="name" value="add" />
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
								<img src="img/flow/flowgoos.png" />
							</div>

							<div class="intro">
								<ul>
									<li>LIME BASIL & MANDARIN COLOGNE</li>
									<li>青柠罗勒与柑橘香水</li>
									<li>规格：100ml</li>
									<li>数量：1</li>
									<li>价格：￥2300.00</li>
								</ul>
							</div>
						</div>

						<div class="goods1">
							<div class="goosimg">
								<img src="img/flow/flowgoos.png" />
							</div>

							<div class="intro">
								<ul>
									<li>LIME BASIL & MANDARIN COLOGNE</li>
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