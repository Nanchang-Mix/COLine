<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Orbiter is a bootstrap minimal & clean admin template">
    <meta name="keywords" content="chat, chat platform, discussion, video call, voice call, communication, conversation, messange, messanger, talk">
    <meta name="author" content="Themesbox">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>注册【猿来入此】在线聊天系统</title>
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
                                    <form action="" id="register-form">
                                        <div class="form-head">
                                            <a href="index.html" class="logo"><img src="/home/images/logo.svg" class="img-fluid" alt="logo"></a>
                                        </div> 
                                        <h4 class="text-primary my-4">注册【猿来入此】在线聊天系统账号</h4>
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="username" placeholder="请输入用户名" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="email" placeholder="请输入邮箱" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="password" placeholder="请输入密码" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="re-password" placeholder="请再次输入密码" required>
                                        </div>
                                        <div class="form-row mb-3">
                                            <div class="col-sm-12">
                                                <div class="custom-control custom-checkbox text-left">
                                                    <input type="checkbox" class="custom-control-input" checked id="terms">
                                                    <label class="custom-control-label font-14" for="terms">我同意<a href="javascript:void(0)" id="show-policy">《猿来入此在线聊天系统政策》</a></label>
                                                </div>                                
                                            </div>
                                        </div>                          
                                      <a href="javascript:void(0)" class="btn btn-success btn-lg btn-block font-18" id="submit-btn">立即注册</a>
                                    </form>
                                    <p class="mb-0 mt-3">已经有账号? <a href="login">点我去登录</a></p>
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
		var email = $("#email").val();
		if(email == ''){
			layer.msg('请填写邮箱！');
			$("#email").focus();
			return;
		}
		var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
		if(!reg.test(email)){
			layer.msg('邮箱格式不正确！');
			$("#email").focus();
			return;
		}
		var password = $("#password").val();
		if(password == ''){
			layer.msg('请填写密码！');
			$("#password").focus();
			return;
		}
		var repassword = $("#re-password").val();
		if(repassword == ''){
			layer.msg('请再次填写密码！');
			$("#re-password").focus();
			return;
		}
		if(repassword != password){
			layer.msg('两次填写密码不一致！');
			$("#re-password").focus();
			return;
		}
		if(!$("#terms").prop('checked')){
			layer.msg('请勾选同意政策！');
			return;
		}
		$.ajax({
			url:'register',
			type:'POST',
			data:{username:username,password:password,email:email,headPic:'default.png'},
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					layer.msg('注册成功，请登录！');
					window.location.href = 'login';
				}else{
					layer.msg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
			});
	});
	
	$("#show-policy").click(function(){
		layer.open({
		  type: 1 //Page层类型
		  ,area: ['500px', '300px']
		  ,title: '猿来入此在线聊天系统政策'
		  ,shade: 0.6 //遮罩透明度
		  ,maxmin: true //允许全屏最小化
		  ,anim: 1 //0-6的动画形式，-1不开启
		  ,content: '<div style="padding:10px;"><p>1.请在聊天过程中文明用语，不可辱骂、挑衅他人。</p>'+
		  '<p>2.为持续净化社会环境，更好维护政治安全、社会安定和人民安宁，我公司将积极配合执法机构行动对用户的违法行为进行严肃清查，包括违法政治言论，破坏个人隐私，进行黄赌毒、网络谣言和网络诈骗等违法行为，包括但不限于关停其账号等，欢迎举报违法可疑行为。</p>' + 
		  '<p>3.用户承诺不得以任何方式利用知乎直接或间接从事违反中国法律以及社会公德的行为，我们有权对违反上述承诺的内容予以删除。</p>' + 
		  '<p>4.用户注册成功后，将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。</p>' + 
		  '</div>'
		});  
	});
});

</script>
</html>