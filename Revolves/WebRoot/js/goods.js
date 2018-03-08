$(function() {
	$(".con").hover(function() {
		$(this).find(".txt").css("display", "block");
	}, function() {
		$(this).find(".txt").css("display", "none");
	})
});

//分页功能
(function($, window, document, undefined) {
	
	function Paging(element, options) {
		this.element = element;
	
		this.options = {
			pageNo: 1,
			totalPage: options.totalPage,
			totalSize:options.totalSize,
			callback:options.callback
		};
	
		this.init();
	}

	Paging.prototype = {
		constructor: Paging,
		init: function() {
			this.creatHtml();
			this.bindEvent();
		},
		creatHtml: function() {
			var me = this;
			var content = "";
			var current = me.options.pageNo;
			var total = me.options.totalPage;
//			var totalNum = me.options.totalSize;
			content += "<a id='prePage'><img src='../img/goodsimages/arrows2.png' alt='页码'></a>";
		
			if(total > 6) {
				
				if(current < 5) {
					for(var i = 1; i < 6; i++) {
						if(current == i) {
							content += "<a class='current'>" + i + "</a>";
						} else {
							content += "<a>" + i + "</a>";
						}
					}
					content += ". . .";
					content += "<a>"+total+"</a>";
				} else {
					 
					if(current < total - 3) {
						for(var i = current - 2; i < current + 3; i++) {
							if(current == i) {
								content += "<a class='current'>" + i + "</a>";
							} else {
								content += "<a>" + i + "</a>";
							}
						}
						content += ". . .";
						content += "<a>"+total+"</a>";
			
					} else {
						content += "<a>1</a>";
						content += ". . .";
						for(var i = total - 4; i < total + 1; i++) {
							if(current == i) {
								content += "<a class='current'>" + i + "</a>";
							} else {
								content += "<a>" + i + "</a>";
							}
						}
					}
				}
	
			} else {
				for(var i = 1; i < total + 1; i++) {
					if(current == i) {
						content += "<a class='current'>" + i + "</a>";
					} else {
						content += "<a>" + i + "</a>";
					}
				}
			}
			content += "<a id='nextPage'><img src='../img/goodsimages/arrows1.png' alt='页码'></a>";
//			content += "<a id=\"lastPage\">尾页</a>";
//			content += "<span class='totalPages'> 共<span>"+total+"</span>页</span>";
//			content += "<span class='totalSize'> 共<span>"+totalNum+"</span>条记录</span>";
			me.element.html(content);
		},

		bindEvent: function() {
			var me = this;
			me.element.on('click', 'a', function() {
				var num = $(this).html();
				var id=$(this).attr("id");
				if(id == "prePage") {
					if(me.options.pageNo == 1) {
						me.options.pageNo = 1;
					} else {
						me.options.pageNo = +me.options.pageNo - 1;
					}
				} else if(id == "nextPage") {
					if(me.options.pageNo == me.options.totalPage) {
						me.options.pageNo = me.options.totalPage
					} else {
						me.options.pageNo = +me.options.pageNo + 1;
					}

				} else if(num == "Go") {
					var ipt = +me.element.find('input').val();
					if(ipt && ipt <= me.options.totalPage && ipt != me.options.pageNo) {
						me.options.pageNo = ipt;
					}
				}else if(id =="firstPage") {
					me.options.pageNo = 1;
				} else if(id =="lastPage") {
					me.options.pageNo = me.options.totalPage;
				}else{
					me.options.pageNo = +num;
				}
				me.creatHtml();
				if(me.options.callback) {
					me.options.callback(me.options.pageNo);
				}
			});
		}
	};

	$.fn.paging = function(options) {
		return new Paging($(this), options);
	}
})(jQuery, window, document);








//判断验证码
function checkver2(){
	var regprompt=document.getElementById("regprompt1");
	var verinp=document.getElementById("regexp1");
	if(verinp.value=="") {
		regprompt.innerHTML = "<font color='limegreen'>请输入验证码!</font>";
	}
	
	
}

function checkver() {
	var b=false;
	//要显示的提示信息
	var regprompt=document.getElementById("regprompt1");
	var verinp=document.getElementById("regexp1");
	var verimgone=document.getElementById("verimgone");
	//手机号码的正则
	if(!verimgone.value!=verinp.value) {
		alert(verimgone.value);
		verinp.className = "change3";
		regprompt.innerHTML = "<font color='#F95858'>验证码输入错误!</font>";
	} else {
		verinp.className = "change4";
		regprompt.innerHTML = "";
		b=true;
	}
	return b;
}


