<#if from == 0>
<#list friendList as friend>
<li class="media" style="border-bottom: 1px solid rgba(0, 0, 0, 0.03);">
    <img class="align-self-center rounded-circle" src="/photo/view?filename=${friend.friendAccount.headPic!"default.png"}" alt="Generic placeholder image">
    <div class="media-body">
        <h5><span>${friend.remark}</span></h5>
        <p>${friend.friendAccount.info!"这个人很懒，什么也没留下"}</p>
    </div>
    <#if groupMemberIds?seq_contains(friend.friendAccount.id)>
    <div class="custom-control" style="padding-top:16px;">
        <font color="green">已是群成员</font>
    </div>
    <#else>
    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input add-group-user-select" value="${friend.friendAccount.id}" id="user-group-add-${friend.friendAccount.id}">
        <label class="custom-control-label" for="user-group-add-${friend.friendAccount.id}"></label>
    </div>
    </#if>
</li>
</#list>
</#if>
<#if from == 1>
<#list accountGroupMemberList as accountGroupMember>
<li class="media" style="border-bottom: 1px solid rgba(0, 0, 0, 0.03);">
    <img class="align-self-center rounded-circle" src="/photo/view?filename=${accountGroupMember.member.headPic!"default.png"}" alt="Generic placeholder image">
    <div class="media-body">
        <h5><span>${accountGroupMember.nickname}</span></h5>
        <p>${accountGroupMember.member.info!"这个人很懒，什么也没留下"}</p>
    </div>
    <div class="custom-control custom-checkbox">
        <input type="checkbox" <#if ylrc_account.id == accountGroupMember.member.id>disabled="disabled"</#if> class="custom-control-input reduce-group-user-select" value="${accountGroupMember.id}" id="user-group-reduce-${accountGroupMember.id}">
        <label class="custom-control-label" for="user-group-reduce-${accountGroupMember.id}"></label>
    </div>
</li>
</#list>
</#if>
<script>
$("#add-group-users-submit-btn").click(function(){
	var checkedUsers = $("input.add-group-user-select[type='checkbox']:checked");
	if(checkedUsers.length < 1){
		layer.msg('请选择添加的用户');
		return;
	}
	var aids = new Array();
	checkedUsers.each(function(i,e){
		aids[i] = $(e).val();
	});
	var accountGroupId = $("#focus-view-group-id").val();
	var postData = {mids:aids.toString(),type:1,accountGroupId:accountGroupId};
	ajaxRequest('update_group_member','post',postData,function(data){
		layer.msg('添加成功！');
		$("#new-group-chat-"+accountGroupId+"-tab").trigger('click');
		$("#add-group-user").modal('toggle');
		sendMsg(websocket,{msg:aids.toString(),toId:0,fromId:${ylrc_account.id},chatType:'event',msgType:'refresh_friend_list'});
	},function(data){
		layer.msg(data.msg);
	});
});
$("#reduce-group-users-submit-btn").click(function(){
	var checkedUsers = $("input.reduce-group-user-select[type='checkbox']:checked");
	if(checkedUsers.length < 1){
		layer.msg('请选择移除的用户');
		return;
	}
	var aids = new Array();
	checkedUsers.each(function(i,e){
		aids[i] = $(e).val();
	});
	var postData = {mids:aids.toString(),type:0,accountGroupId:$("#focus-view-group-id").val()};
	ajaxRequest('update_group_member','post',postData,function(data){
		layer.msg('移除成功！');
		$("#show-chat-group-users>div.avatar").each(function(i,e){
			var id = $(e).attr('aid');
			if(aids.includes(id)){
				$(e).remove();
			}
		});
		$("#reduce-group-user").modal('toggle');
		sendMsg(websocket,{msg:aids.toString(),toId:0,fromId:${ylrc_account.id},chatType:'event',msgType:'refresh_friend_list'});
	},function(data){
		layer.msg(data.msg);
	});
});
</script>