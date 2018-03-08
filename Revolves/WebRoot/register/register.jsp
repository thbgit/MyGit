<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<title>REVOLVE 登录</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/register.css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/pay.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js" ></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js" ></script>
	</head>

	<body>
		<!--
        	整体框架
        -->
		<div class="container">
				<div class="alterpage">
				<!--
                	logo
                -->
				<div class="alterlogo">
					<img src="${pageContext.request.contextPath }/img/homeimages/logo.png" />
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
			<!--
            	主体框架
            -->
             		
			<div class="main">
				<!--分层显示-->
				<form action="login.do" method="post" onsubmit="return checkinp()">
					<div class="content">
						<p class="reg">登&nbsp;&nbsp;录</p>
						<p class="user">账号</p>
						
				 <c:if test="${!empty cookie }" >
						<label>
						<input value="${cookie.username1.value }" onblur="return checkuser()" onfocus="return checkuser2()" class="text" type="text" placeholder="邮箱地址/手机号码" id="loginusername" name="username" />
						<span class="loginuserprompt" id="loginuserprompt"></span>
						</label>
            	 </c:if>
            	 
            	 <c:if test="${empty cookie }" >
						<label>
						<input onblur="return checkuser()" onfocus="return checkuser2()" class="text" type="text" placeholder="邮箱地址/手机号码" id="loginusername" name="username" />
						<span class="loginuserprompt" id="loginuserprompt"></span>
						</label>
            	 </c:if>
            	 
						<p class="user">密码</p>
						
						<label>
							<input onblur="return checkpsd()" onfocus="return checkpsd2()" class="text" type="password" placeholder="6-16位密码，区分大小写" id="loginpsd" name="password"/>
							<span class="loginpsdprompt" id="loginpsdprompt"></span><br/>
						</label>
						
						<label>
							<input  class="loginbut"  type="submit" value="登    录"/>
						</label>
						<p class="psd"><a href="${pageContext.request.contextPath }/mycore/retrieve.jsp">忘记密码&nbsp;?</a></p>
						<p class="notsignin">尚未注册会员&nbsp;?</p>
						<p class="signin">点击下方按钮进入注册页面</p>
						<a href="signin.jsp">
							<input class="signinbut" type="button" value="注    册"/>
						</a>
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