<#if friendRequestList??>
<#list friendRequestList as friendRequest>
<li class="media" style="border-bottom: 1px solid rgba(0, 0, 0, 0.03);">
    <img class="align-self-center rounded-circle" src="/photo/view?filename=${friendRequest.sender.headPic!"default.png"}" alt="Generic placeholder image">
    <div class="media-body">
        <h5><span>${friendRequest.sender.username}</span></h5>
        <p>${friendRequest.remark!"这个人很懒，什么也没填写就加你了"}</p>
    </div>
    <#if friendRequest.status == 1>
    <div class="custom-control" style="padding-top:16px;">
        <font color="grey">已同意</font>
    </div>
    <#elseif friendRequest.status == -1>
    <div class="custom-control" style="padding-top:16px;">
        <font color="green">已拒绝</font>
    </div>
    <#elseif friendRequest.status == 2>
    <div class="custom-control" style="padding-top:16px;">
        <font color="green">已过期</font>
    </div>
    <#else>
    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input reciever-add-user-request" value="${friendRequest.id}" account-id="${friendRequest.sender.id}" id="userAddRequest-${friendRequest.id}">
        <label class="custom-control-label" for="userAddRequest-${friendRequest.id}"></label>
    </div>
    </#if>
</li>

</#list>
</#if>