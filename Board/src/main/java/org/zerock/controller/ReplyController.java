package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;
import org.zerock.service.EncryptService;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
@RequestMapping("/reply/")
public class ReplyController {

	private ReplyService service;
	private BoardService boardService;
	private EncryptService encryptService;

	@PostMapping(value = "/new", consumes = MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@RequestBody ReplyVO replyVO) {
		replyVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(replyVO.getPassword())));

		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = req.getRemoteAddr();
		
		
		replyVO.setIp(ip);
		
		return service.register(replyVO) ? new ResponseEntity<String>("true", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT,
			RequestMethod.PATCH }, consumes = "application/json;charset=UTF-8", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> modify(@PathVariable("rno") Long rno, @RequestBody ReplyVO replyVO) {
		replyVO.setRno(rno);
		replyVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(replyVO.getPassword())));

		return service.modify(replyVO) == true ? new ResponseEntity<>("true", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE, consumes = "application/json;charset=UTF-8", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> delete(@PathVariable("rno") Long rno, @RequestBody ReplyVO replyVO) {
		replyVO.setRno(rno);
		replyVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(replyVO.getPassword())));

		return service.remove(replyVO) == true ? new ResponseEntity<String>("true", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/bno/{bno}/{pageNum}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("bno") Long bno,
			@PathVariable("pageNum") Integer pageNum) {

		Criteria criteria = new Criteria();
		criteria.setPageNum(pageNum);
		criteria.setAmount(15);
		
		return boardService.get(bno, new Criteria()) != null
				? new ResponseEntity<ReplyPageDTO>(service.getList(bno, criteria), HttpStatus.OK)
				: new ResponseEntity<ReplyPageDTO>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(value = "/verify", method = RequestMethod.POST, consumes = "application/json;charset=UTF-8", produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> verify(@RequestBody ReplyVO replyVO) {
		replyVO.setPassword(encryptService.encryptSHA256(encryptService.decryptRSA(replyVO.getPassword())));

		return service.verifyPassword(replyVO) == true ? new ResponseEntity<String>("true", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
