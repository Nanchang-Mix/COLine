var gloabalChatInfo = {};//全局本地缓存变量
function initChatTabList(){
	var tips = layer.msg('会话列表从本地加载成功！');
	var allChatTapInfo = getALLChatTapInfoFromCookie();
	gloabalChatInfo = allChatTapInfo;
	for(var k in allChatTapInfo){
		createChatTab(allChatTapInfo[k],false);
	}
	//默认选中第一个
	$("a.single-chat").eq(0).trigger('click');
	//消息拉倒最下面
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight;
}
//创建一个单人聊天会话
function createChatTab(option,isAdd){
	var html = '<a class="nav-link single-chat" id="chat-'+option.friendId+'-tab" onclick="clickChatTab('+option.friendId+')" data-toggle="pill" href="#chat-first" role="tab" aria-controls="chat-first" aria-selected="false">';
	html += '<div class="media"> ';
	html += '<div class="user-status '+option.accountStatus+'" data-id="'+option.friendId+'"></div>';
	html += '<img class="align-self-center rounded-circle" src="'+option.picture+'" alt="User Image">';
	html += '<div class="media-body">';
	html += '<h5>'+option.username+'<span class="chat-timing">'+option.time+'</span></h5>';
	html += '<p class="last-msg"></p>';
	html += '</div></div></a>';
	$("#chat-list-tab").prepend(html);
	if(isAdd){
		setChatTapInfoToCookie(option);
		gloabalChatInfo[option.friendId] = option;
	}
}
//从cookie中获取会话信息
function getChatTapInfoFromCookie(friendId){
	var chatTapInfo = $.JSONCookie('ylrc_chatonline_info');
	return chatTapInfo[friendId];
}
//从cookie中获取所有会话信息
function getALLChatTapInfoFromCookie(){
	var allChatTapInfo = $.JSONCookie('ylrc_chatonline_info');
	return allChatTapInfo;
}
//会话信息存入cookie
function setChatTapInfoToCookie(option){
	var chatInfo = $.JSONCookie('ylrc_chatonline_info');
	updateDataToJson(chatInfo,option.friendId,option);
	//console.log(chatInfo);
	$.JSONCookie('ylrc_chatonline_info',chatInfo,{ expires: 365 });
}
//发送文本消息
function sendTextMsg(content,friendId){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showTextMsg(content,'check',time,'right');
    var curChatTabInfo = gloabalChatInfo[friendId];
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
    gloabalChatInfo[friendId]= curChatTabInfo;
    $(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送图片消息
function sendImgMsg(content,img,friendId){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showImgMsg(content,img,'check',time,'right');
	var curChatTabInfo = gloabalChatInfo[friendId];
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
	gloabalChatInfo[friendId]= curChatTabInfo;
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送文件消息
function sendFileMsg(content,filename,size,showImg,friendId){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showFileMsg(content,filename,size,showImg,'check',time,'right');
	var curChatTabInfo = gloabalChatInfo[friendId];
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
	gloabalChatInfo[friendId]= curChatTabInfo;
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送音频消息
function sendAudioMsg(content,filename,friendId){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showAudioMsg(content,filename,'check',time,'right');
	var curChatTabInfo = gloabalChatInfo[friendId];
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
	gloabalChatInfo[friendId]= curChatTabInfo;
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//发送视频消息
function sendVideoMsg(content,filename,friendId){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	showVideoMsg(content,filename,'check',time,'right');
	var curChatTabInfo = gloabalChatInfo[friendId];
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
	gloabalChatInfo[friendId]= curChatTabInfo;
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//显示消息
function showMsg(msg){
	switch(msg.type){
		case 'text':{
			showTextMsg(msg.content,msg.status,msg.time,msg.show);
			break;
		}
		case 'img':{
			showImgMsg(msg.content,msg.img,msg.status,msg.time,msg.show);
			break;
		}
		case 'file':{
			showFileMsg(msg.content,msg.filename,msg.size,msg.showImg,msg.status,msg.time,msg.show);
			break;
		}
		case 'audio':{
			showAudioMsg(msg.content,msg.filename,msg.status,msg.time,msg.show);
			break;
		}
		case 'video':{
			showVideoMsg(msg.content,msg.filename,msg.status,msg.time,msg.show);
			break;
		}
	}
}
//显示文本消息
function showTextMsg(content,status,time,show){
	var html = '<div class="chat-message chat-message-'+show+'">';
    html += '<div class="chat-message-text">';
    html += '<span>'+content+'</span>';
    html += '</div>';
    html += '<div class="chat-message-meta">';
    html += '<span>'+time+'<i class="feather icon-'+status+' ml-2"></i></span>';
    html += '</div></div>';
    $("#chat-first").find("div.empty-screen").remove();
    $("#chat-first").append(html);
}
//显示图片消息
function showImgMsg(content,img,status,time,show){
	var html = '<div class="chat-message chat-message-'+show+'">';
	html += '<div class="chat-message-text">';
	html += '<ul class="list-inline message-media">';
	html += '<li class="list-inline-item">';
	html += '<img src="/photo/view?filename='+img+'" width="100px" height="100px" class="img-fluid" alt="media">';
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
function showFileMsg(content,filename,size,showImg,status,time,show){
	var html = '<div class="chat-message chat-message-'+show+'">';
	html += '<div class="chat-message-text">';
	html += '<ul class="list-unstyled message-document">';
	html += '<li class="media">';
	html += '<img src="'+showImg+'" class="align-self-center img-fluid mr-2" alt="doc">';
	html += '<div class="media-body">';
	html += '<h5><a href="/download/download_file?filename='+filename+'&downloadname='+content.substring(0,content.lastIndexOf("."))+'">'+content+'</a></h5>';
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
function showAudioMsg(content,filename,status,time,show){
	var html = '<div class="chat-message chat-message-'+show+'">';
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
function showVideoMsg(content,filename,status,time,show){
	var html = '<div class="chat-message chat-message-'+show+'">';
	html += '<div class="chat-message-text">';
	html += '<div class="message-video">';
	html += '<video width="210" controls autoplay="autoplay">';
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
function showLastMsgTips(lastMsg,friendId){
	if(lastMsg.length > 15){
		lastMsg = lastMsg.substr(0,15)+'...';
	}
	$("#chat-"+friendId+"-tab").find("p.last-msg").text(lastMsg);
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