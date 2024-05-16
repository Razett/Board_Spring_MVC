package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BoardControllerTest {

	@Autowired
	private WebApplicationContext context;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		log.debug("Junit before method, setup() called.");

		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testList() throws Exception {
		log.debug(mockMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	}

	@Test
	public void testRegister() throws Exception {
		log.info("Test register(). " + mockMvc
				.perform(MockMvcRequestBuilders.post("/board/register").param("title", "테스트 제목28")
				.param("content", "테스트 내용28").param("writer", "user00"))
				.andReturn().getModelAndView().getViewName());
	}
	
	@Test
	public void testGet() throws Exception {
		log.info("Test get(). " + mockMvc
				.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "5"))
				.andReturn().getModelAndView().getViewName());
	}
	
	@Test
	public void testRemove() throws Exception {
		log.info("Test remove(). " + mockMvc
				.perform(MockMvcRequestBuilders.post("/board/remove").param("bno", "27"))
				.andReturn().getModelAndView().getViewName());
	}
	
	@Test
	public void testModify() throws Exception {
		log.info("Test register(). " + mockMvc
				.perform(MockMvcRequestBuilders.post("/board/modify").param("title", "수정된 제목28")
				.param("content", "수정된 내용28").param("bno", "28"))
				.andReturn().getModelAndView().getViewName());
	}
}
