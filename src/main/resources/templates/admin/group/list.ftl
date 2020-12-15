<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|群组管理-${title!""}</title>
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
                      群组名 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">群组名</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="${name!""}" name="name" placeholder="请输入群组名">
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
                        <th>封面</th>
                        <th>名称</th>
                        <th>群主</th>
                        <th>群人数</th>
                        <th>群公告</th>
                        <th>群介绍</th>
                        <th>创建时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as group>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids" value="${group.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<img src="/photo/view?filename=${group.picture}" width="60px" height="60px">
                        </td>
                        <td style="vertical-align:middle;">${group.name}</td>
                        <td style="vertical-align:middle;">
                        	${group.admin.username}
                        </td>
                        <td style="vertical-align:middle;">
                        	<a href="javascript:void(0)" data-toggle="tooltip" title="点击查看群成员" onclick="showMembers(${group.id})">${group.curPeople}</a>
                        </td>
                        <td style="vertical-align:middle;" >${group.notice!""}</td>
                        <td style="vertical-align:middle;" >${group.info!""}</td>
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${group.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="9">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                  <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=${showPage}">${showPage}</a></li>
                  </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=${pageBean.totalPage}">»</a></li>
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
<div class="modal fade bs-example-modal-lg" id="view-members-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">查看群组用户</h4>
      </div>
      <div class="modal-body">
     	   <div class="toolbar-btn-action">
				<a class="btn btn-primary" href="javascript:void(0)" onclick="deleteMember('/admin/group/delete_member')"><i class="mdi mdi-account-minus"></i>移除成员</a>
		   </div>
     	   <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            
                          </label>
                        </th>
                        <th>用户头像</th>
                        <th>用户名</th>
                        <th>群昵称</th>
                        <th>消息提醒</th>
                        <th>加入时间</th>
                      </tr>
                    </thead>
                    <tbody id="group-member-list">
                    
                    </tbody>
           </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
function showMembers(id){
	ajaxRequest('/admin/group/view_member','post',{id:id},function(rst){
		if(rst.code == 0){
			var members = rst.data;
			var tbody = "";
			for(var i=0; i<members.length;i++){
				var tr = '<tr><td style="vertical-align:middle;"><label class="lyear-checkbox checkbox-primary"><input type="checkbox" name="group-member" value="'+members[i].id+'"><span></span></label></td>';
				tr += '<td style="vertical-align:middle;"><img width="50px" height="50px" src="/photo/view?filename='+members[i].member.headPic+'"></td>';
				tr += '<td style="vertical-align:middle;">' + members[i].member.username + '</td>';
				tr += '<td style="vertical-align:middle;">' + members[i].nickname + '</td>';
				tr += '<td style="vertical-align:middle;">' + (members[i].msgStatus == 1 ? '正常提醒' : '消息免打扰') + '</td>';
				tr += '<td style="vertical-align:middle;">' + members[i].createTime + '</td>';
				tr += '</tr>';
				tbody += tr;
			}
			$("#group-member-list").html(tbody);
			$("#view-members-modal").modal('show');
		}
			
	});
	
}
function viewMembers(url){
	if($("input[type='checkbox'][name='ids']:checked").length != 1){
		showWarningMsg('请选择一条数据进行查看！');
		return;
	}
	var id = $("input[type='checkbox'][name='ids']:checked").val();
	showMembers(id);
}
function destoryGroup(url){
	if($("input[type='checkbox'][name='ids']:checked").length != 1){
		showWarningMsg('请选择一条数据进行操作！');
		return;
	}
	var id = $("input[type='checkbox'][name='ids']:checked").val();
	$.confirm({
        title: '确定解散该群聊信息？',
        content: '解散后数据不可恢复，请慎重！',
        buttons: {
            confirm: {
                text: '确认',
                action: function(){
                    destoryGroupReq(id,url);
                }
            },
            cancel: {
                text: '关闭',
                action: function(){
                    
                }
            }
        }
    });
}
function deleteMember(url){
	if($("input[type='checkbox'][name='group-member']:checked").length != 1){
		showWarningMsg('请选择一条数据进行操作！');
		return;
	}
	var id = $("input[type='checkbox'][name='group-member']:checked").val();
	ajaxRequest(url,'post',{id:id},function(rst){
		$("input[type='checkbox'][name='group-member']:checked").closest('tr').remove();
	});
}
function destoryGroupReq(id,url){
	ajaxRequest(url,'post',{id:id},function(rst){
		$("input[type='checkbox'][name='ids']:checked").closest('tr').remove();
	});
}
</script>
</body>
</html>