<#list friendList as friend>
<#if from == 0>
<a class="nav-link friend-account" id="new-chat-${friend.id}-tab" data-toggle="pill" href="#" role="tab" aria-selected="true" account-status="${friend.friendAccount.chatStatus}" account-id="${friend.friendAccount.id}" username="${friend.friendAccount.username}" sex="${friend.friendAccount.sex}" email="${friend.friendAccount.email!""}" mobile="${friend.friendAccount.mobile!""}" data-key="${friend.id}" data-msg-status="${friend.msgStatus}" data-status="${friend.status}" data-remark="${friend.remark!""}">
    <div class="media">
        <img class="align-self-center rounded-circle headPic" src="/photo/view?filename=${friend.friendAccount.headPic}" alt="User Image">
        <div class="media-body">
            <h5>${friend.remark!friend.friendAccount.username}</h5>
            <p>${friend.friendAccount.info!"此人很懒，什么也没写！"}</p>
        </div>
    </div>
</a>
<#else>
<li class="media">
    <img class="align-self-center rounded-circle" src="/photo/view?filename=${friend.friendAccount.headPic}" alt="Generic placeholder image">
    <div class="media-body">
        <h5><span>${friend.remark!friend.friendAccount.username}</span></h5>
        <p>${friend.friendAccount.info!"此人很懒，什么也没写！"}</p>
    </div>
    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input create-group-select-user" onclick="selectedUser()" id="user-${friend.friendAccount.id}-check" value="${friend.friendAccount.id}" username="${friend.friendAccount.username}" headPic="${friend.friendAccount.headPic}" aid="${friend.friendAccount.id}">
        <label class="custom-control-label" for="user-${friend.friendAccount.id}-check"></label>
    </div>
</li>
</#if>
</#list>
<#if from == 0>
<#list accountGroupMemberList as accountGroupMember>
<a class="nav-link group-account" id="new-group-chat-${accountGroupMember.accountGroup.id}-tab" data-toggle="pill" href="#" role="tab" aria-selected="true" group-id="${accountGroupMember.accountGroup.id}" groupname="${accountGroupMember.accountGroup.name}" grouppeople="${accountGroupMember.accountGroup.curPeople}" grouppicture="${accountGroupMember.accountGroup.picture}" data-msg-status="${accountGroupMember.msgStatus}">
    <div class="media">
        <img class="align-self-center headPic" src="/photo/view?filename=${accountGroupMember.accountGroup.picture}" alt="User Image">
        <div class="media-body">
            <h5>${accountGroupMember.accountGroup.name}<sup style="color:red;">【群聊】</sup></h5>
            <p>${accountGroupMember.accountGroup.info!"这群人很懒，聊什么也没写！"}</p>
        </div>
    </div>
</a>
</#list>
</#if>
<script>
//点击用户事件
$(".friend-account").click(function(){
	$("#view-user-info-pic").attr('src',$(this).find("img.headPic").attr('src'));
	$("#view-user-info-remark").text($(this).find("h5").text());
	$("#view-user-info-desc").text($(this).find("p").text());
	var sex = '';
	if($(this).attr("sex") == '1'){
		sex = '  ♂';
	}else if($(this).attr("sex") == '2'){
		sex = '  ♀';
	}
	sex = $(this).attr('username') + sex;
	$("#view-user-info-remark-edit").html('<i class="feather icon-info mr-2"></i>'+$(this).attr('data-remark')+'   <a href="javascript:void(0)" title="点击修改备注" onclick="updateFriend(true)"><i class="feather icon-edit mr-2"></i></a>');
	$("#view-user-info-username").html('<i class="feather icon-user mr-2"></i>'+sex);
	$("#view-user-info-email").html('<i class="feather icon-mail mr-2"></i>'+$(this).attr('email'));
	$("#view-user-info-tel").html('<i class="feather icon-phone-call mr-2"></i>'+$(this).attr('mobile'));
	$("#mute-notification-setting").prop('checked',($(this).attr('data-msg-status') == '0'))
	$("#block-friend-setting").prop('checked',($(this).attr('data-status') == '-1'))
	$("#focus-view-friend-id").val($(this).attr('data-key'));
	$("#focus-view-friend-account-id").val($(this).attr('account-id'));
	$("#focus-view-friend-id").attr('username',$(this).find("h5").text());
	$("#focus-view-friend-id").attr('status',$(this).attr("account-status"));
	$("#focus-view-friend-id").attr('picture',$(this).find("img.headPic").attr('src'));
	//$("#view-user-info").trigger('click');
	$("#view-chat-user-info").addClass("show");
    $(".chat-bottom").addClass("small");
    $("#view-chat-group-info").removeClass("show");
});
//创建群聊时选中用户事件
function selectedUser(){
	var html = '';
	$("input.create-group-select-user").each(function(i,e){
		if($(e).prop('checked')){
			var div = '<div class="avatar" aid="'+$(this).attr('aid')+'">';
			div += '<a href="#" data-toggle="tooltip" data-placement="top" title="'+$(this).attr('username')+'" data-original-title="'+$(this).attr('username')+'">';
			div += '<img src="/photo/view?filename='+$(this).attr('headPic')+'" alt="avatar" class="rounded-circle">';
			div += '</a></div>';
			html += div;
		}
	});
	$("#selected-chat-group-users").html(html);
	$('[data-toggle="tooltip"]').tooltip();
}
//更新联系人
function updateFriend(isRemark){
	var postData = {};
	postData.id = $("#focus-view-friend-id").val();
	postData.status = $("#block-friend-setting").prop('checked') ? -1 : 1;
	postData.msgStatus = $("#mute-notification-setting").prop('checked') ? 0 : 1;
	var showRemark = $("div.chat-user-body>div.user-detail>div.user-about>h6").eq(0);
	if(isRemark){
		var index = layer.prompt({title: '修改备注信息', formType: 3}, function(text, index){
		    layer.close(index);
		    postData.remark = text;
		    updateFriendReq(postData);
		 });
		  $('#layui-layer'+index + " .layui-layer-input").val(showRemark.text());
		  return;
	}
	updateFriendReq(postData);
}
function updateFriendReq(postData){
	ajaxRequest('update_friend','post',postData,function(data){
		layer.msg('修改成功！');
		$("#close-user-info").trigger('click');
		getFriendList();
		if(postData.remark != null && postData.remark != 'undefined'){
			//这里要去更新会话
			var allChatInfo = getALLChatTapInfoFromLocal();
			var chatTap = allChatInfo[postData.id];
			if(chatTap != null && chatTap != 'undefined'){
				chatTap.username = postData.remark;
			}
			setChatTapInfoToLocal(chatTap);
			$("#chat-"+postData.id+"-tab").find("h5").html(postData.remark + '<span class="chat-timing">'+dateFormat("HH:MM", new Date())+'</span>');
		}
	},function(data){
		layer.msg(data.msg);
	});
}
//点击群聊事件
$(".group-account").click(function(){
	$.get('view_group_info',{id:$(this).attr('group-id')},function(data,status,xhr){
		$("#view-chat-group-info").html(data);
		$('[data-toggle="tooltip"]').tooltip();
	});
	$("#view-chat-user-info").removeClass("show");
	$("#view-chat-group-info").addClass("show");
    $(".chat-bottom").addClass("small");
});
</script>