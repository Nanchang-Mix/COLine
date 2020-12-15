package com.yuanlrc.base.server.home;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.yuanlrc.base.bean.WebSocketMsg;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.AccountGroupMember;
import com.yuanlrc.base.entity.common.Friend;
import com.yuanlrc.base.entity.common.MsgContent;
import com.yuanlrc.base.entity.common.MsgLog;
import com.yuanlrc.base.service.common.AccountGroupMemberService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.service.common.FriendService;
import com.yuanlrc.base.service.common.MsgContentService;
import com.yuanlrc.base.service.common.MsgLogService;

@Service
@ServerEndpoint("/webSocket/{userid}")
public class WebSocket {

	public static Map<Long, WebSocket> clients = new ConcurrentHashMap<Long, WebSocket>(); 
	
	public static int onlineCount = 0;//在线人数
    
	private Long userid;//用户id
	
	private Session session;
	
	private List<Friend> friendList;
	
	private static AccountService accountService;
	
	private static FriendService friendService;
	
	private static MsgContentService msgContentService;
	
	private static MsgLogService msgLogService;
	
	private static AccountGroupMemberService accountGroupMemberService;
	
	/**
	 * 建立连接
	 * @param userid
	 * @param session
	 * @throws IOException
	 */
    @OnOpen 
    public void onOpen(@PathParam("userid") Long userid, Session session) throws IOException { 
        this.userid = userid;
        this.session = session;
        this.friendList = friendService.findMyFriendList(userid);
    	addOnlineCount(); 
        clients.put(userid, this);
        System.out.println("成功建立连接，用户ID = 【" + userid + "】,当前在线用户数：" + onlineCount);
        //检查该用户是否有未读消息
        loadUnReadMsg(userid);
        //给所有好友发送上线消息
        onlineNotice(userid);
    } 
   
	/**
     * 连接关闭
     * @throws IOException
     */
    @OnClose 
    public void onClose() throws IOException { 
        clients.remove(userid); 
        subOnlineCount();
        //给所有好友发送下线消息
        offlineNotice(userid);
        System.out.println("已断开连接，用户ID = 【" + userid + "】,当前在线用户数：" + onlineCount);
    } 
   
    /**
     * 当收到信息
     * @param message
     * @throws IOException
     */
    @OnMessage 
    public void onMessage(String message) throws IOException { 
    	WebSocketMsg webSocketMsg = JSONObject.parseObject(message, WebSocketMsg.class);
    	System.out.println(webSocketMsg);
    	sendMsg(webSocketMsg);
    	
    } 
   
    /**
     * 发生错误
     * @param session
     * @param error
     */
    @OnError 
    public void onError(Session session, Throwable error) { 
        error.printStackTrace(); 
    } 
    
       
    public void sendMessageAll(String message) throws IOException { 
        for (WebSocket item : clients.values()) { 
            item.session.getAsyncRemote().sendText(message); 
        } 
    } 
   
    public static synchronized int getOnlineCount() { 
        return onlineCount; 
    } 
   
    public static synchronized void addOnlineCount() { 
        WebSocket.onlineCount++; 
    } 
   
    public static synchronized void subOnlineCount() { 
        WebSocket.onlineCount--; 
    } 
   
    public static synchronized Map<Long, WebSocket> getClients() { 
        return clients;
    }
    
    /**
     * 发送消息
     * @param webSocketMsg
     */
    public void sendMsg(WebSocketMsg webSocketMsg){
    	if(WebSocketMsg.CHAT_TYPE_SINGLE.equals(webSocketMsg.getChatType())){
    		//单人聊天
    		sendSingleMsg(webSocketMsg);
    		return;
    	}
    	if(WebSocketMsg.CHAT_TYPE_GROUP.equals(webSocketMsg.getChatType())){
    		//群聊天
    		sendGroupMsg(webSocketMsg);
    		return;
    	}
    	if(WebSocketMsg.CHAT_TYPE_EVENT.equals(webSocketMsg.getChatType())){
    		//事件
    		if(WebSocketMsg.MSG_TYPE_REFRESH_FRIEND_LIST.equals(webSocketMsg.getMsgType())){
    			//刷新好友列表
    			refreshFriendList(webSocketMsg);
    		}
    		return;
    	}
    }
	

