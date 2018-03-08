function checkall() {
	var user=checkname2(),
		code=checkcode(),
		province=checkprovince(),
		city=checkcity(),
		detailaddr=checkdetailaddr(),
		telnum=checktelnum();
	if(user&&code&&province&&city&&detailaddr&&telnum){
		return true;
	}else{
		return false;
	}
}

function checkbox1() {
	var chb = document.getElementById("chb");
	//要显示的提示信息
	var b=false;
	if(chb.checked==false){
		b=true;
	}else{
		b=false;
	}
	return b;
}


function checkname() {
	var name = document.getElementById("name");
	//要显示的提示信息
	var nameprompt = document.getElementById("nameprompt");
	if(name.value==""){
		nameprompt.innerHTML = "<font color='limegreen'>请输入姓名!</font>";
	}
}

function checkname2() {
	var name = document.getElementById("name");
	var b=false;
	//要显示的提示信息
	var nameprompt = document.getElementById("nameprompt");
	if(name.value==""){
		name.className = "change1";
		nameprompt.innerHTML = "<font color='#F95858'>姓名不能为空!</font>";
	} else {
		name.className = "change2";
		nameprompt.innerHTML = "";
		b=true;
	}
	return b;
}


function checkprovince() {
	var b=false;
	//要显示的提示信息
	var provinceprompt = document.getElementById("provinceprompt");
	if(document.creator["province"].value==""){
		provinceprompt.innerHTML = "<font color='#F95858'>请选择省份</font>";
	}else{
		provinceprompt.innerHTML = "";
		b=true;
	}
	return b;
}


function checkcity() {
	var b=false;
	//要显示的提示信息
	var cityprompt = document.getElementById("cityprompt");
	if(document.creator["city"].value==""){
		cityprompt.innerHTML = "<font color='#F95858'>请选择市县!</font>";
	}else{
		cityprompt.innerHTML = "";
		b=true;
	}
	return b;
}





function checkdetailaddr() {
	
	var b=false;
	var detailaddr = document.getElementById("detailaddr");
	//要显示的提示信息
	var detailaddrprompt = document.getElementById("detailaddrprompt");
	if(detailaddr.value==""){
		detailaddrprompt.innerHTML = "<font color='#F95858'>请输入详细地址!</font>";
	}else{
		detailaddrprompt.innerHTML = "";
		b=true;
	}
	return b;
}


function checkcode2() {
	var code = document.getElementById("code");
	//要显示的提示信息
	var codeprompt = document.getElementById("codeprompt");
	if(code.value==""){
		codeprompt.innerHTML = "<font color='limegreen'>请输入邮编!</font>";
	}
}

function checkcode() {
	var b=false;
	var code = document.getElementById("code");
	//要显示的提示信息
	var codeprompt = document.getElementById("codeprompt");
	var codereg =/\d{6}/;
	if(!codereg.test(code.value)){
		codeprompt.innerHTML = "<font color='#F95858'>请输入正确的邮编!</font>";
	}else{
		codeprompt.innerHTML ="";
		b=true;
	}
	return b;
}

//判断手机号码1
function checktelnum() {
	var telnum = document.getElementById("telnum");
	var b=false;
	//要显示的提示信息
	var telnumprompt = document.getElementById("telnumprompt");
	//手机号码的正则
	var telreg = /^((1[3,5,8][0-9])|(14[5,7,9])|(17[0,6,7,8])|(18[0-9]))\d{8}$/;
	if(!telreg.test(telnum.value)) {
		telnum.className = "change1";
		telnumprompt.innerHTML = "<font color='#F95858'>手机号码格式错误!请重新输入!</font>";
	} else {
		telnum.className = "change2";
		telnumprompt.innerHTML = "";
		b=true;
	}
	return b;
}

//判断手机号码2
function checktelnum2() {
	var telnum = document.getElementById("telnum");
	//要显示的提示信息
	var telnumprompt = document.getElementById("telnumprompt");
	//手机号码的正则
	if(telnum.value==""){
		telnumprompt.innerHTML = "<font color='limegreen'>请输入手机号码!</font>";
	}
}