package com.Edu.RestController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.Edu.Domain.Board;
import com.Edu.Service.BoardService;
import com.Edu.Service.EtcService;

@RestController
@RequestMapping("/board/")
public class RestBoardController {    
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
 
	@Autowired
	private BoardService boardService;

	@Autowired
	private EtcService etcService;	
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void register(Board board){
		boardService.create(board);
	}
	
	
	@RequestMapping(value = "/{boardId}", method = RequestMethod.GET)
	@ResponseBody
	public Board getBoard(@PathVariable String boardId){
		int parameterBoardId = Integer.parseInt(boardId);
		return boardService.findOne(parameterBoardId);
	}
//	
//	@RequestMapping(value = "/board/add", method = RequestMethod.POST)
//	public void Board(Board board ){
//		boardService.create(board);
//	}
//	
//	@RequestMapping(value = "/board/update/{boardId}", method = RequestMethod.PUT)
//	public void Board(Board board, @PathVariable int boardId ){
//		boardService.update(board);
//	}
//	
//	@RequestMapping(value = "/board/update/{boardId}", method = RequestMethod.DELETE)
//	public void Board(@PathVariable int boardId ){
//		boardService.delete(boardId);
//	}
}
