package org.zerock.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class ExceptionHandler {
	
	@org.springframework.web.bind.annotation.ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	@RequestMapping("/404")
	public String NoHandlerExcept(Exception e, Model model) {
		model.addAttribute(e.getMessage());
		log.error(e.getMessage());
		return "/404";
	}
}
