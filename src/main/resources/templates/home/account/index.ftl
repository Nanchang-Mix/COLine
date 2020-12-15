<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Gappa is a bootstrap minimal & clean admin template">
    <meta name="keywords" content="chat, chat platform, discussion, video call, voice call, communication, conversation, messange, messanger, talk">
    <meta name="author" content="Themesbox">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>欢迎来到【猿来入此在线聊天系统】</title>
    <!-- Fevicon -->
    <link rel="shortcut icon" href="/home/images/favicon.ico">
    <!-- Start css -->
    <link href="/home/css/jquery.mCustomScrollbar.min.css" rel="stylesheet">
    <link href="/home/css/jquery.emoji.css" rel="stylesheet">
    <!-- Slick css -->
    <link href="/home/plugins/slick/slick.css" rel="stylesheet">
    <link href="/home/plugins/slick/slick-theme.css" rel="stylesheet">
    <link href="/home/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/home/css/icons.css" rel="stylesheet" type="text/css">
    <link href="/home/css/flag-icon.min.css" rel="stylesheet" type="text/css">
    <link href="/home/css/style.css" rel="stylesheet" type="text/css">
    <!-- End css -->
</head>
<body class="light-layout">
    <!-- Start Create Group Modal -->
    <div class="modal create-group-modal fade" id="createGroup" tabindex="-1" role="dialog" aria-labelledby="createGroupTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createGroupTitle">创建群聊</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" id="groupName" placeholder="输入群聊名称">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="groupDesc" id="groupDesc" rows="3" placeholder="输入简单介绍"></textarea>
                        </div>
                        <p class="create-group-header">已选择的好友</p>
                        <div class="added-users">
                            <div class="avatar-group" id="selected-chat-group-users" style="display:block;">
                                
                            </div>
                        </div>
                        <div class="add-users-list">
                            <ul class="list-unstyled" id="create-group-chat-show-friends">
                                
                            </ul>
                        </div>
                        <div class="mt-3 text-center">
                            <button type="button" class="btn btn-primary" id="create-group-submit-btn"><i class="feather icon-plus mr-2"></i>创建群聊</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End Create Group Modal -->
    <!-- Start add user Modal -->
    <div class="modal create-group-modal fade" id="addUser" role="dialog" aria-labelledby="addUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserTitle">添加好友</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="add-users-search">
                            <div class="input-group">
                                <input type="search" class="form-control" id="add-users-search-content" placeholder="根据用户名搜索用户" aria-label="Search" aria-describedby="add-users-search-btn">
                                <div class="input-group-append">
                                    <button class="btn" type="button" id="add-users-search-btn"><i class="feather icon-search"></i></button>
                                </div>
                            </div>
                        </div> 
                        <div class="add-users-list">
                            <ul class="list-unstyled" id="show-search-user-list">
                                    								
                            </ul>
                        </div>
                        <div class="mt-3 text-center">
                            <button type="button" class="btn btn-primary" id="add-users-submit-btn"><i class="feather icon-plus mr-2"></i>向勾选用户发送好友请求</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End add user Modal -->
    <!-- Start add group user Modal -->
    <div class="modal create-group-modal fade" id="add-group-user" role="dialog" aria-labelledby="addGroupUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addGroupUserTitle">添加群成员</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="add-users-list">
                            <ul class="list-unstyled" id="show-friend-user-list">
                                    								
                            </ul>
                        </div>
                        <div class="mt-3 text-center">
                            <button type="button" class="btn btn-primary" id="add-group-users-submit-btn"><i class="feather icon-plus mr-2"></i>确定添加</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End add group user Modal -->
    <!-- Start reduce group user Modal -->
    <div class="modal create-group-modal fade" id="reduce-group-user" role="dialog" aria-labelledby="addGroupUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reduceGroupUserTitle">移除群成员</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="add-users-list">
                            <ul class="list-unstyled" id="show-group-user-list">
                                    								
                            </ul>
                        </div>
                        <div class="mt-3 text-center">
                            <button type="button" class="btn btn-primary" id="reduce-group-users-submit-btn"><i class="feather icon-plus mr-2"></i>确定移除</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End reduce group user Modal -->
    <!-- Start new friend request Modal -->
    <div class="modal create-group-modal fade" id="new-friend-request-tab-show" role="dialog" aria-labelledby="addUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserTitle">收到的添加好友请求</h5>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="add-users-list">
                            <ul class="list-unstyled" id="show-new-friend-request-list">
                                    								
                            </ul>
                        </div>
                        <div class="mt-3 text-center">
                            <button type="button" class="btn btn-primary new-friend-request-handle-btn" status="1"><i class="feather icon-check mr-2"></i>批量通过</button>
                            <button type="button" class="btn btn-primary new-friend-request-handle-btn" status="-1"><i class="feather icon-x mr-2"></i>批量拒绝</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End new friend request Modal -->
    <!--start auth code-->
	<#if ylrc_auth != 1>
	<div class="row align-items-center" id="show-copyright" align="center" style="padding-top:15px;">
         <div class="col-12">
         	  <p class="h6">本系统由【猿来入此】发布，请认准官网获取，官网获取的正版源码提供免费更新升级！</p>
              <p class="h3">官网地址：<a href="https://www.yuanlrc.com/product/details.html?pid=394&fuid=4" style="color:red;">https://www.yuanlrc.com</a><a href="javascript:void(0)" class="btn btn-danger" id="order-auth-btn">点我去广告</a></p>
              <p class="h5"></p>
         </div>
    </div>
    </#if>
    <!--end auth code-->
    <!-- Start Chat Layout -->
    <div class="chat-layout">
        <!-- Start Chat Leftbar -->
        <div class="chat-leftbar">
            <div class="tab-content" id="pills-tab-justifiedContent">
                <!-- Start Chat Listbar -->
                <div class="tab-pane fade show active" id="pills-chat-justified" role="tabpanel" aria-labelledby="pills-chat-tab-justified">
                    <div class="chat-listbar">
                        <div class="chat-left-headbar">
                            <div class="row align-items-center">
                                <div class="col-12">
                                    <ul class="list-unstyled mb-0">
                                        <li class="media">
                                            <img class="align-self-center mr-2" src="/home/images/logo.svg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="mb-0 mt-2">猿来入此在线聊天系统</h5>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!--
                                <div class="col-3">
                                    <a href="/home/index/logout" data-toggle="tooltip" data-placement="right" title="退出"><i class="feather icon-log-out"></i></a>
                                </div>
                                -->
                            </div>
                        </div>  
                        <div class="chat-left-search">
                            <form>
                                <div class="input-group">
                                  <input type="search" onKeyUp="searchInfo(this.value)" class="form-control" placeholder="搜索其实很简单" aria-label="Search" aria-describedby="chat-left-search-btn">
                                  <div class="input-group-append">
                                    <button class="btn" type="button" id="chat-left-search-btn"><i class="feather icon-search"></i></button>
                                  </div>
                                </div>
                            </form>
                        </div>                                     
                        <div class="chat-left-body">       
                            <div class="nav flex-column nav-pills chat-userlist" id="chat-list-tab" role="tablist" aria-orientation="vertical">
                                                       
                            </div>
                            <div class="nav flex-column nav-pills chat-userlist" id="search-chat-list-tab" role="tablist" aria-orientation="vertical" style="display:none;">
                                                       
                            </div>
                        </div>                                       
                    </div>                                    
                </div>
                <!-- End Chat Listbar -->
                <!-- Start Chat Addbar -->
                <div class="tab-pane fade" id="pills-addchat-justified" role="tabpanel" aria-labelledby="pills-addchat-tab-justified">
                    <div class="chat-addbar">
                        <div class="chat-left-headbar">
                            <div class="row align-items-center">
                                <div class="col-9">                                                
                                    <ul class="list-unstyled mb-0">
                                        <li class="media">
                                            <img class="align-self-center mr-2" src="/home/images/logo.svg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="mb-0 mt-2">通讯录</h5>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-3">
                                    <div class="dropdown">
                                        <a href="#" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-plus"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="settingDropdown">
                                            <a class="dropdown-item font-14" href="#" data-toggle="modal" data-target="#addUser"><i class="feather icon-user-plus"></i> 添加好友</a>
                                            <a class="dropdown-item font-14" href="javascript:void(0)" id="create-group-chat-btn"><i class="feather icon-users"></i> 创建群聊</a>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <!--
                        <div class="chat-left-search">
                            <form>
                                <div class="input-group">
                                  <input type="search" class="form-control" placeholder="搜索其实很简单！" aria-label="Search" aria-describedby="chat-left-search-user-btn">
                                  <div class="input-group-append">
                                    <button class="btn" type="submit" id="chat-left-search-user-btn"><i class="feather icon-search"></i></button>
                                  </div>
                                </div>
                            </form>
                        </div>
                        -->                                    
                        <div class="chat-left-body">   
                            <div class="nav flex-column nav-pills chat-userlist" id="new-chat-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="new-friend-request-tab" data-toggle="pill" href="#" role="tab" aria-selected="true">
                                    <div class="media">
                                        <img class="align-self-center rounded-circle" src="/home/images/new-request.png" alt="User Image">
                                        <div class="media-body">
                                            <h5 id="show-new-friend-request-num">好友请求</h5>
                                            <p id="show-new-friend-request-text">没有新的好友请求.</p>
                                        </div>
                                    </div>
                                </a>
                                
                                
                            </div>
                        </div>                                        
                    </div>
                </div>
                <!-- End Chat Addbar -->
                <!-- Start Chat Profilebar -->
                <div class="tab-pane fade" id="pills-profile-justified" role="tabpanel" aria-labelledby="pills-profile-tab-justified">
                    <div class="chat-profilebar">
                        <div class="chat-left-headbar">
                            <div class="row align-items-center">
                                <div class="col-12">                                                
                                    <ul class="list-unstyled mb-0">
                                        <li class="media">
                                            <img class="align-self-center mr-2" src="/home/images/logo.svg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="mb-0 mt-2">个人中心</h5>
                                                <input type="hidden" id="current-online-user-id" value="${ylrc_account.id}">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="chat-left-body">
                            <div class="profilebar">
                                <img class="profile-pic img-fluid" id="user-center-img" src="/photo/view?filename=${ylrc_account.headPic!"default.png"}" data-img="${ylrc_account.headPic!"default.png"}" alt="profile-pic">  
                                <div class="profile-edit">
                                    <i class="feather icon-camera upload-button"></i>
                                    <input type="hidden" id="user-head-pic" value="${ylrc_account.headPic!"default.png"}">
                                    <input class="profile-upload" type="file" id="user-photo-file" onchange="uploadFile()" accept="image/*"/>
                                </div>  
                                <h5 id="show-user-name">${ylrc_account.username}</h5>
                                <p class="mb-0" id="show-user-info">${ylrc_account.info!"此人很懒，什么介绍也没写！"}</p>                                            
                            </div> 
                            <div class="profile-detail">
                                <ul class="list-unstyled mb-0">
                                    <li class="media">
                                        <i class="feather icon-user align-self-center"></i>
                                        <div class="media-body">
                                            <p>用户名</p>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="user-name" value="${ylrc_account.username}" placeholder="请输入用户名" aria-label="${ylrc_account.username}" aria-describedby="button-addon-group-username">
                                            </div>
                                        </div>
                                    </li>  
                                    <li class="media">
                                        <i class="feather icon-edit align-self-center"></i>
                                        <div class="media-body">
                                            <p>个人简介</p>
                                            <div class="input-group">
                                                <input type="text" class="form-control" maxlength="64" id="user-info" value="${ylrc_account.info!""}" placeholder="请输入个人简介" aria-label="${ylrc_account.info!""}" aria-describedby="button-addon-group-location">
                                            </div>
                                        </div>
                                    </li>  
                                    <li class="media">
                                        <i class="feather icon-message-square align-self-center"></i>
                                        <div class="media-body">
                                            <p>在线状态</p>
                                            <div class="input-group">
                                                <a href="javascript:void(0)" id="online-status" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-key="${ylrc_account.chatStatus!"status-offline"}">
                                                	<#if ylrc_account.chatStatus == "active"><font color="#19a299">●</font> 在线
                                                	<#elseif ylrc_account.chatStatus == "status-offline"><font color="#dee2e6">●</font> 离线
                                                	<#elseif ylrc_account.chatStatus == "status-away"><font color="#eec028">●</font> 离开
                                                	</#if>
                                                </a>
		                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="online-status">
		                                            <a class="dropdown-item font-14 status-change" data-key="active" href="javascript:void(0)"><font color="#19a299">●</font> 在线</a>
		                                            <a class="dropdown-item font-14 status-change" data-key="status-offline" href="javascript:void(0)"><font color="#dee2e6">●</font> 离线</a>
		                                            <a class="dropdown-item font-14 status-change" data-key="status-away" href="javascript:void(0)"><font color="#eec028">●</font> 离开</a>
		                                        </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <i class="feather icon-user align-self-center"></i>
                                        <div class="media-body">
                                            <p>性别</p>
                                            <div class="input-group">
                                                <a href="javascript:void(0)" id="user-sex" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-key="${ylrc_account.sex!"0"}">
                                                	<#if ylrc_account.sex == 1><font color="#19a299">♂</font> 男
                                                	<#elseif ylrc_account.sex == 2><font color="#19a299">♀</font> 女
                                                	<#elseif ylrc_account.sex == 0><font color="#dee2e6">？</font> 未知
                                                	</#if>
                                                </a>
		                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="user-sex">
		                                            <a class="dropdown-item font-14 sex-change" data-key="1" href="javascript:void(0)"><font color="#19a299">♂</font> 男</a>
		                                            <a class="dropdown-item font-14 sex-change" data-key="2" href="javascript:void(0)"><font color="#19a299">♀</font> 女</a>
		                                            <a class="dropdown-item font-14 sex-change" data-key="0" href="javascript:void(0)"><font color="#dee2e6">？</font> 未知</a>
		                                        </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <i class="feather icon-phone align-self-center"></i>
                                        <div class="media-body">
                                            <p>手机号</p>
                                            <div class="input-group">
                                                <input type="tel" class="form-control" maxlength="11" id="user-mobile" value="${ylrc_account.mobile!""}" placeholder="请输入手机号" aria-label="${ylrc_account.mobile!""}" aria-describedby="button-addon-group-emailid">
                                            </div>
                                        </div>
                                    </li>
                                    <li class="media">
                                        <i class="feather icon-mail align-self-center"></i>
                                        <div class="media-body">
                                            <p>邮箱</p>
                                            <div class="input-group">
                                                <input type="email" class="form-control" id="user-email" value="${ylrc_account.email!""}" placeholder="请输入邮箱" aria-label="${ylrc_account.email!""}" aria-describedby="button-addon-group-emailid">
                                            </div>
                                        </div>
                                    </li> 
                                    <li class="media">
                                        <i class="feather icon-lock align-self-center"></i>
                                        <div class="media-body">
                                            <p>密码</p>
                                            <div class="input-group">
                                                <input type="password" class="form-control" id="user-pwd" value="" placeholder="请输入密码，留空则不修改密码" aria-label="********" aria-describedby="button-addon-group-password">
                                            </div>
                                        </div>
                                    </li>                           
                                    <li class="media" align="center">
                                        <div class="media-body">
                                            <div class="input-group">
                                                <div class="input-group-append" style="text-align:center;margin:0 auto;">
                                                    <button class="btn btn-link" onclick="updateUserInfo()" style="font-size:13px;padding: 6px 18px;font-weight: 600;color: #ffffff;background-color:#19a299;border-color:#19a299;border-radius:5px;" type="button" id="button-addon-group-password">保存并更新</button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>                                   
                                </ul>
                            </div>                                            
                        </div>
                    </div>
                </div>
                <!-- End Chat Profilebar -->
                <!-- Start Chat Settingbar -->
                <div class="tab-pane fade" id="pills-setting-justified" role="tabpanel" aria-labelledby="pills-setting-tab-justified">
                    <div class="chat-settingbar">
                        <div class="chat-left-headbar">
                            <div class="row align-items-center">
                                <div class="col-12">                                                
                                    <ul class="list-unstyled mb-0">
                                        <li class="media">
                                            <img class="align-self-center mr-2" src="/home/images/logo.svg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="mb-0 mt-2">设置</h5>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                               
                            </div>
                        </div>
                        <div class="chat-left-body">
                            <p class="setting-header">通用设置</p>
                            <div class="general-setting">
                                <div class="row align-items-center pb-3">
                                    <div class="col-9"><h6 class="mb-0">新消息声音提醒</h6></div>
                                    <div class="col-3 text-right">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="new-msg-notification-sound" checked>
                                            <label class="custom-control-label" for="new-msg-notification-sound"></label>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row align-items-center pb-3">
                                    <div class="col-9"><h6 class="mb-0">新消息弹窗</h6></div>
                                    <div class="col-3 text-right">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="new-msg-alert">
                                            <label class="custom-control-label" for="new-msg-alert"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row align-items-center pb-3">
                                    <div class="col-9"><h6 class="mb-0">提醒是否显示消息内容</h6></div>
                                    <div class="col-3 text-right">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="new-msg-is-show" checked>
                                            <label class="custom-control-label" for="new-msg-alert"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <p class="setting-header" style="padding-bottom:0px;">新消息提示声音</p>
                            <div class="design-setting custom-checkbox-button">
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-1" value="wx.mp3">
                                  <label for="new-msg-tip-audio-1"></label>
                                </div>
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-2" value="ios.mp3">
                                  <label for="new-msg-tip-audio-2"></label>
                                </div>
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-3" value="ios8.mp3">
                                  <label for="new-msg-tip-audio-3"></label>
                                </div>
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-4" value="ios9.mp3" checked>
                                  <label for="new-msg-tip-audio-4"></label>
                                </div>
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-5" value="qn.mp3">
                                  <label for="new-msg-tip-audio-5"></label>
                                </div>
                                <div class="form-check-inline checkbox-primary">
                                  <input class="new-msg-tips-audio" type="checkbox" id="new-msg-tip-audio-6" value="qq.mp3">
                                  <label for="new-msg-tip-audio-6"></label>
                                </div>
                                
                            </div>
                            <p class="setting-header" style="padding-bottom:0px;border-bottom:0px;border-top:1px solid rgba(0, 0, 0, 0.03);">
                            	<a href="/home/index/logout" class="btn btn-primary" style="width:100%;" data-toggle="tooltip" data-placement="right" title="退出"><i class="feather icon-log-out"></i>注销登录</a>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- End Chat Settingbar -->
            </div>
            <div class="chat-menu">
                <ul class="nav nav-pills nav-justified mb-0" id="pills-tab-justified" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="pills-chat-tab-justified" data-toggle="pill" href="#pills-chat-justified" role="tab" aria-controls="pills-chat-justified" aria-selected="true"><i class="feather icon-message-circle"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-addchat-tab-justified" data-toggle="pill" href="#pills-addchat-justified" role="tab" aria-controls="pills-addchat-justified" aria-selected="false"><i class="feather icon-users"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-profile-tab-justified" data-toggle="pill" href="#pills-profile-justified" role="tab" aria-controls="pills-profile-justified" aria-selected="false"><i class="feather icon-user"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pills-setting-tab-justified" data-toggle="pill" href="#pills-setting-justified" role="tab" aria-controls="pills-setting-justified" aria-selected="false"><i class="feather icon-settings"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Chat Leftbar -->
        <!-- Start Chat Rightbar -->  
        <div class="chat-rightbar">
            <!-- Start Chat Detail -->
            <div class="chat-detail">
                <div class="chat-head">
                    <div class="row align-items-center">
                        <div class="col-6">                                                
                            <ul class="list-unstyled mb-0">
                                <li class="media">
                                    <div class="user-status" id="cur-chat-user-status"></div>
                                    <img class="align-self-center rounded-circle" id="cur-chat-user-img" src="/home/images/girl.svg" alt="Generic placeholder image">
                                    <div class="media-body">
                                        <h5 id="cur-chat-user-name">Emily Cook</h5>
                                        <p class="mb-0" id="cur-chat-user-status-text">Online</p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul class="list-inline float-right mb-0">
                                <!--
                                <li class="list-inline-item">
                                    <a href="#" data-toggle="modal" data-target="#incomingVoiceCall"><i class="feather icon-phone"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" data-toggle="modal" data-target="#incomingVideoCall"><i class="feather icon-video"></i></a>
                                </li>
                                -->                                       
                                <li class="list-inline-item">
                                    <div class="dropdown">
                                        <a href="#" class="" id="chatDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical-"></i></a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="chatDropdown">
                                            <a class="dropdown-item font-14" href="#" id="view-user-info">查看好友信息</a>
                                            <a class="dropdown-item font-14" href="#" id="view-group-info">查看群聊信息</a>
                                            <!--
                                            <a class="dropdown-item font-14" href="#">导出聊天记录</a>
                                            <a class="dropdown-item font-14" href="#">清空聊天记录</a>
                                            -->
                                        </div>
                                    </div>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#" class="back-arrow"><i class="feather icon-x"></i></a>
                                </li>
                            </ul>                                            
                        </div>
                    </div>                                    
                </div>
                <div class="chat-body" style="padding-bottom: 20px;">
                    <div class="tab-content" id="chat-listContent">
                        <div class="tab-pane fade show active" id="chat-first" role="tabpanel" aria-labelledby="chat-first-tab">
                            <div class="chat-day text-center mb-3">
                                <span class="badge badge-secondary-inverse">Today</span>
                            </div>                                
                        </div>
                    </div>                    
                </div>
                <div class="chat-bottom">
                    <div class="chat-messagebar">
                        <form onkeydown="if(event.keyCode==13)return false;">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <a href="javascript:void(0)" ><i class="feather icon-type" id="button-addonmic"></i></a>
                                </div> 
                                <input type="hidden" id="will-send-msg-friend-id"> 
                                <input type="hidden" id="will-send-msg-group-id"> 
                                <!--
                                <input type="text" class="form-control" id="will-send-msg-content" placeholder="请输入消息..." aria-label="Text">
                                -->
                                <div contenteditable="true" class="form-control will-send-msg-content" id="will-send-msg-content" placeholder="请输入消息..." aria-label="Text"></div>
                                <div class="input-group-append">
                                    <input type="file" id="select-send-file" multiple="multiple" size="20" style="display:none;" onchange="startSendFile()">
                                    <a href="#" class="mr-3" id="button-addonlink"><i class="feather icon-paperclip"></i></a>
                                    <a href="javascript:void(0)" id="button-addonsend"><i class="feather icon-send"></i></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Chat Detail -->
            <!-- Start Chat User Info -->
            <div class="chat-user-info" id="view-chat-user-info">
                <input type="hidden" id="focus-view-friend-id">
                <input type="hidden" id="focus-view-friend-account-id">
                <div class="chat-user-head">
                    <div class="row align-items-center">
                        <div class="col-9">                                                
                            <h5>查看好友</h5>
                        </div>
                        <div class="col-3">
                            <ul class="list-inline float-right mb-0">
                                <li class="list-inline-item">
                                    <a href="#" id="close-user-info"><i class="feather icon-x"></i></a>
                                </li>
                            </ul>                                            
                        </div>
                    </div>                                    
                </div>
                <div class="chat-user-body">
                    <div class="userbar">
                        <img class="user-pic img-fluid" src="/home/images/default.png" id="view-user-info-pic"> 
                        <h5 id="view-user-info-remark">猿来入此</h5>
                        <p class="mb-0" id="view-user-info-desc">https://www.yuanlrc.com</p>
                    </div>
                    <div class="user-detail">
                        <p class="user-detail-header">基本信息</p>
                        <div class="user-about">
                            <h6 id="view-user-info-remark-edit"><i class="feather icon-info mr-2"></i>男</h6>
                            <h6 id="view-user-info-username"><i class="feather icon-user mr-2"></i>男</h6>
                            <h6 class="my-3" id="view-user-info-email"><i class="feather icon-mail mr-2"></i>llq@yuanlrc.com</h6>
                            <h6 class="mb-0" id="view-user-info-tel"><i class="feather icon-phone-call mr-2"></i>+1 9876543210</h6>
                        </div>
                        <p class="user-detail-header">聊天设置</p>
                        <div class="user-setting">
                            <div class="row align-items-center pb-3">
                                <div class="col-9"><h6 class="mb-0">消息免打扰</h6></div>
                                <div class="col-3 text-right">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="mute-notification-setting">
                                        <label class="custom-control-label" for="mute-notification-setting"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-center pb-3">
                                <div class="col-9"><h6 class="mb-0">加入黑名单</h6></div>
                                <div class="col-3 text-right">
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="block-friend-setting">
                                        <label class="custom-control-label" for="block-friend-setting"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="user-detail-header">高级设置</p>
                        <div class="user-setting">
                            <div class="row align-items-center pb-3" style="text-align:center;">
                                <div class="col-12"><input type="button" class="btn btn-warning" id="clear-friend-msg" value="清空聊天记录" style="width:100%;"></div>
                            </div>
                            <div class="row align-items-center pb-3" style="text-align:center;">
                                <div class="col-12"><input type="button" class="btn btn-danger" id="delete-friend-btn" value="解除好友关系" style="width:100%;"></div>
                            </div>
                            <div class="row align-items-center pb-3" style="text-align:center;">
                                <div class="col-12"><input type="button" id="start-chat-btn" class="btn btn-primary" value="立即发送消息" style="width:100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>                                
            </div>
            <!-- End Chat User Info -->
            <!-- Start Chat group Info -->
            <div class="chat-user-info" id="view-chat-group-info">
                                              
            </div>
            <!-- End Chat group Info -->
        </div>
        <!-- End Chat Rightbar -->
    </div>
    <!-- End Chat Layout -->
    <!-- Start js -->        
    <script src="/home/js/jquery.min.v1.12.4.js"></script>
    <script src="/home/js/jquery.cookie.js"></script>
    <script src="/home/js/jquery.jsoncookie.js"></script>
    <script src="/home/js/popper.min.js"></script>
    <script src="/home/js/bootstrap.min.js"></script>
    <script src="/home/js/modernizr.min.js"></script>
    <script src="/home/js/detect.js"></script>
    <script src="/home/js/jquery.slimscroll.js"></script>
    <script src="/home/js/vertical-menu.js"></script>
    <!-- Slick js -->
    <script src="/home/plugins/slick/slick.min.js"></script>
    <!--[if gt IE 8]><!--> <script src="/home/js/highlight.pack.js"></script> <script>hljs.initHighlightingOnLoad();</script> <!--<![endif]-->
    <script src="/home/js/jquery.mousewheel-3.0.6.min.js"></script>
    <script src="/home/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="/home/js/jquery.emoji.min.js"></script>
    <!-- Core js -->
    <script src="/home/js/core.js"></script>
    <script src="/home/js/common.js"></script>
    <script src="/home/layer/layer.js"></script>
    <script src="/home/js/chat.js"></script>
    <script src="/home/js/websocket.js"></script>
    <!-- End js -->