//验证表单
function checkinp() {
	var user=checkuser(),
	 	psd=checkpsd(),
	 	tel=checktel(),
	 	repsd=checkrepsd();

	if(user&&psd&&tel&&repsd){
		return true;
	}else{
		return false;
	}
}


//第二次密码验证1||repsd.value==""
function checkrepsd(){
	var psd = document.getElementById("psd");
	var repsd = document.getElementById("repsd");
	//要显示的提示信息
	var psdprompt = document.getElementById("psdprompt");
	var repsdprompt = document.getElementById("repsdprompt");
	var b=false;
		if(psd.value!=repsd.value) {
			repsd.className = "change1";
			repsdprompt.innerHTML = "<font color='#F95858'>两次输入密码不一致!请重新输入!</font>";
		}else{
			repsd.className = "change2";
			repsdprompt.innerHTML = "";
			b=true;
		}
	return b;
}
//第二次密码验证2
function checkrepsd2(){
	var repsd = document.getElementById("repsd");
	//要显示的提示信息
	var repsdprompt = document.getElementById("repsdprompt");
	if(repsd.value==""){
		repsdprompt.innerHTML = "<font color='limegreen'>再次输入密码:与第一次密码保持一致!</font>";
	}
}



//第一次密码验证1
function checkpsd(){
	var psd = document.getElementById("psd");
	var repsd = document.getElementById("repsd");
	//要显示的提示信息
	var psdprompt = document.getElementById("psdprompt");
	var repsdprompt = document.getElementById("repsdprompt");
	var b=false;
		if(psd.value.length<6||psd.value.length>16) {
			psd.className = "change1";
			psdprompt.innerHTML = "<font color='#F95858'>密码格式错误！请重新输入！</font>";
		}else{
			psd.className = "change2";
			psdprompt.innerHTML = "";
			b=true;
		}
	return b;
}
//第一次密码验证2
function checkpsd2(){
	var psd = document.getElementById("psd");
	//要显示的提示信息
	var psdprompt = document.getElementById("psdprompt");
	if(psd.value==""){
		psdprompt.innerHTML = "<font color='limegreen'>请输入密码:6-16位密码，区分大小写</font>";
	}
}




//用户名验证2
function checkuser2(){
	var username = document.getElementById("username");
	var userprompt = document.getElementById("userprompt");
	if(username.value==""){
		userprompt.innerHTML = "<font color='limegreen'>请输入用户名:邮箱地址/手机号码</font>";
	}
}
//判断用户名1
function checkuser() {
	var username = document.getElementById("username");
	var psd = document.getElementById("psd");
	var repsd = document.getElementById("repsd");
	var regexp1 = document.getElementById("repsd");
	var telnum = document.getElementById("repsd");
	var regexp2 = document.getElementById("repsd");
	var b=false;
	//要显示的提示信息
	var userprompt = document.getElementById("userprompt");
	var psdprompt = document.getElementById("psdprompt");
	var emailreg = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	var telreg = /^((1[3,5,8][0-9])|(14[5,7,9])|(17[0,6,7,8])|(18[0-9]))\d{8}$/;
	
	if(!emailreg.test(username.value) && !telreg.test(username.value)) {
		username.className = "change1";
		userprompt.innerHTML = "<font color='#F95858'>邮箱或者手机格式错误!请重新输入!</font>";
	} else {
		username.className = "change2";
		userprompt.innerHTML = "";
		b=true;
	}
	return b;
}


//判断手机号码1
function checktel() {
	var telnum = document.getElementById("telnum");
	var b=false;
	//要显示的提示信息
	var telprompt = document.getElementById("telprompt");
	//手机号码的正则
	var telreg = /^((1[3,5,8][0-9])|(14[5,7,9])|(17[0,6,7,8])|(18[0-9]))\d{8}$/;
	if(!telreg.test(telnum.value)) {
		telnum.className = "change1";
		telprompt.innerHTML = "<font color='#F95858'>手机号码格式错误!请重新输入!</font>";
	} else {
		telnum.className = "change2";
		telprompt.innerHTML = "";
		b=true;
	}
	return b;
}

//判断手机号码2
function checktel2() {
	var telnum = document.getElementById("telnum");
	var b=false;
	//要显示的提示信息
	var telprompt = document.getElementById("telprompt");
	//手机号码的正则
	var telreg = /((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
	if(telnum.value==""){
		telprompt.innerHTML = "<font color='limegreen'>请输入手机号码!</font>";
	}
	return b;
}