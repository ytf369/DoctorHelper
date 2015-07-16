package com.doctorhelper.service;

import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Reply;

public interface IReplySevice {
	//保存回复
	Message saveReply(Reply reply);
	//根据Id查询回复
	Reply getReplyByid(Long id);
}
