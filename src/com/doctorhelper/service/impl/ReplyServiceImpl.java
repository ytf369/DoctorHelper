package com.doctorhelper.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doctorhelper.dao.reply.IReplyDao;
import com.doctorhelper.entity.Message;
import com.doctorhelper.entity.Reply;
import com.doctorhelper.service.IReplySevice;
@Service
public class ReplyServiceImpl implements IReplySevice {
@Autowired	
private IReplyDao replydao;
    /**
     * 保存回复
     */
	@Override
	public Message saveReply(Reply reply) {
		Message mg=new Message();
		try {
			replydao.save(reply);
			mg.setCode(1);
			mg.setText("success");
		} catch (Exception e) {
			e.printStackTrace();
			mg.setCode(0);
			mg.setText("falied");
		}
		return mg;
	}
	/**
	 * 根据Id查询回复
	 */
	@Override
	public Reply getReplyByid(Long id) {
		return replydao.findById(Reply.class, id);
	}

}
