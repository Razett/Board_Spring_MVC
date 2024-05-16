package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Autowired
	BoardMapper mapper;
	
//	@Test
	public void testGetList() {
		mapper.getList(new Criteria()).forEach(x -> log.debug(x));
	}
	
//	@Test
	public void testRead() {
		log.debug(mapper.read(2l).toString());
	}
	
//	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 제목7");
		vo.setContent("테스트 내용7");
		vo.setWriter("user03");
		log.debug(mapper.insert(vo));
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트 제목17");
		vo.setContent("테스트 내용17");
		vo.setWriter("user00");
		log.debug(mapper.insertSelectKey(vo));
	}
	
//	@Test
	public void testUpdate() {
		BoardVO vo = mapper.read(5l);
		
		if (vo != null) {
			vo.setContent("수정된 내용5");
			
			log.debug(mapper.update(vo));
			log.debug(mapper.read(vo.getBno()));
		}
	}
	
//	@Test
	public void testDelete() {
		log.debug(mapper.delete(7l));
	}
	
//	@Test
	public void testCount() {
		log.debug("Total Count: " + mapper.count(new Criteria()));
	}
	
//	@Test
	public void testLastBoard() {
		log.debug("Last Board: " + mapper.lastBoard().toString());
	}
	
//	@Test
	public void testRank() {
		log.debug("Rank 1 to 3: " + mapper.rank(3).toString());
	}
	
//	@Test
	public void testGetToday() {
		log.debug(mapper.getToday(new Criteria()));
	}
}
