package com.yuanlrc.base.bean;

import java.util.List;

import org.springframework.stereotype.Component;

import com.yuanlrc.base.entity.common.MsgLog;

/**
 * 消息后台管理展示类
 * @author Administrator
 *
 */
@Component
public class MsgVo {

	private String sender;//发送者
	
	private String reciever;//接受者
	
	private List<MsgLog> msgLogs;//关联消息记录

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public List<MsgLog> getMsgLogs() {
		return msgLogs;
	}

	public void setMsgLogs(List<MsgLog> msgLogs) {
		this.msgLogs = msgLogs;
	}
	
	
}
