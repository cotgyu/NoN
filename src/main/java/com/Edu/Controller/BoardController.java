package com.Edu.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Edu.Dao.EtcDao;
import com.Edu.Service.BoardService;
import com.Edu.Service.EtcService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;

	@Autowired
	private EtcService etcService;	

	@Autowired
	private EtcDao etcDao;
	
	@RequestMapping(value = "/board/{boardId}", method = RequestMethod.GET)
	public String Board(@PathVariable int boardId, ModelAndView mav){
//		boardService.getCode("");
		mav.addObject(etcDao.findByGroup(""));
		return "boardForm";
	}
	
}
