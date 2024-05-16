package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	public int insert(ReplyVO replyVO);
	
	public int insertSelectKey(ReplyVO replyVO);
	
	public int update(ReplyVO replyVO);
	
	public int delete(ReplyVO replyVO);
	
	public List<ReplyVO> getList(@Param("bno") long bno, @Param("criteria") Criteria criteria);
	
	public ReplyVO get(long rno);
	
	public Long count(long bno);
	
	public ReplyVO verifyPassword(ReplyVO replyVO);
}
