package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;

public interface ReplyService {
	
	public boolean register(ReplyVO replyVO);
	
	public boolean modify(ReplyVO replyVO);
	
	public boolean remove(ReplyVO replyVO);
	
	public ReplyPageDTO getList(long bno, Criteria criteria);
	
	public Long count(long bno);
	
	public boolean verifyPassword(ReplyVO replyVO);
}
