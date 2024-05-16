package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;
import org.zerock.service.EncryptService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@AllArgsConstructor
@Log4j
public class BoardController {

	private BoardService service;
	private EncryptService encryptService;

	@GetMapping("/list")
	public void list(Model model, Criteria criteria) {
		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("pagenator", new PageDTO(criteria, service.getCount(criteria)));
	}

	@PostMapping("/register")
	public String register(BoardVO boardVO, RedirectAttributes rttr) {
		
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = req.getRemoteAddr();
		
		boardVO.setIp(ip);
		boardVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(boardVO.getPassword())));
		
		rttr.addFlashAttribute("registResult", service.register(boardVO));
		rttr.addFlashAttribute("registedBno", boardVO.getBno());

		return "redirect:/board/list";
	}
	
	@GetMapping({"/register", "/remove"})
	public void form() { }
	
//	@GetMapping("/modify")
//	public void modify(Model model, Long bno, Criteria criteria) {
//		model.addAttribute("boardVO", service.get(bno, criteria));
//		model.addAttribute(criteria);
//	}

	@GetMapping("/get")
	public void get(Long bno, Model model, Criteria criteria, String liked) {
		model.addAttribute("boardVO", service.get(bno, criteria));
		model.addAttribute(criteria);
		model.addAttribute("liked", liked);
	}

	@PostMapping("/remove")
	public String remove(Long bno, Criteria criteria) {
		service.remove(bno);

		return "redirect:/board/list?pageNum=" + criteria.getPageNum();
	}

	@PostMapping("/modify")
	public String modify(BoardVO boardVO) {
		service.modify(boardVO);

		return "redirect:/board/get?bno=" + boardVO.getBno();
	}
	
	@GetMapping("/today")
	public void today(Model model, Criteria criteria) {
		model.addAttribute("list", service.getTodayList(criteria));
		model.addAttribute("pagenator", new PageDTO(criteria, service.getTodayCount()));
	}
	
	@GetMapping("/charts")
	public void chart(Model model) {
		model.addAttribute("rankList", service.getRank(3));
	}
	
	@GetMapping("/search")
	public void search(Model model, Criteria criteria) {
		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("pagenator", new PageDTO(criteria, service.getCount(criteria)));
	}
	
	@PostMapping(value = "/likes", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	public @ResponseBody ResponseEntity<String> likes(@RequestBody Long bno) {

		return service.addlikes(bno) ? new ResponseEntity<String>("true", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PostMapping("/verifyModify")
	public String verifyModify(BoardVO boardVO, Criteria criteria, Model model) {
		boardVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(boardVO.getPassword())));
		boolean verified = service.verifyModify(boardVO);
		
		if(verified) {
			model.addAttribute("boardVO", service.get(boardVO.getBno(), criteria));
			model.addAttribute(criteria);			
		}
		
		log.info(verified);
		
		return verified ? "board/modify" : "redirect:/board/get?pageNum=" + criteria.getPageNum() + "&bno=" + boardVO.getBno() + "&liked=";
	}
}
