package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.RankVO;

public interface BoardMapper {

//	@Select("select * from tbl_board where bno > 0 order by regdate desc")
	public List<BoardVO> getList(Criteria criteria);
	
	public BoardVO read(long bno);
	
	@Deprecated
	public int insert(BoardVO boardVO);
	
	public int insertSelectKey(BoardVO boardVO);
	
	public int update(BoardVO boardVO);
	
	public int delete(long bno);
	
	public List<BoardVO> search(BoardVO boardVO);
	
	public long count(Criteria criteria);
	
	public BoardVO lastBoard();
	
	public List<RankVO> rank(int limit);
	
	public List<BoardVO> getToday(Criteria criteria);
	
	public long getTodayCount();
	
	public void countAcc();
	
	public void updateViews(long bno);
	
	public int addLikes(long bno);
	
	public BoardVO verifyModify(BoardVO boardVO);
}
