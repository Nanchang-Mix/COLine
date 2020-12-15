package com.yuanlrc.base.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 * 消息内容实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_msg_content")
@EntityListeners(AuditingEntityListener.class)
public class MsgContent extends BaseEntity{

/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static final String CHAT_TYPE_SINGLE = "single";//单人聊天
	
	public static final String CHAT_TYPE_GROUP = "group";//群消息
	
	public static final String MSG_TYPE_TEXT = "text";//文本消息
	
	public static final String MSG_TYPE_IMG = "img";//图片消息
	
	public static final String MSG_TYPE_FILE = "file";//文件消息
	
	public static final String MSG_TYPE_VIDEO = "video";//视频件消息
	
	public static final String MSG_TYPE_AUDIO = "audio";//音频消息
	
	@Column(name="to_id",nullable=false,length=11)
	private Long toId;//消息接受者id
	
	@Column(name="from_id",nullable=false,length=11)
	private Long fromId;//消息发送者id
	
	@Column(name="chat_type",length=12)
	private String chatType;//聊天类型
	
	@Column(name="msg_type",length=12)
	private String msgType;//消息类型
	
	@Column(name="content",length=10240)
	private String msg;//消息内容
	
	@Column(name="ext_attr",length=1280)
	private String extAttr;//消息附加字段
	
	@Column(name="attach_url",length=512)
	private String attachUrl;//附件地址
	
	@Column(name="attach_size",length=12)
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
