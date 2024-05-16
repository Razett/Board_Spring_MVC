package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.RankVO;

public interface BoardService {

	public long register(BoardVO boardVO);
	
	public BoardVO get(Long bno, Criteria criteria);
	
	public boolean modify(BoardVO boardVO);
	
	public boolean remove(Long bno);
	
	public List<BoardVO> getList(Criteria criteria);
	
	public List<BoardVO> getTodayList(Criteria criteria);
	
	public Long getCount(Criteria criteria);
	
	public Long getTodayCount();

	public List<RankVO> getRank(int limit);
	
	public void countAcc();
	
	public boolean addlikes(Long bno);
	
	public boolean verifyModify(BoardVO boardVO);
	
}