	/**
     * 发送单人一对一聊天消息
     * @param webSocket
     * @param webSocketMsg
     */
    public void sendSingleMsg(WebSocketMsg webSocketMsg){
    	WebSocket webSocket = clients.get(webSocketMsg.getToId());
    	Friend friend = null;
    	if(webSocket != null){
    		friend = webSocket.getFriend(webSocketMsg.getFromId());
    	}else{
    		List<Friend> myFriendList = friendService.findMyFriendList(webSocketMsg.getToId());
    		for(Friend f: myFriendList){
    			if(f.getFriendAccount().getId().longValue() == webSocketMsg.getFromId().longValue()){
    				friend = f;
    				break;
    			}
    		}
    	}
    	if(friend == null){
    		//表示对方删除了你
			webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_NOTICE);
			webSocketMsg.setToId(userid);
			webSocketMsg.setMsg("你还不是对方的好友，请先加好友！");
			session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
			return;
    	}
		if(friend.getStatus() == Friend.FRIEND_STATUS_BLOCK){
    		//表示对方拉黑了你
    		webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_NOTICE);
    		webSocketMsg.setToId(userid);
    		webSocketMsg.setMsg("你已被对方拉黑，无法发送消息！");
    		session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
    		return;
    	}

    	webSocketMsg.setFromId(friend.getId());
    	String extAttr = friend.getRemark() + ";" + friend.getFriendAccount().getHeadPic();
    	//将成员的头像和昵称放在附加字段中
    	webSocketMsg.setExtAttr(extAttr);
    	if(webSocketMsg.getMsgType() == WebSocketMsg.MSG_TYPE_ONLINE){
    		webSocketMsg.setMsg("您的好友【" + friend.getRemark() + "】上线啦！");
    	}
    	if(webSocketMsg.getMsgType() == WebSocketMsg.MSG_TYPE_OFFLINE){
    		webSocketMsg.setMsg("您的好友【" + friend.getRemark() + "】下线啦！");
    	}
    	if(webSocket != null){
    		webSocket.session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
    	}
    	
    	if(webSocketMsg.getMsgType() == WebSocketMsg.MSG_TYPE_NOTICE || webSocketMsg.getMsgType() == WebSocketMsg.MSG_TYPE_ONLINE || webSocketMsg.getMsgType() == WebSocketMsg.MSG_TYPE_OFFLINE){
    		//通知信息不需要保存到数据库
    		return;
    	}
    	//消息保存到数据库
    	saveMsgLog(accountService.find(webSocketMsg.getToId()),saveMsgContent(webSocketMsg));
    }
    
    /**
     * 发送群聊天信息
     * @param webSocketMsg
     */
    public void sendGroupMsg(WebSocketMsg webSocketMsg){
    	//首先根据群id获取群成员
    	List<AccountGroupMember> accountGroupMemberList = accountGroupMemberService.findByGroup(webSocketMsg.getToId());
    	if(accountGroupMemberList == null){
    		//表示该群已解散
			webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_NOTICE);
			webSocketMsg.setToId(userid);
			webSocketMsg.setMsg("该群已被群主解散！");
			session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
			return;
    	}
    	AccountGroupMember accountGroupMember = getAccountGroupMember(accountGroupMemberList,webSocketMsg.getFromId());
    	if(accountGroupMember == null){
    		webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_NOTICE);
			webSocketMsg.setToId(userid);
			webSocketMsg.setMsg("您已被群主移除该群，群成员将不能接受您发送的消息！");
			session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
			return;
    	}
    	//说明这个群成员在线
		String extAttr = accountGroupMember.getNickname() + ";" + accountGroupMember.getMember().getHeadPic();
		//将发送消息成员的头像和昵称放在附加字段中
		webSocketMsg.setExtAttr(extAttr);
		MsgContent msgContent = saveMsgContent(webSocketMsg);
    	//遍历群成员
    	for(AccountGroupMember ag : accountGroupMemberList){
    		//排除给自己发消息
    		if(ag.getMember().getId().longValue() != webSocketMsg.getFromId().longValue()){
    			WebSocket webSocket = clients.get(ag.getMember().getId());
    			if(webSocket != null){
    				webSocket.session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
    			}
    			//消息保存到数据库
    	    	saveMsgLog(ag.getMember(),msgContent);
    		}
    	}
    }
    
    /**
     * 根据账号id获取好友id
     * @param userId
     * @return
     */
    private Friend getFriend(Long userId){
    	for(Friend f : friendList){
    		if(f.getFriendAccount().getId().longValue() == userId.longValue()){
    			return f;
    		}
    	}
    	return null;
    }
    
    /**
     * 加载未读消息
     * @param userId
     */
    private void loadUnReadMsg(Long userId){
    	List<MsgLog> msgLogs = msgLogService.findByAccountIdAndStatus(userId, MsgLog.MSG_STATUS_UNREAD);
    	for(MsgLog msgLog : msgLogs){
    		this.session.getAsyncRemote().sendText(JSONObject.toJSONString(msgLog.getMsgContent()));
    		msgLog.setStatus(MsgLog.MSG_STATUS_READ);
    		//标记为已读
    		msgLogService.save(msgLog);
    	}
    }
    
    /**
     * 从群中获取发送者成员
     * @param accountGroupMemberList
     * @param id
     * @return
     */
    private AccountGroupMember getAccountGroupMember(List<AccountGroupMember> accountGroupMemberList,Long id){
    	for(AccountGroupMember ag : accountGroupMemberList){
    		if(ag.getMember().getId().longValue() == id.longValue())return ag;
    	}
    	return null;		
    }
    
    /**
     * 消息内容保存到数据库
     * @param webSocketMsg
     * @return
     */
    private MsgContent saveMsgContent(WebSocketMsg webSocketMsg){
    	MsgContent msgContent = new MsgContent();
    	msgContent.setAttachSize(webSocketMsg.getAttachSize());
    	msgContent.setAttachUrl(webSocketMsg.getAttachUrl());
    	msgContent.setChatType(webSocketMsg.getChatType());
    	msgContent.setExtAttr(webSocketMsg.getExtAttr());
    	msgContent.setFromId(webSocketMsg.getFromId());
    	msgContent.setMsg(webSocketMsg.getMsg());
    	msgContent.setMsgType(webSocketMsg.getMsgType());
    	msgContent.setToId(webSocketMsg.getToId());
    	return msgContentService.save(msgContent);
    }
    
    /**
     * 保存消息记录
     * @param userId
     * @param msgContent
     */
    private void saveMsgLog(Account account,MsgContent msgContent){
    	MsgLog msgLog = new MsgLog();
    	msgLog.setAccount(account);
    	msgLog.setMsgContent(msgContent);
    	WebSocket webSocket = clients.get(account.getId());
    	msgLog.setStatus(webSocket == null ? MsgLog.MSG_STATUS_UNREAD : MsgLog.MSG_STATUS_READ);
    	msgLogService.save(msgLog);
    }
    
    /**
     * 群发用户上线通知
     * @param userid
     */
    public void onlineNotice(Long userid) {
		//首先遍历该用户的所有好友
		for(Friend friend : friendList){
			//获取在线的好友
			WebSocket webSocket = clients.get(friend.getFriendAccount().getId());
			if(webSocket != null){
				//表示这个好友在线
				WebSocketMsg webSocketMsg = new WebSocketMsg();
				webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_ONLINE);
				webSocketMsg.setToId(friend.getFriendAccount().getId());
				webSocketMsg.setFromId(userid);
				sendSingleMsg(webSocketMsg);
			}
		}
	}
    
    /**
     * 群发用户下线通知
     * @param userid
     */
    public void offlineNotice(Long userid) {
    	//首先遍历该用户的所有好友
    	for(Friend friend : friendList){
    		//获取在线的好友
    		WebSocket webSocket = clients.get(friend.getFriendAccount().getId());
    		if(webSocket != null){
    			//表示这个好友在线，发送消息
    			WebSocketMsg webSocketMsg = new WebSocketMsg();
    			webSocketMsg.setMsgType(WebSocketMsg.MSG_TYPE_OFFLINE);
    			webSocketMsg.setToId(friend.getFriendAccount().getId());
    			webSocketMsg.setFromId(userid);
    			sendSingleMsg(webSocketMsg);
    		}
    	}
    }
    
    /**
     * 刷新好友列表
     * @param webSocketMsg
     */
    public void refreshFriendList(WebSocketMsg webSocketMsg) {
		String msg = webSocketMsg.getMsg();
		if(!StringUtils.isEmpty(msg)){
			String[] split = msg.split(",");
			webSocketMsg.setMsg("您的好友列表有更新啦，快来看看吧！");
			for(String id : split){
				Long uid = Long.valueOf(id);
				WebSocket webSocket = clients.get(uid);
				if(webSocket != null){
					webSocket.friendList = friendService.findMyFriendList(uid);
					clients.put(uid, webSocket);
					webSocket.session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
				}
			}
		}
		//更新自己的好友列表
		friendList = friendService.findMyFriendList(userid);
		session.getAsyncRemote().sendText(JSONObject.toJSONString(webSocketMsg));
	}
    
    @Autowired
    public void setFriendService(FriendService friendService){
    	WebSocket.friendService = friendService;
    }
    
    @Autowired
    public void setMsgContentService(MsgContentService msgContentService){
    	WebSocket.msgContentService = msgContentService;
    }
    
    @Autowired
    public void setMsgLogService(MsgLogService msgLogService){
    	WebSocket.msgLogService = msgLogService;
    }
    
    @Autowired
    public void setAccountGroupMemberService(AccountGroupMemberService accountGroupMemberService){
    	WebSocket.accountGroupMemberService = accountGroupMemberService;
    }
    
    @Autowired
    public void setAccountService(AccountService accountService){
    	WebSocket.accountService = accountService;
    }
}
