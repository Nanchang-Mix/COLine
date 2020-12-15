<#if pageBean.content??>
<#list pageBean.content as account>
<li class="media" style="border-bottom: 1px solid rgba(0, 0, 0, 0.03);">
    <img class="align-self-center rounded-circle" src="/photo/view?filename=${account.headPic!"default.png"}" alt="Generic placeholder image">
    <div class="media-body">
        <h5><span>${account.username}</span></h5>
        <p>${account.info!"这个人很懒，什么也没留下"}</p>
    </div>
    <#if account.id == ylrc_account.id>
    <div class="custom-control" style="padding-top:16px;">
        <font color="grey">你自己</font>
    </div>
    <#elseif friendIds?seq_contains(account.id)>
    <div class="custom-control" style="padding-top:16px;">
        <font color="green">已是好友</font>
    </div>
    <#else>
    <div class="custom-control custom-checkbox">
        <input type="checkbox" class="custom-control-input add-user-request" value="${account.id}" id="userAdd-${account.id}">
        <label class="custom-control-label" for="userAdd-${account.id}"></label>
    </div>
    </#if>
</li>

</#list>
</#if>