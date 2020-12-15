var gloabalChatInfo = {};//全局本地缓存变量
function initChatTabList(){
	var tips = layer.msg('会话列表从本地加载成功！');
	var allChatTapInfo = getALLChatTapInfoFromLocal();
	gloabalChatInfo = allChatTapInfo;
	for(var k in allChatTapInfo){
		if(allChatTapInfo[k].type == 'single'){
			createChatTab(allChatTapInfo[k],false);
			continue;
		}
		createGroupChatTab(allChatTapInfo[k],false)
	}
	//默认选中第一个
	$("div#chat-list-tab>a.nav-link").eq(0).trigger('click');
	//消息拉倒最下面
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight;
}
//创建一个单人聊天会话
function createChatTab(option,isAdd){
	var html = '<a class="nav-link single-chat" id="chat-'+option.friendId+'-tab" onclick="clickChatTab('+option.friendId+')" data-toggle="pill" href="#chat-first" role="tab" aria-controls="chat-first" aria-selected="false" data-id="'+option.friendId+'">';
	html += '<div class="media"> ';
	html += '<div class="user-status '+option.accountStatus+'" data-id="'+option.friendId+'"></div>';
	html += '<img class="align-self-center rounded-circle" src="'+option.picture+'" alt="User Image">';
	html += '<div class="media-body">';
	html += '<h5>'+option.username+'<span class="chat-timing">'+option.time+'</span></h5>';
	if(option.lastMsg.length > 15){
		option.lastMsg = option.lastMsg.substr(0,15)+'...';
	}
	html += '<p class="last-msg">'+option.lastMsg+'</p>';
	html += '</div></div></a>';
	$("#chat-list-tab").prepend(html);
	if(isAdd){
		setChatTapInfoToLocal(option);
		gloabalChatInfo[option.friendId] = option;
	}
}
//创建一个群聊天会话
function createGroupChatTab(option,isAdd){
	var html = '<a class="nav-link group-chat" id="group-chat-'+option.groupId+'-tab" onclick="clickGroupChatTab('+option.groupId+')" data-toggle="pill" href="#chat-first" role="tab" aria-controls="chat-first" aria-selected="false" data-id="'+option.groupId+'">';
	html += '<div class="media"> ';
	html += '<img class="align-self-center" src="/photo/view?filename='+option.picture+'" alt="User Image">';
	html += '<div class="media-body">';
	html += '<h5>'+option.groupName+'<span class="chat-timing">'+option.time+'</span></h5>';
	html += '<p class="last-msg">'+option.lastMsg+'</p>';
	html += '</div></div></a>';
	$("#chat-list-tab").prepend(html);
	if(isAdd){
		setGroupChatTapInfoToLocal(option);
		gloabalChatInfo['group_'+option.groupId] = option;
	}
}

