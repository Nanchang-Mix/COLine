<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|消息管理-${title!""}</title>
<#include "../common/header.ftl"/>
<style>
td{
	vertical-align:middle;
}
</style>
</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="list" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      消息内容 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">消息名</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${msg!""}" name="msg" placeholder="请输入消息内容">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
                <#include "../common/third-menu.ftl"/>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>聊天类型</th>
                        <th>消息类型</th>
                        <th>消息内容</th>
                        <th>附件</th>
                        <th>大小</th>
                        <th>发送时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as msg>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${msg.id}" fromId="${msg.fromId}" toId="${msg.toId}" chatType="${msg.chatType}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if msg.chatType == "single">
                        	<font class="text-success">单人聊天</font>
                        	<#else>
                        	<font class="text-warning">群聊</font>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if msg.msgType == "text">
                        	<font class="text-success">文本消息</font>
                        	<#elseif msg.msgType == "img">
                        	<font class="text-info">图片消息</font>
                        	<#elseif msg.msgType == "file">
                        	<font class="text-info">文件消息</font>
                        	<#elseif msg.msgType == "video">
                        	<font class="text-info">视频消息</font>
                        	<#elseif msg.msgType == "audio">
                        	<font class="text-info">音频消息</font>
                        	<#else>
                        	<font class="text-warning">未知</font>
                        	</#if>
                        </td>
                         <td style="vertical-align:middle;">${msg.msg!""}</td>
                        <td style="vertical-align:middle;" >
                        	<#if msg.attachUrl??>
                        		<a href="/download/download_file?filename=${msg.attachUrl!""}">点击下载</a>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;" >${msg.attachSize!""}</td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${msg.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="7">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?msg=${msg!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?msg=${msg!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?msg=${msg!""}&currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                  <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
function viewInfo(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行查看！');
		return;
	}
	var checked = $("input[type='checkbox']:checked");
	var data = {};
	data.id = checked.val();
	data.fromId = checked.attr("fromId");
	data.toId = checked.attr("toId");
	data.type = checked.attr("chatType");
	ajaxRequest(url,'post',data,function(rst){
		var msgVo = rst.data;
		$.confirm({
	        title: '消息详情',
	        content: '<p>发送者：【' + msgVo.sender + '】</p><p>接受者：【' + msgVo.reciever + '】</p><p>关联消息记录：【' + msgVo.msgLogs.length + '】条！</p>',
	        type: 'green',
	        typeAnimated: true,
	        buttons: {
	            close: {
	                text: '关闭'
	            }
	        }
	    });
	});
}



</script>
</body>
</html>