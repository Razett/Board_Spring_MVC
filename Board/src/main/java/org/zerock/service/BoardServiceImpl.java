package org.zerock.service;

import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.RankVO;
import org.zerock.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	private StringUtil stringUtil;

	@Override
	public long register(BoardVO boardVO) {
		removeScript(boardVO);
		
		log.debug("Insert Object: " + boardVO.toString());
		return mapper.insertSelectKey(boardVO);
	}

	@Override
	public BoardVO get(Long bno, Criteria criteria) {
		log.debug("Select Object, of bno: " + bno);
		if (criteria.getOrigin().equals("list"))
			mapper.updateViews(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO boardVO) {
		removeScript(boardVO);
		
		log.debug("Update Object: " + boardVO);
		return mapper.update(boardVO) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.debug("Delete Object, of bno: " + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria criteria) {
		log.debug("Select All Objects, no limit");
		return mapper.getList(criteria);
	}

	@Override
	public List<BoardVO> getTodayList(Criteria criteria) {
		log.debug("Select Today Objects, no limit");
		return mapper.getToday(criteria);
	}

	@Override
	public Long getCount(Criteria criteria) {
		// TODO Auto-generated method stub
		return mapper.count(criteria);
	}

	@Override
	public List<RankVO> getRank(int limit) {
		// TODO Auto-generated method stub
		return mapper.rank(limit);
	}

	@Override
	public Long getTodayCount() {
		// TODO Auto-generated method stub
		return mapper.getTodayCount();
	}

	@Override
	public void countAcc() {
		// TODO Auto-generated method stub
		mapper.countAcc();
	}

	@Override
	public boolean addlikes(Long bno) {
		// TODO Auto-generated method stub
		return mapper.addLikes(bno) == 1;
	}

	@Override
	public boolean verifyModify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		return mapper.verifyModify(boardVO) != null;
	}
	
	private BoardVO removeScript(BoardVO boardVO) {
		if (boardVO.getTitle() != null && boardVO.getTitle() != "")
			boardVO.setTitle(stringUtil.removeScriptTags(boardVO.getTitle()));
		if (boardVO.getContent() != null && boardVO.getContent() != "")
			boardVO.setContent(stringUtil.removeScriptTags(boardVO.getContent()));
		if (boardVO.getWriter() != null && boardVO.getWriter() != "")
			boardVO.setWriter(stringUtil.removeScriptTags(boardVO.getWriter()));
		
		return boardVO;
	}

}
