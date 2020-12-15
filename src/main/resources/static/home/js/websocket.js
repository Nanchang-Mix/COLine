var connectTimes = 0;
function buildWebSocket(userid){
	var ws;
	if ("WebSocket" in window){
       // 打开一个 web socket
       ws = new WebSocket("ws://"+window.location.host+"/webSocket/"+userid);
       //成功建立连接
       ws.onopen = function(){
          // Web Socket 已连接上，使用 send() 方法发送数据
          layer.msg("已成功和服务器建立连接！");
       };
       //接受到信息 
       ws.onmessage = function (evt) { 
    	   var receivedMsg = evt.data;
          receivedMsg = JSON.parse(receivedMsg);
          //console.log(receivedMsg);
          //新消息提示
          newMsgTips(receivedMsg);
          //接受消息
          recieveMsg(receivedMsg);
          //会话页提示最后一条信息
          if(receivedMsg.chatType == 'single'){
        	  showLastMsgTips(receivedMsg.msg,receivedMsg.fromId,receivedMsg.chatType);
          }else if(receivedMsg.chatType == 'group'){
        	  showLastMsgTips(receivedMsg.msg,receivedMsg.toId,receivedMsg.chatType);
          }
       };
       //链接关闭时触发
       ws.onclose = function(){ 
          // 关闭 websocket
          layer.msg("连接已关闭!");
          if(connectTimes++ < 10){
        	  websocket = buildWebSocket(userid);
          }
       };
    }else{
       // 浏览器不支持 WebSocket
       alert("您的浏览器不支持 WebSocket,请换一个浏览器试试!");
    }
	return ws;
}
//发送消息到服务器
function sendMsg(ws,option){
	ws.send(JSON.stringify(option));
}
//接受消息
function recieveMsg(option){
	switch(option.msgType){
		case 'text':{
			recieveTextMsg(option.msg,option.fromId,option.toId,option.chatType,option.extAttr);
			break;
		}
		case 'img':{
			recieverImgMsg(option.msg,option.attachUrl,option.fromId,option.toId,option.chatType,option.extAttr);
			break;
		}
		case 'file':{
			var filename = option.attachUrl;
			var suffix = filename.substring(filename.lastIndexOf(".")+1,filename.length);
			recieverFileMsg(option.msg,option.attachUrl,option.attachSize,getPicBySuffix(suffix),option.fromId,option.toId,option.chatType,option.extAttr);
			break;
		}
		case 'audio':{
			recieverAudioMsg(option.msg,option.attachUrl,option.fromId,option.toId,option.chatType,option.extAttr);
			break;
		}
		case 'video':{
			recieverVideoMsg(option.msg,option.attachUrl,option.fromId,option.toId,option.chatType,option.extAttr);
			break;
		}
		case 'online':{
			recieverOnlineMsg(option);
			break;
		}
		case 'offline':{
			recieverOfflineMsg(option);
			break;
		}
		case 'refresh_friend_list':{
			refreshFriendListMsg(option);
			break;
		}
	}
}
//接受文本消息
function recieveTextMsg(content,friendId,toId,chatType,extAttr){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	preRecieverMsg(content,friendId,toId,chatType,time,'text','','','',extAttr);
    var curChatTabInfo = getCurrentChatTab(friendId,chatType);
    if(chatType == 'group'){
    	curChatTabInfo = getCurrentChatTab(toId,chatType);
    }
    var msgList = curChatTabInfo.msgList;
    if(msgList == null || msgList == 'undefined'){
    	msgList = [];
    }
    var msgInfo = {};
    msgInfo.content = content;
    msgInfo.type = 'text';
    msgInfo.time = time;
    msgInfo.status = 'check';
    msgInfo.show = 'left';
    var extAttArr = extAttr.split(';');
    msgInfo.username = extAttArr[0];
    msgInfo.headPic = extAttArr[1];
    msgList.push(msgInfo);
    curChatTabInfo.msgList = msgList;
    curChatTabInfo.time = time;
    curChatTabInfo.lastMsg = content;
    if(chatType == 'group'){
    	setCurrentChatTab(toId,chatType,curChatTabInfo);
    }else{
    	setCurrentChatTab(friendId,chatType,curChatTabInfo);
    }
    $(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//接受图片消息
function recieverImgMsg(content,img,friendId,toId,chatType,extAttr){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	preRecieverMsg(content,friendId,toId,chatType,time,'img',img,'','',extAttr);
    var curChatTabInfo = getCurrentChatTab(friendId,chatType);
    if(chatType == 'group'){
    	curChatTabInfo = getCurrentChatTab(toId,chatType);
    }
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
	msgInfo.show = 'left';
	var extAttArr = extAttr.split(';');
    msgInfo.username = extAttArr[0];
    msgInfo.headPic = extAttArr[1];
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[图片]'+content;
	if(chatType == 'group'){
    	setCurrentChatTab(toId,chatType,curChatTabInfo);
    }else{
    	setCurrentChatTab(friendId,chatType,curChatTabInfo);
    }
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//接受文件消息
function recieverFileMsg(content,filename,size,showImg,friendId,toId,chatType,extAttr){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	preRecieverMsg(content,friendId,toId,chatType,time,'file',showImg,size,filename,extAttr);
	var curChatTabInfo = getCurrentChatTab(friendId,chatType);
	if(chatType == 'group'){
    	curChatTabInfo = getCurrentChatTab(toId,chatType);
    }
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
	msgInfo.show = 'left';
	var extAttArr = extAttr.split(';');
    msgInfo.username = extAttArr[0];
    msgInfo.headPic = extAttArr[1];
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[文件]'+content;
	if(chatType == 'group'){
    	setCurrentChatTab(toId,chatType,curChatTabInfo);
    }else{
    	setCurrentChatTab(friendId,chatType,curChatTabInfo);
    }
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//接受音频消息
function recieverAudioMsg(content,filename,friendId,toId,chatType,extAttr){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	preRecieverMsg(content,friendId,toId,chatType,time,'audio','','',filename,extAttr);
	var curChatTabInfo = getCurrentChatTab(friendId,chatType);
	if(chatType == 'group'){
    	curChatTabInfo = getCurrentChatTab(toId,chatType);
    }
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
	msgInfo.show = 'left';
	var extAttArr = extAttr.split(';');
    msgInfo.username = extAttArr[0];
    msgInfo.headPic = extAttArr[1];
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[音乐]'+content;
	if(chatType == 'group'){
    	setCurrentChatTab(toId,chatType,curChatTabInfo);
    }else{
    	setCurrentChatTab(friendId,chatType,curChatTabInfo);
    }
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//接受视频消息
function recieverVideoMsg(content,filename,friendId,toId,chatType,extAttr){
	var time = dateFormat("YYYY-mm-dd HH:MM:SS", new Date());
	preRecieverMsg(content,friendId,toId,chatType,time,'video','','',filename,extAttr);
	var curChatTabInfo = getCurrentChatTab(friendId,chatType);
	if(chatType == 'group'){
    	curChatTabInfo = getCurrentChatTab(toId,chatType);
    }
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
	msgInfo.show = 'left';
	var extAttArr = extAttr.split(';');
    msgInfo.username = extAttArr[0];
    msgInfo.headPic = extAttArr[1];
	msgList.push(msgInfo);
	curChatTabInfo.msgList = msgList;
	curChatTabInfo.time = time;
	curChatTabInfo.lastMsg = '[视频]'+content;
	if(chatType == 'group'){
    	setCurrentChatTab(toId,chatType,curChatTabInfo);
    }else{
    	setCurrentChatTab(friendId,chatType,curChatTabInfo);
    }
	$(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
}
//接受上线提醒信息
function recieverOnlineMsg(option){
	$("#chat-"+option.fromId+"-tab").find("div.user-status").removeClass('status-offline').removeClass('status-away').addClass('active');
	if($("#chat-"+option.fromId+"-tab").hasClass('active')){
		$("#cur-chat-user-status").removeClass('status-offline').removeClass('status-away').addClass('active');
	}
	//更新本地缓存的状态
	var curChatTabInfo = getCurrentChatTab(option.fromId,'single');
	curChatTabInfo.accountStatus = 'active';
	setCurrentChatTab(option.fromId,'single',curChatTabInfo)
}
//接受下线提醒信息
function recieverOfflineMsg(option){
	$("#chat-"+option.fromId+"-tab").find("div.user-status").removeClass('active').removeClass('status-away').addClass('status-offline');
	if($("#chat-"+option.fromId+"-tab").hasClass('active')){
		$("#cur-chat-user-status").removeClass('active').removeClass('status-away').addClass('status-offline');
	}
	//更新本地缓存的状态
	var curChatTabInfo = getCurrentChatTab(option.fromId,'single');
	curChatTabInfo.accountStatus = 'status-offline';
	setCurrentChatTab(option.fromId,'single',curChatTabInfo)
}
//新消息提示
function newMsgTips(option){
	if($("#new-chat-"+option.fromId+"-tab").attr('data-msg-status') == '0'){
		if(option.msgType != 'online' && option.msgType != 'notice'){
			return;
		}
	}
	if($("#new-group-chat-"+option.toId+"-tab").attr('data-msg-status') == '0'){
		if(option.msgType != 'online' && option.msgType != 'notice'){
			return;
		}
	}
	var tips = '您有新的消息，请注意查收哦！';
	if($("#new-msg-is-show").prop('checked')){
		tips = option.msg;
	}
	if($("#new-msg-notification-sound").prop('checked')){
		playAudio('/home/audio/'+$("input.new-msg-tips-audio:checked").val());
	}
	if($("#new-msg-alert").prop('checked')){
		layer.open({
		  type: 1,
		  title: '新消息提醒'
		  ,offset: 'rb' //具体配置参考：offset参数项
		  ,content: '<div style="padding: 20px 80px;">'+tips+'</div>'
		  ,shade: 0 //不显示遮罩
		});
		return;
	}
	layer.msg(tips);
	if(option.hasOwnProperty('extAttr')){
		var extAttArr = option.extAttr.split(';');
		var icon = extAttArr[1];
	}else{
		icon = 'default.png'
	}
	if(option.msgType == 'img'){
		icon = option.attachUrl;
	}
	if(window.Notification && Notification.permission !== "denied") {
	    Notification.requestPermission(function(status) {
	        var n = new Notification('新消息提醒', { body: tips,icon: '/photo/view?filename='+icon });
	        setTimeout(function() { n.close(); }, 1500);
	    });
	}
}
//组建创建会话的数据
function buildChatTab(friendId,toId,chatType){
	var option = {};
	if(chatType == 'single'){
		var friend = $("#new-chat-" + friendId + "-tab");
		option.friendId = friendId;
		option.friendAccountId = friend.attr('account-id');
		option.username = friend.find("h5").text();
		option.accountStatus = friend.attr("account-status");
		option.picture = friend.find("img.headPic").attr('src');
		option.lastMsg = '';
		option.time = dateFormat("HH:MM", new Date());
		option.type = 'single';
		return option;
	}
	var groupChat = $("#new-group-chat-" + toId + "-tab");
	option.groupId = toId;
	option.groupName = groupChat.attr('groupname');
	option.peopleNum = groupChat.attr('grouppeople');
	option.picture = groupChat.attr('grouppicture');
	option.lastMsg = '';
	option.type = 'group';
	option.time = dateFormat("HH:MM", new Date());
	return option;
}
//收到消息预处理
function preRecieverMsg(content,friendId,toId,chatType,time,msgType,img,size,attach,extAttr){
	var extAttArr = extAttr.split(';');
	if(chatType == 'single'){
		//表示会话不存在，先创建会话
		if($("#chat-"+friendId+"-tab").length == 0){
			var option = buildChatTab(friendId,toId,chatType);
			createChatTab(option,true);
		}
	}
	if(chatType == 'group'){
		//表示会话不存在，先创建会话
		if($("#group-chat-"+toId+"-tab").length == 0){
			var option = buildChatTab(friendId,toId,chatType);
			createGroupChatTab(option,true);
		}
	}
	//会话存在，判断是不是当前焦点用户
	if(chatType == 'single'){
		if($("#chat-"+friendId+"-tab").hasClass('active')){
			if(msgType == 'text'){
				showTextMsg(content,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'img'){
				showImgMsg(content,img,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'file'){
				showFileMsg(content,attach,size,img,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'audio'){
				showAudioMsg(content,attach,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'video'){
				showVideoMsg(content,attach,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
		}else{
			//判断是否是消息免打扰
			if($("#new-chat-"+friendId+"-tab").attr('data-msg-status') == '0'){
				var chatTiming = $("#chat-"+friendId+"-tab").find('span.chat-timing');
				chatTiming.prev('span.unread-num').remove();
				chatTiming.before('<span class="badge badge-warning ml-2 unread-num">●</span>');
				return;
			}
			//只显示消息数量即可
			if($("#chat-"+friendId+"-tab").find('span.unread-num').length == 0){
				var chatTiming = $("#chat-"+friendId+"-tab").find('span.chat-timing');
				chatTiming.before('<span class="badge badge-danger ml-2 unread-num">1</span>');
			}else{
				var num = $("#chat-"+friendId+"-tab").find('span.unread-num').text();
				num = parseInt(num);
				$("#chat-"+friendId+"-tab").find('span.unread-num').text(num+1);
			}
		}
	}
	if(chatType == 'group'){
		if($("#group-chat-"+toId+"-tab").hasClass('active')){
			if(msgType == 'text'){
				showTextMsg(content,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'img'){
				showImgMsg(content,img,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'file'){
				showFileMsg(content,attach,size,img,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'audio'){
				showAudioMsg(content,attach,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
			if(msgType == 'video'){
				showVideoMsg(content,attach,'check',time,'left',extAttArr[0],extAttArr[1]);
			}
		}else{
			//判断是否是消息免打扰
			if($("#new-group-chat-"+toId+"-tab").attr('data-msg-status') == '0'){
				var chatTiming = $("#group-chat-"+toId+"-tab").find('span.chat-timing');
				chatTiming.prev('span.unread-num').remove();
				chatTiming.before('<span class="badge badge-warning ml-2 unread-num">●</span>');
				return;
			}
			//只显示消息数量即可
			if($("#group-chat-"+toId+"-tab").find('span.unread-num').length == 0){
				var chatTiming = $("#group-chat-"+toId+"-tab").find('span.chat-timing');
				chatTiming.before('<span class="badge badge-danger ml-2 unread-num">1</span>');
			}else{
				var num = $("#group-chat-"+toId+"-tab").find('span.unread-num').text();
				num = parseInt(num);
				$("#group-chat-"+toId+"-tab").find('span.unread-num').text(num+1);
			}
		}
	}
	$('[data-toggle="tooltip"]').tooltip();
}
//更新好友列表
function refreshFriendListMsg(option){
	//重新获取自己的好友列表
	getFriendList();
}