//统一图片上传方法
function uploadFileToServer(fileInputId,successCallback,errorCallback){
	//formdata
	var formData = new FormData();
	formData.append('photo',document.getElementById(fileInputId).files[0]);
	$.ajax({
		url:'/upload/upload_photo',
		contentType:false,
		processData:false,
		data:formData,
		type:'POST',
		success:function(data){
				if(data.code == 0){
					successCallback(data);
				}else{
					errorCallback(data);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
	});
}
//统一多文件上传方法
function uploadMuiltFileToServer(url,formData,successCallback,errorCallback){
		$.ajax({
			url:url,
			contentType:false,
			processData:false,
			data:formData,
			async:false,
			type:'POST',
			success:function(data){
				if(data.code == 0){
					successCallback(data);
				}else{
					errorCallback(data);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
}
//统一ajax请求
function ajaxRequest(url,requestType,data,successCallback,errorCallback){
	$.ajax({
		url:url,
		type:requestType,
		data:data,
		dataType:'json',
		success:function(rst){
			if(rst.code == 0){
				successCallback(rst);
			}else{
				errorCallback(rst);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
//时间格式化
function dateFormat(fmt, date) {
    let ret;
    const opt = {
        "Y+": date.getFullYear().toString(),        // 年
        "m+": (date.getMonth() + 1).toString(),     // 月
        "d+": date.getDate().toString(),            // 日
        "H+": date.getHours().toString(),           // 时
        "M+": date.getMinutes().toString(),         // 分
        "S+": date.getSeconds().toString()          // 秒
        // 有其他格式化字符需求可以继续添加，必须转化成字符串
    };
    for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
            fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
        };
    };
    return fmt;
}
//判断obj是否为json对象
function isJson(obj){
	var isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length; 
	return isjson;
}
//移除重复绑定的事件
function removeGroupMemberListEvent(){
	$("#add-group-users-submit-btn").off('click');
	$("#reduce-group-users-submit-btn").off('click');
}
//播放语音
function playAudio(url){
	var audioElement = document.createElement('audio');
    audioElement.setAttribute('src', url);
    audioElement.setAttribute('autoplay', 'autoplay'); //打开自动播放
    audioElement.play();
}
//根据文件后缀获取文件封面
function getPicBySuffix(suffix){
	if(suffix == 'doc' || suffix == 'docx'){
		return '/home/images/word.svg';
	}
	if(suffix == 'zip' || suffix == 'rar' || suffix == '7z' || suffix == 'tar' || suffix == 'gzip' || suffix == 'gz'){
		return '/home/images/zip.svg';
	}
	if(suffix == 'xls' || suffix == 'xlsx'){
		return '/home/images/excel.svg';
	}
	if(suffix == 'pdf'){
		return '/home/images/pdf.svg';
	}
	if(suffix == 'txt'){
		return '/home/images/txt.svg';
	}
	if(suffix == 'csv'){
		return '/home/images/csv.svg';
	}
	if(suffix == 'ppt' || suffix == 'pptx'){
		return '/home/images/ppt.svg';
	}
	if(suffix == 'csv'){
		return '/home/images/csv.svg';
	}
	return '/home/images/unknow.svg';
}
$("#order-auth-btn").click(function(){
	//询问框
	layer.confirm('请先登录到后台首页，点击验证按钮完成验证后刷新该页面，版权信息就会自动删除了！', {
	  btn: ['去登录后台验证','等会再说'] //按钮
	}, function(){
	    window.location.href = '/system/login';
		},function(data){
			
		}
	);

	
});