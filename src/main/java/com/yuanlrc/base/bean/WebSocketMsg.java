package com.yuanlrc.base.bean;

import org.springframework.stereotype.Component;

/**
 * 封装前端消息体
 * @author llq
 *
 */
@Component
public class WebSocketMsg {

	public static final String CHAT_TYPE_SINGLE = "single";//单人聊天
	
	public static final String CHAT_TYPE_GROUP = "group";//群消息
	
	public static final String CHAT_TYPE_EVENT = "event";//事件消息
	
	public static final String MSG_TYPE_TEXT = "text";//文本消息
	
	public static final String MSG_TYPE_IMG = "img";//图片消息
	
	public static final String MSG_TYPE_FILE = "file";//文件消息
	
	public static final String MSG_TYPE_VIDEO = "video";//视频件消息
	
	public static final String MSG_TYPE_AUDIO = "audio";//音频消息
	
	public static final String MSG_TYPE_NOTICE = "notice";//通知消息
	
	public static final String MSG_TYPE_ONLINE = "online";//上线消息
	
	public static final String MSG_TYPE_OFFLINE = "offline";//下线消息
	
	public static final String MSG_TYPE_REFRESH_FRIEND_LIST = "refresh_friend_list";//上线消息
	
	private Long toId;//消息接受者id
	
	private Long fromId;//消息发送者id
	
	private String chatType;//聊天类型
	
	private String msgType;//消息类型
	
	private String msg;//消息内容
	
	private String extAttr;//消息附加字段
	
	private String attachUrl;//附件地址
	
	private long attachSize;//附件大小

	public Long getToId() {
		return toId;
	}

	public void setToId(Long toId) {
		this.toId = toId;
	}

	public Long getFromId() {
		return fromId;
	}

	public void setFromId(Long fromId) {
		this.fromId = fromId;
	}

	

	public String getChatType() {
		return chatType;
	}

	public void setChatType(String chatType) {
		this.chatType = chatType;
	}

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getAttachUrl() {
		return attachUrl;
	}

	public void setAttachUrl(String attachUrl) {
		this.attachUrl = attachUrl;
	}

	public long getAttachSize() {
		return attachSize;
	}

	public void setAttachSize(long attachSize) {
		this.attachSize = attachSize;
	}

	public String getExtAttr() {
		return extAttr;
	}

	public void setExtAttr(String extAttr) {
		this.extAttr = extAttr;
	}

	@Override
	public String toString() {
		return "WebSocketMsg [toId=" + toId + ", fromId=" + fromId
				+ ", chatType=" + chatType + ", msgType=" + msgType + ", msg="
				+ msg + ", extAttr=" + extAttr + ", attachUrl=" + attachUrl
				+ ", attachSize=" + attachSize + "]";
	}

	

	
	
	
}
