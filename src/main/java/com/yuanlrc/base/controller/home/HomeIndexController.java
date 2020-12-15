package com.yuanlrc.base.controller.home;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;

/**
 * 前台首页控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/index")
@Controller
public class HomeIndexController {

	@Autowired
	private AccountService accountService;
	@Autowired
	private OperaterLogService operaterLogService;
	
	private Logger log = LoggerFactory.getLogger(HomeIndexController.class);
	/**
	 * 登录页面
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(Model model){
		return "home/index/login";
	}
	
	/**
	 * 退出登录
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(Model model){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		onlineAccount = accountService.find(onlineAccount.getId());
		onlineAccount.setChatStatus(Account.ACOUNT_CHAT_STATUS_OFFLINE);
		accountService.save(onlineAccount);
		SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, null);
		return "redirect:login";
	}
	
	/**
	 * 注册页面
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String register(Model model){
		return "home/index/register";
	}
	
	/**
	 * 提交注册表单
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> register(Account account){
		if(account == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(account);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		//检查用户名是否重复
		if(accountService.isExistUsername(account.getUsername(), 0l)){
			return Result.error(CodeMsg.ACCOUNT_USERNAME_EXIST);
		}
		if(accountService.save(account) == null){
			return Result.error(CodeMsg.ACCOUNT_REGISTER_ERROR);
		}
		operaterLogService.add("用户【"+account.getUsername()+"】于【" + StringUtil.getFormatterDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "】注册成功！");
		log.info("用户成功注册，user = " + account);
		return Result.success(true);
	}
	
	/**
	 * 登录表单提交
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> login(Account account){
		if(account == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		Account findByUsername = accountService.findByUsername(account.getUsername());
		if(findByUsername == null){
			return Result.error(CodeMsg.ACCOUNT_USERNAME_NO_EXIST);
		}
		//检查密码是否正确
		if(!findByUsername.getPassword().equals(account.getPassword())){
			return Result.error(CodeMsg.ACCOUNT_PASSWORD_ERROR);
		}
		//检查状态是否正常
		if(findByUsername.getStatus() != Account.ACOUNT_USER_STATUS_ENABLE){
			return Result.error(CodeMsg.ACCOUNT_STATUS_ERROR);
		}
		//登录成功，修改在线状态为上线
		findByUsername.setChatStatus(Account.ACOUNT_CHAT_STATUS_ONLINE);
		accountService.save(findByUsername);
		//将用户信息写入session
		SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY, findByUsername);
		operaterLogService.add("用户【"+account.getUsername()+"】于【" + StringUtil.getFormatterDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "】登录成功！");
		log.info("用户成功登录，user = " + account);
		return Result.success(true);
	}
}