//从本地中获取所有会话信息
function getALLChatTapInfoFromLocal(){
	var allChatTapInfo = localStorage.getItem('ylrc_chatonline_info_'+$("#current-online-user-id").val());
	if(allChatTapInfo == null){
		allChatTapInfo = {};
	}else{
		allChatTapInfo = JSON.parse(allChatTapInfo);
	}
	return allChatTapInfo;
}
//会话信息存入本地
function setChatTapInfoToLocal(option){
	var chatInfo = localStorage.getItem('ylrc_chatonline_info_'+$("#current-online-user-id").val());
	if(chatInfo == null){
		chatInfo = {};
	}else{
		chatInfo = JSON.parse(chatInfo);
	}
	updateDataToJson(chatInfo,option.friendId,option);
	localStorage.setItem('ylrc_chatonline_info_'+$("#current-online-user-id").val(),JSON.stringify(chatInfo));
}
//所有会话信息存入本地
function setAllChatTapInfoToLocal(allChatTapInfo){
	localStorage.setItem('ylrc_chatonline_info_'+$("#current-online-user-id").val(),JSON.stringify(allChatTapInfo));
}
//群聊会话信息存入本地
function setGroupChatTapInfoToLocal(option){
	var chatInfo = localStorage.getItem('ylrc_chatonline_info_'+$("#current-online-user-id").val());
	if(chatInfo == null){
		chatInfo = {};
	}else{
		chatInfo = JSON.parse(chatInfo);
	}
	updateDataToJson(chatInfo,'group_'+option.groupId,option);
	localStorage.setItem('ylrc_chatonline_info_'+$("#current-online-user-id").val(),JSON.stringify(chatInfo));
}
//获取当前会话信息
function getCurrentChatTab(id,type){
	if(type == 'single'){
    	return gloabalChatInfo[id];
    }
    if(type == 'group'){
    	return gloabalChatInfo['group_'+id];
    }
}
//设置当前会话信息
function setCurrentChatTab(id,type,curChatTabInfo){
	if(type == 'single'){
		gloabalChatInfo[id]= curChatTabInfo;
    	setChatTapInfoToLocal(curChatTabInfo);
    }
    if(type == 'group'){
    	gloabalChatInfo['group_'+id]= curChatTabInfo;
    	setGroupChatTapInfoToLocal(curChatTabInfo);
    }
}
//发送文本消息
function sendTextMsg(content,friendId,type){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showTextMsg(content,'check',time,'right',$("#show-user-name").text(),$("#user-center-img").attr('data-img'));
    var curChatTabInfo = getCurrentChatTab(friendId,type);
    var msgList = curChatTabInfo.msgList;
    if(msgList == null || msgList == 'undefined'){
    	msgList = [];
    }
    var msgInfo = {};
    msgInfo.content = content;
    msgInfo.type = 'text';
    msgInfo.time = time;
    msgInfo.status = 'check';
    msgInfo.show = 'right';
    msgList.push(msgInfo);
    curChatTabInfo.msgList = msgList;
    curChatTabInfo.time = time;
    curChatTabInfo.lastMsg = content;
    setCurrentChatTab(friendId,type,curChatTabInfo);
    $(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送图片消息
function sendImgMsg(content,img,friendId,type){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showImgMsg(content,img,'check',time,'right',$("#show-user-name").text(),$("#user-center-img").attr('data-img'));
	var curChatTabInfo = getCurrentChatTab(friendId,type);
	var msgList = curChatTabInfo.msgList;
	if(msgList == null || msgList == 'undefined'){
		msgList = [];
	}
	var msgInfo = {};
	msgInfo.content = content;
	msgInfo.type = 'img';
	msgInfo.img = img;
	msgInfo.time = time;
	msgInfo.status = 'check';
	msgInfo.show = 'right';
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[图片]'+content;
	setCurrentChatTab(friendId,type,curChatTabInfo);
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送文件消息
function sendFileMsg(content,filename,size,showImg,friendId,type){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showFileMsg(content,filename,size,showImg,'check',time,'right',$("#show-user-name").text(),$("#user-center-img").attr('data-img'));
	var curChatTabInfo = getCurrentChatTab(friendId,type);
	var msgList = curChatTabInfo.msgList;
	if(msgList == null || msgList == 'undefined'){
		msgList = [];
	}
	var msgInfo = {};
	msgInfo.content = content;
	msgInfo.type = 'file';
	msgInfo.filename = filename;
	msgInfo.size = size;
	msgInfo.showImg = showImg;
	msgInfo.time = time;
	msgInfo.status = 'check';
	msgInfo.show = 'right';
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[文件]'+content;
	setCurrentChatTab(friendId,type,curChatTabInfo);
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送音频消息
function sendAudioMsg(content,filename,friendId,type){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showAudioMsg(content,filename,'check',time,'right',$("#show-user-name").text(),$("#user-center-img").attr('data-img'));
	var curChatTabInfo = getCurrentChatTab(friendId,type);
	var msgList = curChatTabInfo.msgList;
	if(msgList == null || msgList == 'undefined'){
		msgList = [];
	}
	var msgInfo = {};
	msgInfo.content = content;
	msgInfo.type = 'audio';
	msgInfo.filename = filename;
	msgInfo.time = time;
	msgInfo.status = 'check';
	msgInfo.show = 'right';
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[音乐]'+content;
	setCurrentChatTab(friendId,type,curChatTabInfo);
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送视频消息
function sendVideoMsg(content,filename,friendId,type){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showVideoMsg(content,filename,'check',time,'right',$("#show-user-name").text(),$("#user-center-img").attr('data-img'));
	var curChatTabInfo = getCurrentChatTab(friendId,type);
	var msgList = curChatTabInfo.msgList;
	if(msgList == null || msgList == 'undefined'){
		msgList = [];
	}
	var msgInfo = {};
	msgInfo.content = content;
	msgInfo.type = 'video';
	msgInfo.filename = filename;
	msgInfo.time = time;
	msgInfo.status = 'check';
	msgInfo.show = 'right';
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[视频]'+content;
	setCurrentChatTab(friendId,type,curChatTabInfo);
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//显示消息
function showMsg(msg){
	var username = $("#show-user-name").text();
	var img = $("#user-center-img").attr('data-img');
	if(msg.show == 'left'){
		username = msg.username;
		img = msg.headPic;
	}
	switch(msg.type){
		case 'text':{
			showTextMsg(msg.content,msg.status,msg.time,msg.show,username,img);
			break;
		}
		case 'img':{
			showImgMsg(msg.content,msg.img,msg.status,msg.time,msg.show,username,img);
			break;
		}
		case 'file':{
			showFileMsg(msg.content,msg.filename,msg.size,msg.showImg,msg.status,msg.time,msg.show,username,img);
			break;
		}
		case 'audio':{
			showAudioMsg(msg.content,msg.filename,msg.status,msg.time,msg.show,username,img);
			break;
		}
		case 'video':{
			showVideoMsg(msg.content,msg.filename,msg.status,msg.time,msg.show,username,img);
			break;
		}
	}
	$('[data-toggle="tooltip"]').tooltip();
	$(".right-user-img").each(function(i,e){
		var height = $(e).next('div.chat-message-text').height();
		$(e).css({'margin-top':(parseInt(height)-20)+'px'});
	});
}
//显示文本消息
function showTextMsg(content,status,time,show,sender,senderImg){
	var html = '<div class="chat-message chat-message-'+show+'">';
	if(show == 'left'){
		html += '<img class="rounded-circle" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-right: 0.3rem;height: 2rem;width: 2rem;">';
	}else{
		html += '<img class="rounded-circle right-user-img" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-left: 0.3rem;height: 2rem;width: 2rem;float:right;">';
	}
    html += '<div class="chat-message-text" style="max-width:256px;">';
    html += '<span>'+content+'</span>';
    html += '</div>';
    html += '<div class="chat-message-meta">';
    html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
    html += '</div></div>';
    $("#chat-first").find("div.empty-screen").remove();
    $("#chat-first").append(html);
    
    
}
//显示图片消息
function showImgMsg(content,img,status,time,show,sender,senderImg){
	var html = '<div class="chat-message chat-message-'+show+'">';
	if(show == 'left'){
		html += '<img class="rounded-circle" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-right: 0.3rem;height: 2rem;width: 2rem;">';
	}else{
		html += '<img class="rounded-circle right-user-img" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-left: 0.3rem;height: 2rem;width: 2rem;float:right;">';
	}
	html += '<div class="chat-message-text">';
	html += '<ul class="list-inline message-media">';
	html += '<li class="list-inline-item">';
	html += '<img src="/photo/view?filename='+img+'" width="100px" height="100px" class="img-fluid" alt="media" onclick="prewImg(this)">';
	html += '</li></ul>';
	html += '<span style="word-wrap:break-word;">'+content+'</span>';
	html += '</div>';
	html += '<div class="chat-message-meta">';
	html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
	html += '</div></div>';
	$("#chat-first").find("div.empty-screen").remove();
	$("#chat-first").append(html);
}
//显示文件消息
function showFileMsg(content,filename,size,showImg,status,time,show,sender,senderImg){
	var html = '<div class="chat-message chat-message-'+show+'">';
	if(show == 'left'){
		html += '<img class="rounded-circle" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-right: 0.3rem;height: 2rem;width: 2rem;">';
	}else{
		html += '<img class="rounded-circle right-user-img" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-left: 0.3rem;height: 2rem;width: 2rem;float:right;">';
	}
	html += '<div class="chat-message-text">';
	html += '<ul class="list-unstyled message-document">';
	html += '<li class="media">';
	html += '<img src="'+showImg+'" class="align-self-center img-fluid mr-2" alt="doc">';
	html += '<div class="media-body">';
	if(show == 'left'){
		html += '<h5><a style="color:#4c595f;" href="/download/download_file?filename='+filename+'&downloadname='+content.substring(0,content.lastIndexOf("."))+'">'+content+'</a></h5>';
	}else{
		html += '<h5><a href="/download/download_file?filename='+filename+'&downloadname='+content.substring(0,content.lastIndexOf("."))+'">'+content+'</a></h5>';
	}
	html += '<p>'+getFileSize(size)+'</p>';
	html += '</div></li></ul>';
	html += '</div>';
	html += '<div class="chat-message-meta">';
	html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
	html += '</div></div>';
	$("#chat-first").find("div.empty-screen").remove();
	$("#chat-first").append(html);
}
//显示音频消息
function showAudioMsg(content,filename,status,time,show,sender,senderImg){
	var html = '<div class="chat-message chat-message-'+show+'">';
	if(show == 'left'){
		html += '<img class="rounded-circle" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-right: 0.3rem;height: 2rem;width: 2rem;">';
	}else{
		html += '<img class="rounded-circle right-user-img" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-left: 0.3rem;height: 2rem;width: 2rem;float:right;">';
	}
	html += '<div class="chat-message-text">';
	html += '<div class="message-audio">';
	html += '<audio controls>';
	html += '<source src="/download/download_file?filename='+filename+'&downloadname='+content.substring(0,content.lastIndexOf("."))+'" type="audio/mpeg">';
	html += '</audio>';
	html += '</div>';
	html += '</div>';
	html += '<div class="chat-message-meta">';
	html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
	html += '</div></div>';
	$("#chat-first").find("div.empty-screen").remove();
	$("#chat-first").append(html);
}
//显示视频消息
function showVideoMsg(content,filename,status,time,show,sender,senderImg){
	var html = '<div class="chat-message chat-message-'+show+'">';
	if(show == 'left'){
		html += '<img class="rounded-circle" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-right: 0.3rem;height: 2rem;width: 2rem;">';
	}else{
		html += '<img class="rounded-circle right-user-img" data-toggle="tooltip" title="'+sender+'" src="/photo/view?filename='+senderImg+'" alt="Generic placeholder image" style="margin-left: 0.3rem;height: 2rem;width: 2rem;float:right;">';
	}
	html += '<div class="chat-message-text">';
	html += '<div class="message-video">';
	html += '<video width="210" controls >';
	html += '<source src="/download/download_file?filename='+filename+'&downloadname='+content.substring(0,content.lastIndexOf("."))+'" type="video/mp4">';
	html += '</video>';
	html += '</div>';
	html += '<span>'+content+'</span>';
	html += '</div>';
	html += '<div class="chat-message-meta">';
	html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
	html += '</div></div>';
	$("#chat-first").find("div.empty-screen").remove();
	$("#chat-first").append(html);
}
//从本地缓存加载聊天信息
function loadMsgFromLocal(friendId){
	var curChatTabInfo = gloabalChatInfo[friendId];
    var msgList = curChatTabInfo.msgList;
    if(msgList == null || msgList == 'undefined'){
    	showEmptyMsg();
    	return;
    }
    $("#chat-first").html('');
    //console.log(msgList);
    for(var i=0;i<msgList.length;i++){
    	showMsg(msgList[i],friendId);
    }
}
//从本地缓存加载群聊天信息
function loadGroupMsgFromLocal(groupId){
	var curChatTabInfo = gloabalChatInfo['group_'+groupId];
	var msgList = curChatTabInfo.msgList;
	if(msgList == null || msgList == 'undefined'){
		showEmptyMsg();
		return;
	}
	$("#chat-first").html('');
	//console.log(msgList);
	for(var i=0;i<msgList.length;i++){
		showMsg(msgList[i]);
	}
}
//显示空消息
function showEmptyMsg(){
	var html = '<div class="empty-screen">';
	html += '<img src="/home/images/empty-logo.png" class="img-fluid" alt="empty-logo">';
	html += '<h4 class="my-3">这里空空如也.</h4>';
    html +='</div>';
    $("#chat-first").html(html);
}
//显示最后一条消息
function showLastMsgTips(lastMsg,friendId,type){
	if(lastMsg.length > 15){
		lastMsg = lastMsg.substr(0,15)+'...';
	}
	if(type == 'single'){
		$("#chat-"+friendId+"-tab").find("p.last-msg").text(lastMsg);
		$("#chat-"+friendId+"-tab").find("span.chat-timing").text(dateFormat("HH:MM", new Date()));
	}
	if(type == 'group'){
		$("#group-chat-"+friendId+"-tab").find("p.last-msg").text(lastMsg);
		$("#group-chat-"+friendId+"-tab").find("span.chat-timing").text(dateFormat("HH:MM", new Date()));
	}
}
//清空消息记录
function clearMsg(id,type){
	var allChatTapInfo = getALLChatTapInfoFromLocal();
	if(type == 'group'){
		var currentChatTap = allChatTapInfo['group_'+id];
		currentChatTap.msgList = [];
		allChatTapInfo['group_'+id] = currentChatTap;
		gloabalChatInfo['group_'+id] = currentChatTap;
		setAllChatTapInfoToLocal(allChatTapInfo);
		clickGroupChatTab(id);
	}
	if(type == 'single'){
		var currentChatTap = allChatTapInfo[id];
		currentChatTap.msgList = [];
		allChatTapInfo[id] = currentChatTap;
		gloabalChatInfo[id] = currentChatTap;
		setAllChatTapInfoToLocal(allChatTapInfo);
		clickChatTab(id);
	}
	layer.msg('成功清除所有聊天缓存记录！');
}
//搜索
function searchInfo(text){
	var html = $("#chat-list-tab").html();
	$("#chat-list-tab").hide();
	$("#search-chat-list-tab").html('');
	$("#search-chat-list-tab").show();
	if(text == '' || text.trim() == ''){
		$("#chat-list-tab").show();
		$("#search-chat-list-tab").hide();
		return;
	}
	//首先搜索用户名
	$("#chat-list-tab>a.nav-link").each(function(i,e){
		if($(e).find("h5").text().search(text) != -1){
			//表示搜索到了,高亮显示名称
			var search = $(e).clone();
			var replaced = search.find("h5").html().replace(new RegExp(text, 'ig'),'<font color="red">' + text + '</font>');
			search.find("h5").html(replaced);
			$("#search-chat-list-tab").append(search.prop('outerHTML'));
		}
	});
	var msgList = searchMsgList(text);
	for(var i=0; i< msgList.length; i++){
		if(msgList[i].type == 'single'){
			if($("#search-chat-list-tab>a#chat-"+msgList[i].id+"-tab").length == 0){
				var search = $("#chat-list-tab>a#chat-"+msgList[i].id+"-tab").clone();
				var replaced = msgList[i].content.replace(new RegExp(text, 'ig'),'<font color="red">' + text + '</font>');
				search.find("p.last-msg").html(replaced);
				$("#search-chat-list-tab").append(search.prop('outerHTML'));
			}else{
				//表示已经存在
				var replaced = msgList[i].content.replace(new RegExp(text, 'ig'),'<font color="red">' + text + '</font>');
				$("#search-chat-list-tab>a#chat-"+msgList[i].id+"-tab").find("p.last-msg").html(replaced);
			}
		}
		if(msgList[i].type == 'group'){
			if($("#search-chat-list-tab>a#group-chat-"+msgList[i].id+"-tab").length == 0){
				var search = $("#chat-list-tab>a#group-chat-"+msgList[i].id+"-tab").clone();
				var replaced = msgList[i].content.replace(new RegExp(text, 'ig'),'<font color="red">' + text + '</font>');
				search.find("p.last-msg").html(replaced);
				$("#search-chat-list-tab").append(search.prop('outerHTML'));
			}else{
				//表示已经存在
				var replaced = msgList[i].content.replace(new RegExp(text, 'ig'),'<font color="red">' + text + '</font>');
				$("#search-chat-list-tab>a#group-chat-"+msgList[i].id+"-tab").find("p.last-msg").html(replaced);
			}
		}
	}
}
//搜索聊天记录
function searchMsgList(text){
	var ret = new Array();
	var index = 0;
	for(var key in gloabalChatInfo){
		var tab = gloabalChatInfo[key];
		if(tab.hasOwnProperty('msgList')){
			var msgList = tab.msgList;
			for(var i=0; i< msgList.length; i++){
				if(msgList[i].content.search(text) != -1){
					var msg = {};
					msg.id = tab.type == 'single' ? key : tab.groupId;
					msg.content = msgList[i].content;
					msg.type = tab.type;
					ret[index++] = msg;
				}
			}
		}
	}
	return ret;
}
//获取显示文件大小
function getFileSize(size){
	if(size < 1024){
		return size + 'B';
	}
	if(size > 1024 && size < 1024*1024){
		return (size/1024).toFixed(2) + 'KB';
	}
	if(size > 1024*1024 && size < 1024*1024*1024){
		return (size/1024/1024).toFixed(2) + 'MB';
	}
	return '大小超出范围';
}
//更新json对象
function updateDataToJson(data,k,v){
	// 如果 val 被忽略
    if(typeof v === "undefined") {
        // 删除属性
        delete data[k];
    }
    else {
        // 添加 或 修改
        data[k] = v;
    }
}
//预览图片
function prewImg(img){
	layer.open({
	  type: 1,
	  title: false,
	  closeBtn: 0,
	  area: ['auto'],
	  skin: 'layui-layer-nobg', //没有背景色
	  shadeClose: true,
	  content: '<img src="'+$(img).attr('src')+'" width="'+(window.innerWidth*0.6)+'px">'
	});
}