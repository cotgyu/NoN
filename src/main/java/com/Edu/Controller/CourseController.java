package com.Edu.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/course/")
public class CourseController {
	
	//코스 클릭하였을 때 코스 소개 관련 
	//todo - intro 뒤에 숫자 받아서 코스 숫자에 맞게 데이터 불러오기
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String intro( ModelAndView mav){

		return "/course/introview";
	}

	//강의 듣기 눌렀을 때 나올 플레이어 관련 
	//todo - 강의 번호에 맞게 데이터 불러오기 
	@RequestMapping(value = "/player", method = RequestMethod.GET)
	public String player( ModelAndView mav){

		return "/course/player";
	}

}
