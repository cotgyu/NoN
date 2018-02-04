package com.Edu.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
}
