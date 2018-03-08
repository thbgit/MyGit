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
<title>REVOLVE 注册</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/head_footer.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/register.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/head.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/goods.js"></script>
<script type="text/javascript">
	function changeImg(img) {
		img.src = "ver.do?date =" + new Date().getTime();
	}
</script>
</head>

<body>
	<!--
        	整体框架
        -->
	<div class="container">

		<!--
                	logo
                -->
		<div class="alterpage">

			<div class="alterlogo">
				<img src="${pageContext.request.contextPath }/img/homeimages/logo.png" />
			</div>

			<!--
                	登录注册
                -->
			<div class="linkman">
				<span> 需要帮助&nbsp;? </span> <span>400&nbsp;123&nbsp;4567</span> <span>联系在线客服</span>
			</div>
		</div>
		<hr />
		<!--
            	主体框架
            -->
              
			<%
			//获取后台发送来的验证码
			//String yzm=(String)session.getAttribute("verimg1");
			Random random = new Random();
			int num = random.nextInt();
			session.setAttribute("num", num + "");
			String num2 = (String) request.getSession().getAttribute("num");
			//System.out.println("jsp-----==="+yzm);
			%>
			
		<div class="main">
			<!--分层显示-->
			<c:if test="${!empty cookie }">
			<form action="register.do" method="post" class="form"
				onsubmit="return checkinp()">
				<div class="content">
					<p class="reg">注&nbsp;&nbsp;册</p>
					<p class="user">账号</p>
					
					<label> <input value="${cookie.susername.value }" onfocus="return checkuser2()"
						onblur="return checkuser()" class="text" type="text"
						placeholder="邮箱地址/手机号码" name="username" id="username" /> <span
						class="userprompt" id="userprompt"></span>
					</label>
					 <input type="hidden" value="<%=num2%>" name="reg" />
					<p class="user">密码</p>
					<label> <input onfocus="return checkpsd2()"
						onblur="return checkpsd()" class="text" type="password"
						placeholder="6-16位密码，区分大小写" name="password" id="psd" /> <span
						class="psdprompt" id="psdprompt"></span>
					</label>
					<p class="user">确认密码</p>
					<label> <input onfocus="return checkrepsd2()"
						onblur="return checkrepsd()" class="text" type="password"
						placeholder="再次输入密码" name="rePassWord" id="repsd" /> <span
						class="repsdprompt" id="repsdprompt"></span>
					</label>
					<p class="user">验证码</p>
					<div class="regver">
						<label> <input class="regexpfirst" type="text"
							placeholder="请输入验证码" name="verfirst" id="regexp1" />
						</label> <img alt="验证码" src="ver.do" name="verimg"
							onclick="changeImg(this)" id="yzm" /> <input type="hidden"
							value="" id="verimgone" />
					</div>
					<span class="regprompt1" id="regprompt1"></span>
					<p class="user">手机号码</p>
					<label> <input value="${cookie.stelnum.value }" onfocus="return checktel2()"
						onblur="return checktel()" class="text" type="text"
						placeholder="11位数手机号码" name="telnum" id="telnum" /> <span
						class="telprompt" id="telprompt"></span>
					</label>
					
					<p class="user">短信验证</p>
					<label> <input class="regexp" type="text"
						placeholder="请输入验证码" name="regexp2" id="regexp2" /> <input
						class="getregexp" type="button" value="获取验证码" /> <span
						class="regprompt2" id="regprompt2"></span>
					</label> <input class="signbut" type="submit" value="注  册" name="sign"
						id="sign" />
					<div class="mycheck">
						<input type="checkbox" name="chb" id="chb" value="1"
							checked="checked" /> <label for="chb"></label>
					</div>
					<span> 用户勾选即代表同意REVOLVE用户注册协议和隐私政策 </span>
				</div>

			</form>
			</c:if>
			
			<c:if test="${empty cookie }">
			<form action="register.do" method="post" class="form"
				onsubmit="return checkinp()">
				<div class="content">
					<p class="reg">注&nbsp;&nbsp;册</p>
					<p class="user">账号</p>
					
					<label> <input onfocus="return checkuser2()"
						onblur="return checkuser()" class="text" type="text"
						placeholder="邮箱地址/手机号码" name="username" id="username" /> <span
						class="userprompt" id="userprompt"></span>
					</label>
					 <input type="hidden" value="<%=num2%>" name="reg" />
					<p class="user">密码</p>
					<label> <input onfocus="return checkpsd2()"
						onblur="return checkpsd()" class="text" type="password"
						placeholder="6-16位密码，区分大小写" name="password" id="psd" /> <span
						class="psdprompt" id="psdprompt"></span>
					</label>
					<p class="user">确认密码</p>
					<label> <input onfocus="return checkrepsd2()"
						onblur="return checkrepsd()" class="text" type="password"
						placeholder="再次输入密码" name="rePassWord" id="repsd" /> <span
						class="repsdprompt" id="repsdprompt"></span>
					</label>
					<p class="user">验证码</p>
					<div class="regver">
						<label> <input class="regexpfirst" type="text"
							placeholder="请输入验证码" name="verfirst" id="regexp1" />
						</label> <img alt="验证码" src="ver.do" name="verimg"
							onclick="changeImg(this)" id="yzm" /> <input type="hidden"
							value="" id="verimgone" />
					</div>
					<span class="regprompt1" id="regprompt1"></span>
					<p class="user">手机号码</p>
					<label> <input onfocus="return checktel2()"
						onblur="return checktel()" class="text" type="text"
						placeholder="11位数手机号码" name="telnum" id="telnum" /> <span
						class="telprompt" id="telprompt"></span>
					</label>
					
					<p class="user">短信验证</p>
					<label> <input class="regexp" type="text"
						placeholder="请输入验证码" name="regexp2" id="regexp2" /> <input
						class="getregexp" type="button" value="获取验证码" /> <span
						class="regprompt2" id="regprompt2"></span>
					</label> <input class="signbut" type="submit" value="注  册" name="sign"
						id="sign" />
					<div class="mycheck">
						<input type="checkbox" name="chb" id="chb" value="1"
							checked="checked" /> <label for="chb"></label>
					</div>
					<span> 用户勾选即代表同意REVOLVE用户注册协议和隐私政策 </span>
				</div>

			</form>
			</c:if>
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
<script>
	//对悬浮窗的设置
	function validatelt(inputelement, err) {
		if (inputelement.validity.patternMismatch) {
			inputelement.setCustomValidity(err);
		//错误后就清空，不过执行顺序有点问题就不要了
		//                if(confirm("输入有误,是否清空此项？")){
		//                    inputelement.value="";
		//                }
		} else {
			inputelement.setCustomValidity("");
			return true;
		}
	}
</script>
</html>