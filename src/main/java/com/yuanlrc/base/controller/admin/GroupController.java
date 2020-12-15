package com.yuanlrc.base.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.AccountGroup;
import com.yuanlrc.base.entity.common.AccountGroupMember;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.common.AccountGroupMemberService;
import com.yuanlrc.base.service.common.AccountGroupService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.util.SessionUtil;

/**
 * 后台群组管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/group")
@Controller
public class GroupController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountGroupService accountGroupService;
	
	@Autowired
	private AccountGroupMemberService accountGroupMemberService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	/**
	 * 群组列表页面
	 * @param model
	 * @param accountGroup
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(Model model,AccountGroup accountGroup,PageBean<AccountGroup> pageBean){
		model.addAttribute("title", "群组列表");
		model.addAttribute("name", accountGroup.getName());
		model.addAttribute("pageBean", accountGroupService.findList(accountGroup, pageBean));
		return "admin/group/list";
	}
	
	/**
	 * 编辑群组
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
		operaterLogService.add("编辑群组状态，群组ID：" + id);
		return Result.success(true);
	}
	
	/**
	 * 解散群聊
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/destory",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> destory(@RequestParam(name="id",required=true)Long id){
		AccountGroup accountGroup = accountGroupService.findById(id);
		if(accountGroup != null){
			//删除所有成员
			accountGroupMemberService.deleteByAccountGroupId(id);
			accountGroupService.delete(id);
		}
		return Result.success(true);
	}
	
	/**
	 * 移除成员
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete_member",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteMember(@RequestParam(name="id",required=true)Long id){
		AccountGroupMember groupMember = accountGroupMemberService.find(id);
		if(groupMember != null){
			if(groupMember.getAccountGroup().getAdmin().getId().longValue() == groupMember.getMember().getId().longValue()){
				return Result.error(CodeMsg.GROUP_ADMIN_NO_DELETE);
			}
			accountGroupMemberService.delete(id);
			AccountGroup accountGroup = groupMember.getAccountGroup();
			//修改群成员人数
			accountGroup.setCurPeople(accountGroup.getCurPeople()-1);
			accountGroupService.save(accountGroup);
		}
		return Result.success(true);
	}
	
	/**
	 * 获取群成员
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/view_member",method=RequestMethod.POST)
	@ResponseBody
	public Result<List<AccountGroupMember>> viewMember(@RequestParam(name="id",required=true)Long id){
		return Result.success(accountGroupMemberService.findByGroup(id));
	}
}
