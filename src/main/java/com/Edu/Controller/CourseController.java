package com.Edu.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;
import com.Edu.Service.CourseService;

@Controller
@RequestMapping("/course/")
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	//cosno에 맞는 소개 페이지 관련
	@RequestMapping(value = "/intro/{cosno}", method = RequestMethod.GET)
	public ModelAndView test( ModelAndView mav, @PathVariable("cosno") int cosno){
		
		//cosno에 맞는 코스정보 불러오기
		Course course = courseService.findcos(cosno);
		
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecture = courseService.findcos_lec(cosno);
		
		//map에 정보 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("course", course); 
		map.put("lecture", lecture);
		
		//modelandview에 map 저장 
		mav = new ModelAndView();
		mav.addObject("map",map);
		
		mav.setViewName("/course/introview");
		
		return mav;
	}


	//강의 듣기 눌렀을 때 나올 플레이어 관련 
	//todo - 강의 번호에 맞게 데이터 불러오기 
	@RequestMapping(value = "/player", method = RequestMethod.GET)
	public String player( ModelAndView mav){

		return "/course/player";
	}
	

}
