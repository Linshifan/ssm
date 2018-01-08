$(function() {
	/**
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".errorClass").each(function() {
		showError($(this));//遍历每个元素，使用每个元素来调用showError方法
	});
	
	/**
	 * 2. 切换注册按钮的图片
	 */
	$("#submitBtn").hover(
		function() {
			$("#submitBtn").attr("src", "/JustDoit/style/images/regist2.jpg");
		},
		function() {
			$("#submitBtn").attr("src", "/JustDoit/style/images/regist1.jpg");
		}
	);
	/**
	 * 输入框得到焦点隐藏时间
	 */
	$(".inputClass").focus(function(){
		var lableId = $(this).attr("id")+"Error";//得到lable的ID
		$("#"+lableId).text("");//把lable的内容清除
		showError($("#"+lableId));//隐藏没有错误信息的图片
	});
	/**
	 * 输入框失去焦点的事件
	 */
	$(".inputClass").blur(function(){
		var id = $(this).attr("id");//现获取id
		var fnName = "check"+id.substring(0,1).toUpperCase()+id.substring(1)+"()";//得到对应的校验函数名
		eval(fnName);//执行方法
	});
	
	$("#registForm").submit(function(){
		var bool = true;
		if(!checkLoginname()){
			bool = false;
		}
		if(!checkLoginpass()){
			bool = false;
		}
		if(!checkReloginpass()){
			bool = false;
		}
//		if(!checkLoginemail()){
//			bool = false;
//		}
//		if(!checkTel()){
//			bool = false;
//		}
		return bool;
	});
});

	/**
	 * 所有的校验方法{
	 * 校验姓名
	 * 校验密码
	 * 校验确认密码
	 * 校验图片验证码
	 * }
	 */
	function checkLoginname(){
		var id ="loginname";
		var value = $("#"+id).val();
		//非空校验
		if(!value){
			//获取对应的lable
			$("#"+id+"Error").text("用户名不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//长度校验
		if(value.length<3||value.length>20){
			//获取对应的lable
			$("#"+id+"Error").text("用户名长度必须在3-20位之间！");
			showError($("#"+id+"Error"));
			return false;
		}
		//是否已经注册校验
		$.ajax({
			url:"/JustDoit/ajaxLoginname",
			data:{"loginname":value},
			type:"POST",
			dataType:"json",
			async:false,
			cache:false,
			success:function(result){
				if(!result){//校验失败
					$("#"+id+"Error").text("用户名-已被注册！");
					showError($("#"+id+"Error"));
					return false;
				}
			}
		});
		
		return true;
	}
	
	
	function checkLoginemail(){
		var id ="loginemail";
		var value = $("#"+id).val();
		//非空校验
		if(!value){
			//获取对应的lable
			$("#"+id+"Error").text("邮箱不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//长度校验
		if(value.length<9||value.length>30){
			//获取对应的lable
			$("#"+id+"Error").text("密码长度必须在9-30位之间！");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}
	
	
	function checkTel(){
		var id ="tel";
		var value = $("#"+id).val();
		//非空校验
		if(!value){
			//获取对应的lable
			$("#"+id+"Error").text("电话不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//长度校验
		if(value.length!=11){
			//获取对应的lable
			$("#"+id+"Error").text("电话必须要11位！");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}
	
	
	function checkLoginpass(){
		var id ="loginpass";
		var value = $("#"+id).val();
		//非空校验
		if(!value){
			//获取对应的lable
			$("#"+id+"Error").text("密码不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//长度校验
		if(value.length<3||value.length>20){
			//获取对应的lable
			$("#"+id+"Error").text("密码长度必须在3-20位之间！");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}
	function checkReloginpass(){
		var id ="reloginpass";
		var value = $("#"+id).val();
		//非空校验
		if(!value){
			//获取对应的lable
			$("#"+id+"Error").text("确认密码不能为空！");
			showError($("#"+id+"Error"));
			return false;
		}
		//与密码是否相同校验
		if(value != $("#loginpass").val()){
			$("#"+id+"Error").text("与设立的密码不相同！");
			showError($("#"+id+"Error"));
			return false;
		}
		return true;
	}

/**
 * 判断当前元素是否存在内容，如果存在显示，不页面不显示！
 */
function showError(ele) {
	var text = ele.text();//获取元素的内容
	if(!text) {//如果没有内容
		ele.css("display", "none");//隐藏元素
	} else {//如果有内容
		ele.css("display", "");//显示元素
	}
}



