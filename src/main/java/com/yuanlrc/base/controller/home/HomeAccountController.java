package com.yuanlrc.base.controller.home;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.yuanlrc.base.bean.WebSocketMsg;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.AccountGroup;
import com.yuanlrc.base.entity.common.AccountGroupMember;
import com.yuanlrc.base.entity.common.Friend;
import com.yuanlrc.base.entity.home.FriendRequest;
import com.yuanlrc.base.server.home.WebSocket;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.common.AccountGroupMemberService;
import com.yuanlrc.base.service.common.AccountGroupService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.service.common.FriendService;
import com.yuanlrc.base.service.home.FriendRequestService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;

/**
 * 前台首页控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/account")
@Controller
public class HomeAccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private FriendRequestService friendRequestService;
	
	@Autowired
	private FriendService friendService;
	
	@Autowired
	private AccountGroupService accountGroupService;
	
	@Autowired
	private AccountGroupMemberService accountGroupMemberService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	
	private Logger log = LoggerFactory.getLogger(HomeAccountController.class);
	/**
	 * 用户中心主页
	 * @param name
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(Model model){
		return "home/account/index";
	}
	
	/**
	 * 好友列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/friend_list")
	public String friendRequestList(Model model,@RequestParam(name="from",defaultValue="0")Integer from){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		//防止数据库session失效，重新查询
		List<Friend> friendList = friendService.findMyFriendList(onlineAccount.getId());
		model.addAttribute("friendList", friendList);
		model.addAttribute("from", from);
		model.addAttribute("accountGroupMemberList", accountGroupMemberService.findByMember(onlineAccount.getId()));
		return "home/account/friend_list";
	}
	
	/**
	 * 查看群信息
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/view_group_info")
	public String viewGroupInfo(Model model,Long id){
		model.addAttribute("accountGroupMemberList", accountGroupMemberService.findByGroup(id));
		model.addAttribute("accountGroup", accountGroupService.findById(id));
		return "home/account/group_info";
	}
	
	/**
	 * 会话列表页面
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/group_member_list")
	public String groupChattList(Model model,Long accountGroupId,@RequestParam(name="from",defaultValue="0")Integer from){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		//model.addAttribute("chatGroupList", accountGroupService.findMyAllChatGroups(onlineAccount.getId()));
		if(accountGroupId == null){
		}
		//获取群成员
		List<AccountGroupMember> findByGroup = accountGroupMemberService.findByGroup(accountGroupId);
		if(from ==0){
			//获取好友列表,用于添加群成员
			List<Friend> friendList = friendService.findMyFriendList(onlineAccount.getId());
			model.addAttribute("friendList", friendList);
			List<Long> groupMemberIds = new ArrayList<Long>();
			for(AccountGroupMember accountGroupMember : findByGroup){
				groupMemberIds.add(accountGroupMember.getMember().getId());
			}
			model.addAttribute("groupMemberIds", groupMemberIds);
		}
		if(from == 1){
			//表示移除群成员
			model.addAttribute("accountGroupMemberList", findByGroup);
		}
		model.addAttribute("from", from);
		return "home/account/group_member_list";
	}
	
	/**
	 * 修改个人信息
	 * @param account
	 * @return
	 */
	@RequestMapping(value="/update_user_info",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateUserInfo(Account account){
		if(account == null){
			return Result.error(CodeMsg.DATA_ERROR);
		}
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		if(!StringUtils.isEmpty(account.getPassword())){
			onlineAccount.setPassword(account.getPassword());
		}else {
			account.setPassword(onlineAccount.getPassword());
		}
		//用统一验证实体方法验证是否合法
		CodeMsg validate = ValidateEntityUtil.validate(account);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		//检查用户名是否重复
		if(accountService.isExistUsername(account.getUsername(), onlineAccount.getId())){
			return Result.error(CodeMsg.ACCOUNT_USERNAME_EXIST);
		}
		onlineAccount = accountService.find(onlineAccount.getId());
		onlineAccount.setChatStatus(account.getChatStatus());
		onlineAccount.setEmail(account.getEmail());
		onlineAccount.setHeadPic(account.getHeadPic());
		onlineAccount.setInfo(account.getInfo());
		onlineAccount.setUsername(account.getUsername());
		onlineAccount.setSex(account.getSex());
		onlineAccount.setMobile(account.getMobile());
		if(!StringUtils.isEmpty(account.getPassword())){
			onlineAccount.setPassword(account.getPassword());
		}
		if(accountService.save(onlineAccount) == null){
			return Result.error(CodeMsg.HANDLE_ERROR);
		}
		SessionUtil.set(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY,onlineAccount);
		operaterLogService.add("用户【"+account.getUsername()+"】于【" + StringUtil.getFormatterDate(new Date(), "yyyy-MM-dd HH:mm:ss") + "】修改个人信息！");
		log.info("用户成功修改个人信息，user = " + onlineAccount.getUsername());
		//此处判断是否设置下线或隐身
		if(!Account.ACOUNT_CHAT_STATUS_ONLINE.equals(account.getChatStatus())){
			//通知其好友下线
			WebSocket webSocket = WebSocket.clients.get(onlineAccount.getId());
			if(webSocket != null){
				webSocket.offlineNotice(onlineAccount.getId());
			}
		}else{
			//通知其好友上线
			WebSocket webSocket = WebSocket.clients.get(onlineAccount.getId());
			if(webSocket != null){
				webSocket.onlineNotice(onlineAccount.getId());
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 根据用户名搜索
	 * @param model
	 * @param account
	 * @param pageBean
	 * @return
	 */
	@RequestMapping(value="/search_user_list")
	public String search(Model model,Account account,PageBean<Account> pageBean){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		//防止数据库session失效，重新查询
		List<Friend> friendList = friendService.findMyFriendList(onlineAccount.getId());
		List<Long> friendIds = new ArrayList<Long>();
		for(Friend friend : friendList){
			friendIds.add(friend.getFriendAccount().getId());
		}
		model.addAttribute("friendIds", friendIds);
		model.addAttribute("title", "用户搜索列表");
		model.addAttribute("username", account.getUsername());
		pageBean.setPageSize(999);
		model.addAttribute("pageBean", accountService.findList(account, pageBean));
		return "home/account/search_user_list";
	}
	
	/**
	 * 批量发送好友验证
	 * @param accountIds
	 * @param remark
	 * @return
	 */
	@RequestMapping(value="/add_friend_request",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> addFriendRequest(@RequestParam(name="accountIds",required=true)String accountIds,String remark){
		String[] split = accountIds.split(",");
		Account sender = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		for(String id : split){
			//检查发送请求的接受者是否已经是好友
			List<Friend> friendList = friendService.findMyFriendList(sender.getId());
			if(isExist(friendList, Long.valueOf(id))){
				//表示已经存在,跳过
				continue;
			}
			Account reciever = new Account();
			reciever.setId(Long.valueOf(id));
			FriendRequest findBySenderAndReciever = friendRequestService.findBySenderAndReciever(sender, reciever);
			if(findBySenderAndReciever == null){
				findBySenderAndReciever = new FriendRequest();
				findBySenderAndReciever.setSender(sender);
				findBySenderAndReciever.setReciever(reciever);
			}
			findBySenderAndReciever.setRemark(remark);
			findBySenderAndReciever.setStatus(FriendRequest.FRIEND_REQUEST_STATUS_WAITING);
			friendRequestService.save(findBySenderAndReciever);
		}
		return Result.success(true);
	}
	
	/**
	 * 获取好友请求列表
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/friend_request_list")
	public String newFriendRequestList(Model model){
		Account reciever = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		model.addAttribute("title", "加好友请求列表");
		model.addAttribute("friendRequestList", friendRequestService.findByReciever(reciever));
		return "home/account/friend_request_list";
	}
	
	/**
	 * 获取新的好友请求数
	 * @return
	 */
	@RequestMapping(value="/get_new_friend_request_count",method=RequestMethod.POST)
	@ResponseBody
	public Result<Integer> getNewFriendRequestCount(){
		Account reciever = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		return Result.success(friendRequestService.getNewFriendRequestCount(reciever.getId()));
	}
	
	/**
	 * 批量处理好友请求
	 * @param friendRequestIds
	 * @param status
	 * @return
	 */
	@RequestMapping(value="/handle_friend_request",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> handleFriendRequest(@RequestParam(name="friendRequestIds",required=true)String friendRequestIds,Integer status){
		String[] split = friendRequestIds.split(",");
		Account reciever = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		//获取好友列表
		List<Friend> recieverFriendList = friendService.findMyFriendList(reciever.getId());
		for(String id : split){
			//friendRequestService
			FriendRequest friendRequest = friendRequestService.find(Long.valueOf(id));
			friendRequest.setStatus(status);
			if(status == FriendRequest.FRIEND_REQUEST_STATUS_AGREE){
				//通过好友，添加到自己的通讯录
				addFriend(recieverFriendList, reciever,friendRequest.getSender());
				//把自己添加到对方通讯录
				List<Friend> senderFriendList = friendService.findMyFriendList(friendRequest.getSender().getId());
				addFriend(senderFriendList,friendRequest.getSender(), reciever);
			}
			friendRequestService.save(friendRequest);
		}
		return Result.success(true);
	}
	
	/**
	 * 创建群组
	 * @param accountGroup
	 * @return
	 */
	@RequestMapping(value="/create_group_chat",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> createGroupChat(AccountGroup accountGroup,@RequestParam(name="aids",required=true)String aids){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		//多人
		String[] split = aids.split(",");
		if(split.length < AccountGroup.GROUP_MIN_PEOPLE){
			CodeMsg ret = CodeMsg.DATA_ERROR;
			ret.setMsg("建群人数不能少于" + AccountGroup.GROUP_MIN_PEOPLE);
			return Result.error(ret);
		}
		if(split.length > AccountGroup.GROUP_MAX_PEOPLE){
			CodeMsg ret = CodeMsg.DATA_ERROR;
			ret.setMsg("建群人数不能大于" + AccountGroup.GROUP_MAX_PEOPLE);
			return Result.error(ret);
		}
		accountGroup.setAdmin(onlineAccount);
		accountGroup.setCurPeople(split.length+1);
		accountGroup = accountGroupService.save(accountGroup);
		for(String id : split){
			Account account = accountService.find(Long.valueOf(id));
			AccountGroupMember accountGroupMember = new AccountGroupMember();
			accountGroupMember.setMember(account);
			accountGroupMember.setAccountGroup(accountGroup);
			accountGroupMember.setNickname(account.getUsername());
			accountGroupMemberService.save(accountGroupMember);
		}
		//群成员中加入自己
		AccountGroupMember accountGroupMember = new AccountGroupMember();
		accountGroupMember.setMember(onlineAccount);
		accountGroupMember.setAccountGroup(accountGroup);
		accountGroupMember.setNickname(onlineAccount.getUsername());
		accountGroupMemberService.save(accountGroupMember);
		return Result.success(true);
	}
	
	/**
	 * 更新联系人
	 * @param friend
	 * @return
	 */
	@RequestMapping(value="/update_friend",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateContact(Friend friend){
		Friend findByAccount = friendService.find(friend.getId());
		findByAccount.setMsgStatus(friend.getMsgStatus());
		if(!StringUtils.isEmpty(friend.getRemark())){
			findByAccount.setRemark(friend.getRemark());
		}
		findByAccount.setStatus(friend.getStatus());
		if(friendService.save(findByAccount) == null){
			return Result.error(CodeMsg.HANDLE_ERROR);
		}
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		WebSocket webSocket = WebSocket.clients.get(onlineAccount.getId());
		if(webSocket != null){
			webSocket.refreshFriendList(new WebSocketMsg());
		}
		return Result.success(true);
	}
	
	/**
	 * 修改群信息
	 * @param accountGroup
	 * @return
	 */
	@RequestMapping(value="/update_group_info",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateGroup(AccountGroup accountGroup){
		AccountGroup findById = accountGroupService.findById(accountGroup.getId());
		if(!StringUtils.isEmpty(accountGroup.getInfo())){
			findById.setInfo(accountGroup.getInfo());
		}
		if(!StringUtils.isEmpty(accountGroup.getName())){
			findById.setName(accountGroup.getName());
		}
		if(!StringUtils.isEmpty(accountGroup.getNotice())){
			findById.setNotice(accountGroup.getNotice());
		}
		if(!StringUtils.isEmpty(accountGroup.getPicture())){
			findById.setPicture(accountGroup.getPicture());
		}
		accountGroupService.save(findById);
		return Result.success(true);
	}
	
	/**
	 * 解散群聊
	 * @param accountGroupId
	 * @return
	 */
	@RequestMapping(value="/delete_group",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteGroup(Long accountGroupId){
		AccountGroup accountGroup = accountGroupService.findById(accountGroupId);
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		if(accountGroup != null){
			if(accountGroup.getAdmin().getId().longValue() != onlineAccount.getId().longValue()){
				return Result.error(CodeMsg.ACCOUNT_NO_ADMIN);
			}
			//删除所有成员
			accountGroupMemberService.deleteByAccountGroupId(accountGroupId);
			accountGroupService.delete(accountGroupId);
		}
		
		return Result.success(true);
	}
	
	/**
	 * 更新群成员
	 * @param accountGroupId
	 * @param mids
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/update_group_member",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateGroup(Long accountGroupId,String mids,@RequestParam(name="type",defaultValue="0")Integer type){
		if(!StringUtils.isEmpty(mids)){
			String[] split = mids.split(",");
			AccountGroup accountGroup = accountGroupService.findById(accountGroupId);
			if(type == 0){
				//移除用户
				for(String id : split){
					accountGroupMemberService.delete(Long.valueOf(id));
				}
				if(accountGroup != null){
					accountGroup.setCurPeople(accountGroup.getCurPeople() - split.length);
					accountGroupService.save(accountGroup);
				}
			}
			if(type == 1){
				//添加用户
				int num = 0;
				for(String id : split){
					AccountGroupMember accountGroupMember = accountGroupMemberService.findByAccountGroupAndMember(accountGroupId, Long.valueOf(id));
					if(accountGroupMember == null){
						//表示不在群里，此时加入
						accountGroupMember = new AccountGroupMember();
						accountGroupMember.setAccountGroup(accountGroup);
						Account account = accountService.find(Long.valueOf(id));
						accountGroupMember.setMember(account);
						accountGroupMember.setNickname(account.getUsername());
						accountGroupMemberService.save(accountGroupMember);
						num++;
					}
				}
				if(accountGroup != null){
					accountGroup.setCurPeople(accountGroup.getCurPeople() + num);
					accountGroupService.save(accountGroup);
				}
			}
		}
		return Result.success(true);
	}
	
	/**
	 * 设置群成员信息
	 */
	@RequestMapping(value="/update_group_member_info",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> updateGroupMember(Long accountGroupId,AccountGroupMember accountGroupMember){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		AccountGroupMember member = accountGroupMemberService.findByAccountGroupAndMember(accountGroupId, onlineAccount.getId());
		if(!StringUtils.isEmpty(accountGroupMember.getNickname())){
			member.setNickname(accountGroupMember.getNickname());
		}
		member.setMsgStatus(accountGroupMember.getMsgStatus());
		accountGroupMemberService.save(member);
		return Result.success(true);
	}
	
	/**
	 * 删除好友
	 * @param friendId
	 * @return
	 */
	@RequestMapping(value="/delete_friend",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> deleteFriend(Long friendId){
		Account onlineAccount = (Account)SessionUtil.get(SessionConstant.SESSION_ACCOUNT_LOGIN_KEY);
		Friend friend = friendService.find(friendId);
		if(friend != null){
			if(friend.getAccount().getId().longValue() != onlineAccount.getId().longValue()){
				return Result.error(CodeMsg.ACCOUNT_NO_FRIEND);
			}
			friendService.delete(friendId);
		}
		return Result.success(true);
	}
	
	/**
	 * 通过好友，添加成为好友
	 * @param friendList
	 * @param friend
	 */
	private void addFriend(List<Friend> friendList,Account myAccount,Account friend){
		for(Friend f : friendList){
			if(f.getFriendAccount().getId().longValue() == friend.getId().longValue()){
				//表示已经是好友，跳过
				return;
			}
		}
		//表示不是好友，需添加成好友
		Friend contacts = new Friend();
		contacts.setAccount(myAccount);
		contacts.setFriendAccount(friend);
		contacts.setRemark(friend.getUsername());
		contacts = friendService.save(contacts);
		friendList.add(contacts);
	}
	
	/**
	 * 判断是否存在与通讯录中
	 * @param addressBook
	 * @param accountId
	 * @return
	 */
	private boolean isExist(List<Friend> addressBook,Long accountId){
		for(Friend friend : addressBook){
			if(friend.getFriendAccount().getId().longValue() == accountId.longValue()){
				//表示已经是好友，跳过
				return true;
			}
		}
		return false;
	}
	
	
}
