package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {

	@Autowired
	ReplyMapper mapper;
	
	@Test
	public void testInsertSelectKey() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(6688l);
		vo.setReply("댓글 샘플 데이터");
		vo.setReplyer("user00");
		vo.setIp("127.0.0.1");
		
		log.debug(mapper.insertSelectKey(vo));
	}
	
	@Test
	public void testUpdate() {
		ReplyVO vo = mapper.get(1l);
		
		if (vo != null) {
			vo.setReply("댓글 샘플 데이터 수정됨.");
			
			log.debug(mapper.update(vo));
			log.debug(mapper.get(1l));
		}
	}
	
	@Test
	public void testDelete() {
		log.debug(mapper.delete(new ReplyVO()));
	}
	
	@Test
	public void testCount() {
		log.debug("Total Count: " + mapper.count(6688l));
	}
	
	@Test
	public void getList() {
		Criteria criteria = new Criteria();
		criteria.setPageNum(1);
		criteria.setAmount(15);
		log.debug("getList() - " + mapper.getList(6688l, criteria));
	}
	
}
