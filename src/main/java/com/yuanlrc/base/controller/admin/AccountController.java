package com.yuanlrc.base.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.common.AccountService;

/**
 * 后台用户管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/account")
@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	/**
	 * 用户列表页面
	 * @param model
	 * @param account
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(Model model,Account account,PageBean<Account> pageBean){
		model.addAttribute("title", "用户列表");
		model.addAttribute("username", account.getUsername());
		model.addAttribute("pageBean", accountService.findList(account, pageBean));
		return "admin/account/list";
	}
	
	/**
	 * 编辑用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> edit(@RequestParam(name="id",required=true)Long id,@RequestParam(name="status",required=true)Integer status){
		Account account = accountService.find(id);
		if(account != null){
			account.setStatus(status);
			accountService.save(account);
		}
		operaterLogService.add("编辑用户状态，用户ID：" + id);
		return Result.success(true);
	}
}
