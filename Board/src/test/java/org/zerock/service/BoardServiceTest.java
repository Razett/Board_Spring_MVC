package org.zerock.service;

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
public class BoardServiceTest {

	@Autowired
	private BoardService boardService;
	
//	@Test
	public void testAllMethods() {
		for (int i = 57; i < 2400056; i++) {
			
			BoardVO vo = new BoardVO();
			vo.setTitle("테스트 제목" + i);
			vo.setContent("테스트 내용" + i);
			vo.setWriter("user00");
			vo.setIp("127.0.0.1");
			
			log.debug("register() Test: Affected Row - " + boardService.register(vo));
		}


	}
	
//	@Test
	public void testGetTodayList() {
		log.debug(boardService.getTodayList(new Criteria()));
	}
	
//	@Test
	public void testSearch() {
		log.debug(boardService.getList(new Criteria()));
		
	}
	
	@Test
	public void testSearchCount() {
		log.debug(boardService.getCount(new Criteria()));
	}
}