</body>
<script type="text/javascript">
var websocket;
setTimeout(function(){
	websocket = buildWebSocket(${ylrc_account.id});
},500);
$(document).ready(function(){
	$("#will-send-msg-content").emoji({
	    button: "#button-addonmic",
	    showTab: false,
	    animation: 'slide',
	    position: 'topRight',
	    icons: [{
	        name: "新浪表情",
	        path: "/home/css/sina/",
	        maxNum: 83,
	        file: ".png"
	    },
	    {
	        name: "QQ表情",
	        path: "/home/css/qq/",
	        maxNum: 91,
	        file: ".gif"
	    },
	    {
	        name: "贴吧表情",
	        path: "/home/css/tieba/",
	        maxNum: 50,
	        file: ".jpg"
	    },
	    {
	        name: "大图表情",
	        path: "/home/css/emoji/",
	        maxNum: 84,
	        file: ".png"
	    },
	    {
	        name: "其他表情",
	        path: "/home/css/other/",
	        maxNum: 166,
	        file: ".png"
	    },
	    {
	        name: "复仇者联盟",
	        path: "/home/css/fczlm/",
	        maxNum: 32,
	        file: ".png"
	    },
	    {
	        name: "小黄人",
	        path: "/home/css/xhr/",
	        maxNum: 10,
	        file: ".png"
	    },
	    {
	        name: "愤怒的小鸟",
	        path: "/home/css/bird/",
	        maxNum: 10,
	        file: ".png"
	    },
	    {
	        name: "哆啦A梦",
	        path: "/home/css/dlam/",
	        maxNum: 15,
	        file: ".png"
	    },
	    {
	        name: "哪吒",
	        path: "/home/css/nz/",
	        maxNum: 3,
	        file: ".png"
	    }
	    ]
	});
	$("#button-addonmic").click(function(){
		$("#emoji_container_1").css({'top':'','bottom':'45px'});
	});
	//用户状态改变
	$(".status-change").click(function(){
		$("#online-status").attr('data-key',$(this).attr('data-key'));
		$("#online-status").html($(this).html());
	});
	//用户性别改变
	$(".sex-change").click(function(){
		$("#user-sex").attr('data-key',$(this).attr('data-key'));
		$("#user-sex").html($(this).html());
	});
	//点击搜索好友按钮
	$("#add-users-search-btn").click(function(){
		var username = $("#add-users-search-content").val();
		if(username == ''){
			layer.msg('请输入搜索用户名！');
			return;
		}
		$.get('search_user_list',{username:username},function(data,status,xhr){
			if(data == ''){
				layer.msg('连个毛都没有搜索到呢！');
			}
			$("#show-search-user-list").html(data);
		});
	});
	//点击发送好友请求按钮
	$("#add-users-submit-btn").click(function(){
		var checkedUsers = $("input.add-user-request[type='checkbox']:checked");
		if(checkedUsers.length < 1){
			layer.msg('请选择添加的用户');
			return;
		}
		var aids = new Array();
		checkedUsers.each(function(i,e){
			aids[i] = $(e).val();
		});
		layer.prompt({title: '验证备注信息', formType: 2}, function(text, index){
		    layer.close(index);
		    ajaxRequest('add_friend_request','post',{accountIds:aids.toString(),remark:text},function(data){
				layer.msg('发送请求成功，等待对方通过！');
				$("#addUser").modal("toggle");
			},function(data){
				layer.msg(data.msg);
			});
		 });
	});
	//点击查看新的好友请求
	$("#new-friend-request-tab").click(function(){
		$.get('friend_request_list',{},function(data,status,xhr){
			if(data == ''){
				layer.msg('你真可怜，没有一个人加你好友！');
			}
			$("#show-new-friend-request-list").html(data);
		});
		$("#new-friend-request-tab-show").modal("toggle");
	});
	//获取好友添加数
	getNewFriendRequestCount();
	setInterval(getNewFriendRequestCount,60000);
	//批量通过好友请求
	$(".new-friend-request-handle-btn").click(function(){
		var checkedUsers = $("input.reciever-add-user-request[type='checkbox']:checked");
		if(checkedUsers.length < 1){
			layer.msg('请选择需要操作的用户！');
			return;
		}
		var aids = new Array();
		var fqids = new Array();
		checkedUsers.each(function(i,e){
			fqids[i] = $(e).val();
			aids[i] = $(e).attr('account-id');
		});
		handleFriendRequest(fqids.toString(),aids.toString(),$(this).attr('status'));
	});
	//获取好友列表
	getFriendList();
	//点击创建群聊按钮
	$("#create-group-chat-btn").click(function(){
		$.get('friend_list',{from:1},function(data,status,xhr){
			if(data == ''){
				layer.msg('你真可怜，没有一个好友！');
			}
			$("#create-group-chat-show-friends").html(data);
		});
		$("#selected-chat-group-users").children().remove();
		$("#createGroup").modal("toggle");
	});
	//点击创建群聊的提交按钮
	$("#create-group-submit-btn").click(function(){
		var checkedUsers = $("#selected-chat-group-users").children("div.avatar");
		if(checkedUsers.length <= 1){
			layer.msg('群聊至少需要选择两个用户哦！');
			return;
		}
		var postData = {};
		postData.name = $("#groupName").val();
		postData.info = $("#groupDesc").val();
		if(postData.name == ''){
			layer.msg('请填写群聊名称！');
			return;
		}
		var accounts = new Array();
		checkedUsers.each(function(i,e){
			accounts[i] = $(e).attr('aid');
		});
		postData.type = 2;
		postData.picture = 'default-group-chat.jpg';
		postData.aids = accounts.toString();
		ajaxRequest('create_group_chat','post',postData,function(data){
			layer.msg('创建成功');
			getFriendList();
			sendMsg(websocket,{msg:accounts.toString(),toId:0,fromId:${ylrc_account.id},chatType:'event',msgType:'refresh_friend_list'});
			$("#createGroup").modal("toggle");
		},function(data){
			console.log(data);
			layer.msg(data.msg);
		});
	});
	//消息免打扰按钮,拉黑
	$("#mute-notification-setting,#block-friend-setting").change(function(){
		updateFriend(false);
	})
	//加载聊天会话
	initChatTabList();
	//点击单人开启聊天按钮
	$("#start-chat-btn").click(function(){
		var friendId = $("#focus-view-friend-id").val();
		var friendAccountId = $("#focus-view-friend-account-id").val();
		var username = $("#focus-view-friend-id").attr('username');
		var status = $("#focus-view-friend-id").attr('status');
		var picture = $("#focus-view-friend-id").attr('picture');
		var friendChat = $("#chat-"+friendId+"-tab");
		if(friendChat.length == 0){
			var option = {};
			option.friendId = friendId;
			option.friendAccountId = friendAccountId;
			option.username = username;
			option.accountStatus = status;
			option.picture = picture;
			option.lastMsg = '';
			option.time = dateFormat("HH:MM", new Date());
			option.type = 'single';
			createChatTab(option,true);
		}
		$("#pills-chat-tab-justified").trigger('click');
		$("#close-user-info").trigger('click');
		$('#chat-'+friendId+'-tab').trigger('click');
	});
	//点击发送消息按钮
	$("#button-addonsend").on('click',function(){
		//var msg = $("#will-send-msg-content").val();
		var msg = $("#will-send-msg-content").html();
		if(msg.trim() == ''){
			layer.msg('好歹输入点啥再发送呢骚年！');
			return;
		}
		if($(this).attr('msg-type') == 'single'){
			var friendId = $("#will-send-msg-friend-id").val();
			var friendAccountId = $("#focus-view-friend-account-id").val();
			sendMsg(websocket,{msg:msg,toId:friendAccountId,fromId:${ylrc_account.id},chatType:'single',msgType:'text'});
			sendTextMsg(msg,friendId,'single');
			showLastMsgTips(msg,friendId,'single');
		}
		if($(this).attr('msg-type') == 'group'){
			var groupId = $("#will-send-msg-group-id").val();
			sendMsg(websocket,{msg:msg,toId:groupId,fromId:${ylrc_account.id},chatType:'group',msgType:'text'});
			sendTextMsg(msg,groupId,'group');
			showLastMsgTips(msg,groupId,'group');
		}
		$("#will-send-msg-content").html('');
	});
	//输入数据后回车事件
	$("#will-send-msg-content").keydown(function(e){
		 if(e.keyCode == 13){
			$("#button-addonsend").trigger('click');
		 }
	});
	//搜索好友输入数据后回车事件
	$("#add-users-search-content").keydown(function(e){
		 if(e.keyCode == 13){
			$("#add-users-search-btn").trigger('click');
			return false;
		 }
	});
	//点击发送附件按钮
	$("#button-addonlink").click(function(){
		$("#select-send-file").click();
	});
	//点击查看群消息
	$("#view-group-info").click(function(){
		var accountGroupId = $("#will-send-msg-group-id").val();
		$("#new-group-chat-"+accountGroupId+"-tab").trigger('click');
	});
	//点击选择消息提示音
	$(".new-msg-tips-audio").click(function(){
		$(".new-msg-tips-audio").prop('checked',false);
		$(this).prop('checked',true);
		playAudio('/home/audio/'+$(this).val());
	});
	//点击删除好友按钮
	$("#delete-friend-btn").click(function(){
		var friendId = $("#focus-view-friend-id").val();
		if(friendId == null){
			layer.msg('请选择好友！');
			return;
		}
		//询问框
		layer.confirm('确定删除？（删除后不能收到该好友的信息哦！）', {
		  btn: ['确定','再想想'] //按钮
		}, function(){
		    var postData = {friendId:friendId};
			ajaxRequest('delete_friend','post',postData,function(data){
				layer.msg('删除成功！');
				$("#chat-"+friendId+"-tab").remove();
				getFriendList();
				var allChatTapInfo = getALLChatTapInfoFromLocal();
				delete allChatTapInfo[friendId];
				setAllChatTapInfoToLocal(allChatTapInfo);
				websocket = buildWebSocket(${ylrc_account.id});
			},function(data){
				layer.msg(data.msg);
			});
		}, function(){
		  
		});
	});
	//点击清空消息按钮
	$("#clear-friend-msg").click(function(){
		//询问框
		layer.confirm('确定清空？（清空后不能恢复哦！）', {
		  btn: ['确定','再想想'] //按钮
		}, function(){
		    clearMsg($("#focus-view-friend-id").val(),'single'); 
		}, function(){
		  
		});
	});
});
//上传图片
function uploadFile(){
	if($("#user-photo-file").val() == '')return;
	uploadFileToServer('user-photo-file',function(data){
		layer.msg('图片上传成功');
		$("#user-head-pic").val(data.data);
		updateUserInfo();
	},function(data){
		if(!isJson(data)){
			data = $.parseJSON(data);
		}
		layer.msg(data.msg);
	});
}
function updateUserInfo(){
	var postData = {};
	postData.headPic = $("#user-head-pic").val();
	postData.username = $("#user-name").val();
	postData.info = $("#user-info").val();
	postData.chatStatus = $("#online-status").attr('data-key');
	postData.sex = $("#user-sex").attr('data-key');
	postData.email = $("#user-email").val();
	postData.mobile = $("#user-mobile").val();
	postData.password = $("#user-pwd").val();
	ajaxRequest('update_user_info','post',postData,function(data){
		layer.msg('更新成功');
		$("#show-user-name").text(postData.username);
		$("#show-user-info").text(postData.info);
	},function(data){
		console.log(data);
		layer.msg(data.msg);
	});
}
function getNewFriendRequestCount(){
	ajaxRequest('get_new_friend_request_count','post',{},function(data){
		if(data.data != 0){
			$("#show-new-friend-request-num").html('好友请求<span class="badge badge-danger ml-2" >'+data.data+'</span>');
			$("#show-new-friend-request-text").text('有' + data.data + '个用户添加好友!');
		}else{
			$("#show-new-friend-request-num").html('好友请求');
			$("#show-new-friend-request-text").text('没有用户添加好友!');
		}
	},function(data){
		console.log(data);
		layer.msg(data.msg);
	});
}
function handleFriendRequest(fqids,aids,type){
	ajaxRequest('handle_friend_request','post',{friendRequestIds:fqids,status:type},function(data){
		layer.msg('操作成功！');
		$("#new-friend-request-tab-show").modal("toggle");
		getNewFriendRequestCount();
		if(type == '1'){
			//批量通过用户，此时需要告知对方已经同意好友请求
			//发送广播消息来更新对方的好友列表
			sendMsg(websocket,{msg:aids,toId:0,fromId:${ylrc_account.id},chatType:'event',msgType:'refresh_friend_list'});
			
		}
	},function(data){
		layer.msg(data.msg);
	});
}
function getFriendList(){
	$.get('friend_list',{},function(data,status,xhr){
		if(data == ''){
			layer.msg('你真可怜，没有一个好友！');
		}
		$("#new-friend-request-tab").nextAll("a.nav-link").remove();
		$("#new-friend-request-tab").after(data);
	});
}
//点击单人聊天会话事件
function clickChatTab(friendId){
	var chatTabInfo = gloabalChatInfo[friendId];
	$("#cur-chat-user-status").removeClass('active').removeClass('status-offline').removeClass('status-away').addClass(chatTabInfo.accountStatus);
	$("#cur-chat-user-img").attr('src',chatTabInfo.picture);
	$("#cur-chat-user-name").text(chatTabInfo.username);
	if(chatTabInfo.accountStatus == 'active'){
		$("#cur-chat-user-status-text").text('在线');
	}else if(chatTabInfo.accountStatus == 'status-offline'){
		$("#cur-chat-user-status-text").text('离线');
	}else{
		$("#cur-chat-user-status-text").text('离开');
	}
	$("#will-send-msg-friend-id").val(friendId);
	$("#focus-view-friend-account-id").val(chatTabInfo.friendAccountId);
	//从本地加载聊天信息
	loadMsgFromLocal(friendId);
	$(".chat-rightbar").addClass('show');
	$(".chat-user-info").removeClass("show");
    $(".chat-bottom").removeClass("small");
    $("#view-user-info").show();
    $("#view-group-info").hide();
    $("#button-addonsend").attr('msg-type','single');
    $(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
    $("#chat-"+friendId+"-tab").find('span.unread-num').remove();
}
//点击群聊天会话事件
function clickGroupChatTab(groupId){
	var chatTabInfo = gloabalChatInfo['group_'+groupId];
	$("#cur-chat-user-status").removeClass('active').removeClass('status-offline').removeClass('status-away');
	$("#cur-chat-user-img").attr('src','/photo/view?filename='+chatTabInfo.picture);
	$("#cur-chat-user-name").text(chatTabInfo.groupName+'('+chatTabInfo.peopleNum+')');
	$("#cur-chat-user-status-text").text('');
	$("#will-send-msg-friend-id").val(groupId);
	//从本地加载聊天信息
	loadGroupMsgFromLocal(groupId);
	$(".chat-rightbar").addClass('show');
	$(".chat-user-info").removeClass("show");
    $(".chat-bottom").removeClass("small");
    $("#view-user-info").hide();
    $("#view-group-info").show();
    $("#will-send-msg-group-id").val(groupId);
    $("#button-addonsend").attr('msg-type','group');
    $(".chat-body")[0].scrollTop = $(".chat-body")[0].scrollHeight
    $("#group-chat-"+groupId+"-tab").find('span.unread-num').remove();
    $('[data-toggle="tooltip"]').tooltip();
}
//选中文件后开始发送
function startSendFile(){
	if($("#select-send-file").val() == '')return;
	var f = document.getElementById("select-send-file").files;  
	var formData = new FormData();
	var friendId = $("#will-send-msg-friend-id").val();
	var friendAccountId = $("#focus-view-friend-account-id").val();
	var groupId = $("#will-send-msg-group-id").val();
	var msgType = $("#button-addonsend").attr('msg-type');
	var sendId;
	if(msgType == 'single'){
		sendId = friendId;
	}
	if(msgType == 'group'){
		sendId = groupId;
		friendAccountId = groupId;
	}
	var loading = layer.load(2, {shade: false}); //0代表加载的风格，支持0-2
	for(var i=0;i<f.length;i++){
		var filename = f[i].name;
		var filesize = f[i].size;
	    var suffix = filename.substring(filename.lastIndexOf(".")+1,filename.length);
	    suffix = suffix.toLowerCase();
		//图片文件
		if(suffix == 'png'||suffix == 'jpg'||suffix == 'jpeg'||suffix == 'gif'){
	    	formData.set('photo',f[i]);
	    	uploadMuiltFileToServer('/upload/upload_photo',formData,function(data){
				sendMsg(websocket,{msg:'[图片]'+filename,toId:friendAccountId,fromId:${ylrc_account.id},chatType:msgType,msgType:'img',attachUrl:data.data});
				sendImgMsg(filename,data.data,sendId,msgType);
				showLastMsgTips('[图片]'+filename,sendId,msgType);
			},function(data){
				if(!isJson(data)){
					data = $.parseJSON(data);
				}
				layer.msg(data.msg);
			});
			continue;
    	}
    	//其他文件
    	formData.set('file',f[i]);
    	uploadMuiltFileToServer('/upload/upload_file',formData,function(data){
    		showLastMsgTips('[文件]'+filename,sendId,msgType);
    		//此处判断文件类型
    		if(suffix == 'mp3'){
				sendAudioMsg(filename,data.data,sendId,msgType);
				sendMsg(websocket,{msg:filename,toId:friendAccountId,fromId:${ylrc_account.id},chatType:msgType,msgType:'audio',attachUrl:data.data});
				return;
    		}
    		if(suffix == 'mp4' || suffix == 'rmvb' || suffix == '3gp' || suffix == 'avi' || suffix == 'flv' || suffix == 'mkv'){
				sendVideoMsg(filename,data.data,sendId,msgType);
				sendMsg(websocket,{msg:filename,toId:friendAccountId,fromId:${ylrc_account.id},chatType:msgType,msgType:'video',attachUrl:data.data});
				return;
    		}
    		sendFileMsg(filename,data.data,filesize,getPicBySuffix(suffix),sendId,msgType);
			sendMsg(websocket,{msg:filename,toId:friendAccountId,fromId:${ylrc_account.id},chatType:msgType,msgType:'file',attachUrl:data.data,attachSize:filesize});
		},function(data){
			if(!isJson(data)){
				data = $.parseJSON(data);
			}
			layer.msg(data.msg);
		});
		
	}
    layer.close(loading);
	$("#select-send-file").val('');
}
</script>
</html>