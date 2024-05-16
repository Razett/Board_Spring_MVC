package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper mapper;
	private StringUtil stringUtil;
	
	@Override
	public boolean register(ReplyVO replyVO) {
		removeScript(replyVO);
		log.debug("Insert Reply: " + replyVO.toString());
		
		return mapper.insertSelectKey(replyVO) == 1;
	}

	@Override
	public boolean modify(ReplyVO replyVO) {
		removeScript(replyVO);
		log.debug("Update Reply: " + replyVO);
		
		return mapper.update(replyVO) == 1;
	}

	@Override
	public boolean remove(ReplyVO replyVO) {
		log.debug("Delete Reply, of rno: " + replyVO.getRno());

		return mapper.delete(replyVO) == 1;
	}

	@Override
	public ReplyPageDTO getList(long bno, Criteria criteria) {
		log.debug("Select All Replys, of bno: " + bno);

		return new ReplyPageDTO(mapper.getList(bno, criteria), mapper.count(bno));
	}

	@Override
	public Long count(long bno) {

		return mapper.count(bno);
	}

	@Override
	public boolean verifyPassword(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		return mapper.verifyPassword(replyVO) != null;
	}
	
	private ReplyVO removeScript(ReplyVO replyVO) {
		if(replyVO.getReply() != null && replyVO.getReply() != "")
			replyVO.setReply(stringUtil.removeScriptTags(replyVO.getReply()));
		if(replyVO.getReplyer() != null && replyVO.getReplyer() != "")
			replyVO.setReplyer(stringUtil.removeScriptTags(replyVO.getReplyer()));
		
		return replyVO;
	}

}
