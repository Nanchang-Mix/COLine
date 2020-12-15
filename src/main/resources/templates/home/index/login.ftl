<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Orbiter is a bootstrap minimal & clean admin template">
    <meta name="keywords" content="chat, chat platform, discussion, video call, voice call, communication, conversation, messange, messanger, talk">
    <meta name="author" content="Themesbox">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>登录【猿来入此】在线聊天系统</title>
    <!-- Fevicon -->
    <link rel="shortcut icon" href="/home/images/favicon.ico">
    <!-- Start css -->
    <link href="/home/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="/home/css/icons.css" rel="stylesheet" type="text/css">
    <link href="/home/css/style.css" rel="stylesheet" type="text/css">
    <!-- End css -->
</head>
<body class="vertical-layout">
    <!-- Start Containerbar -->
    <div id="containerbar" class="containerbar authenticate-bg">
        <!-- Start Container -->
        <div class="container">
            <div class="auth-box login-box">
                <!-- Start row -->
                <div class="row no-gutters align-items-center justify-content-center">
                    <!-- Start col -->
                    <div class="col-md-6 col-lg-5">
                        <!-- Start Auth Box -->
                        <div class="auth-box-right">
                            <div class="card">
                                <div class="card-body">
                                    <form action="#">
                                        <div class="form-head">
                                            <a href="" class="logo"><img src="/home/images/logo.svg" class="img-fluid" alt="logo"></a>
                                        </div>                                        
                                        <h4 class="text-primary my-4">登录【猿来入此】在线聊天系统</h4>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="username" placeholder="请输入用户名" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="password" placeholder="请输入密码" required>
                                        </div>
                                        <div class="form-row mb-3">
                                            <div class="col-sm-6">
                                                <div class="custom-control custom-checkbox text-left">
                                                  <input type="checkbox" class="custom-control-input" id="rememberme">
                                                  <label class="custom-control-label font-14" for="rememberme">记住我</label>
                                                </div>                                
                                            </div>
                                            <div class="col-sm-6">
                                              <div class="forgot-psw"> 
                                                <a id="forgot-psw" href="forgotpsw.html" class="font-14">忘记密码?</a>
                                              </div>
                                            </div>
                                        </div>                          
                                      <a href="javascript:void(0)" class="btn btn-success btn-lg btn-block font-18" id="submit-btn">立即登录</a>
                                    </form>
                                    <p class="mb-0 mt-3">还没有账号? <a href="register">注册账号</a></p>
                                </div>
                            </div>
                        </div>
                        <!-- End Auth Box -->
                    </div>
                    <!-- End col -->
                </div>
                <!-- End row -->
            </div>
        </div>
        <!-- End Container -->
    </div>
    <!-- End Containerbar -->
    <!-- Start js -->        
    <script src="/home/js/jquery.min.js"></script>
    <script src="/home/js/popper.min.js"></script>
    <script src="/home/js/bootstrap.min.js"></script>
    <script src="/home/js/modernizr.min.js"></script>
    <script src="/home/js/detect.js"></script>
    <script src="/home/js/jquery.slimscroll.js"></script>
    <script src="/home/layer/layer.js"></script>
    <!-- End js -->
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit-btn").click(function(){
		var username = $("#username").val();
		if(username == ''){
			layer.msg('请填写用户名！');
			$("#username").focus();
			return;
		}
		var password = $("#password").val();
		if(password == ''){
			layer.msg('请填写密码！');
			$("#password").focus();
			return;
		}
		$.ajax({
			url:'login',
			type:'POST',
			data:{username:username,password:password},
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					layer.msg('登录成功！');
					window.location.href = '/home/account/index';
				}else{
					layer.msg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
			});
	});
	
});

</script>
</html>