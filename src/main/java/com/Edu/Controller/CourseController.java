package com.Edu.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public ModelAndView Courseintro( ModelAndView mav, @PathVariable("cosno") int cosno){
		
		//cosno에 맞는 코스정보 불러오기
		Course course = courseService.findCos(cosno);
		
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecture = courseService.findCos_lec(cosno);
		
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("course",course);
		mav.addObject("lecture",lecture);
		
		mav.setViewName("/course/introview");
		
		return mav;
	}

	
	//강의 듣기 눌렀을 때 나올 플레이어 관련 
	@RequestMapping(value = "/player/{cosno}/{lecno}", method = RequestMethod.GET)
	public ModelAndView Player( ModelAndView mav, @PathVariable("cosno") int cosno, @PathVariable("lecno") int lecno ){
		
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecturelist = courseService.findCos_lec(cosno);
		
		//lecno에 맞는 영상 불러오기
		Lecture lecture = courseService.findLecVideo(lecno); 
		
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("lecturelist",lecturelist);
		mav.addObject("lecture",lecture);
				
		mav.setViewName("/course/player");
				
		return mav;
	}
	
	
	//코스 리스트 불러오기
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView CourseList( ModelAndView mav){
		
		//모든 코스 가져오기 
		List<Course> courseList = courseService.findCosList();
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("courselist",courseList);
				
		mav.setViewName("/course/courselist");
				
		return mav;
	}
		
	
	//todo - insert 한글깨짐, 등록 실패시 오류 페이지 만들기? 
	//코스 추가 창 이동
	@RequestMapping(value = "/addcourse", method = RequestMethod.GET)
	public ModelAndView AddCourse( ModelAndView mav){
		//카테고리를 가져오기 위한 코스 불러오기 
		List<Course> courseList = courseService.findCosCategory();
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("courselist",courseList);
		
		mav.setViewName("/course/courseinsert");
				
		return mav;
	}
	//새로운 코스 추가
	@RequestMapping(value = "/insertcourse", method = RequestMethod.POST)
	public String InsertCourse( ModelAndView mav, @ModelAttribute Course cos){
		
		courseService.insertCourse(cos);
		
		return "redirect:/course/list";
	}
	
	
	//todo - 등록 실패시 오류 페이지 만들기?
	//강의 추가 창 이동
	@RequestMapping(value = "/addlecture", method = RequestMethod.GET)
	public ModelAndView AddLecture( ModelAndView mav){
		
		//코스번호를 가져오기 위한 코스 불러오기 
		List<Course> courseList = courseService.findCosList();
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("courselist",courseList);	
		
		mav.setViewName("/course/lectureinsert");
				
		return mav;
	}
	//새로운 강의 추가
	@RequestMapping(value = "/insertlecture", method = RequestMethod.POST)
	public String InsertLecture( ModelAndView mav, @ModelAttribute Lecture lecture){
		
		courseService.insertLecture(lecture);
		
		
		return "redirect:/course/list";
	}

}
