package com.Edu.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
		
		//cosno에 맞는 코스정보 불러오기
		Course course = courseService.findCos(cosno);				
		
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecturelist = courseService.findCos_lec(cosno);
		
		//lecno에 맞는 영상 불러오기
		Lecture lecture = courseService.findLecVideo(lecno); 
		
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("course",course);
		mav.addObject("lecturelist",lecturelist);
		mav.addObject("lecture",lecture);
				
		mav.setViewName("/course/player");
				
		return mav;
	}
	
	
	//코스 리스트 불러오기
	@RequestMapping(value = "/list")
	public ModelAndView CourseList( ModelAndView mav){		
		//시간순으로 코스 가져오기(9개) 
		List<Course> newCourseList = courseService.findNewCosList();
				
		//추천수 많은  코스 가져오기(9개) 
		List<Course> popCourseList = courseService.findPopCosList();
						
		//프로그래밍 상세 카테고리 가져오기
		List<Course> ProgrammingCategory = courseService.findProgrammingCategory();
		//디자인 상세 카테고리 가져오기
		List<Course> DesignCategory = courseService.findDesignCategory();
		//비즈니스  상세 카테고리 가져오기
		List<Course> BusinessCategory = courseService.findBusinessCategory();
				
				
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("newcourselist",newCourseList);
		mav.addObject("popcourselist",popCourseList);
		
		
		mav.addObject("programmingcategory",ProgrammingCategory);
		mav.addObject("designcategory",DesignCategory);
		mav.addObject("businesscategory",BusinessCategory);
		
		mav.setViewName("/course/courselist");
				
		return mav;
	}
	
	//검색한 코스 리스트 불러오기
		@RequestMapping(value = "/searchlist")
		public ModelAndView SearchCourseList( ModelAndView mav, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="all") String searchOption){
			
			//모든 코스 가져오기 
			List<Course> courseList = courseService.findCosList(searchOption,keyword);
			
			//modelandview에 정보 저장 
			mav = new ModelAndView();
			mav.addObject("courselist",courseList);
			mav.addObject("keyword", keyword);
			mav.addObject("searchOption", searchOption);
			
			mav.setViewName("/course/course_searchlist");
					
			return mav;
		}
	
		
	
	//todo - insert 한글깨짐, 등록 실패시 오류 페이지 만들기? 
	//코스 추가 창 이동
	@RequestMapping(value = "/addcourse", method = RequestMethod.GET)
	public ModelAndView AddCourse( ModelAndView mav){
		
		//대표 카테고리 가져오기
		List<Course> courseCategory1 = courseService.findCosCategory1();
		//상세 카테고리 가져오기
		List<Course> courseCategory2 = courseService.findCosCategory2();
				
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("coursecategory1",courseCategory1);
		mav.addObject("coursecategory2",courseCategory2);
		
		mav.setViewName("/course/courseinsert");
				
		return mav;
	}
	//새로운 코스 추가
	//todo- 이미지 업로드할 때 올린이미지 바로 확인할 수 있게..
	@RequestMapping(value = "/insertcourse", method = RequestMethod.POST)
	public String InsertCourse( ModelAndView mav, @ModelAttribute Course cos, MultipartFile file) throws IOException{
		//경로 수정해야하는데 ...음
		String uploadPath = "C:/Users/SK/Desktop/spring_edu/EduProject/src/main/webapp/resources/courseImage/";
		
		//코스 대표이미지 업로드
		UUID uuid = UUID.randomUUID();	    
	    String savedName = uuid.toString()+"_"+file.getOriginalFilename();
	    File target = new File(uploadPath, savedName);
	        
	    FileCopyUtils.copy(file.getBytes(), target);
		
	    //폴더에 저장되는 이름으로 코스사진 이름 변경 
	    cos.setCospicture(savedName);
		
		courseService.insertCourse(cos);
		
		return "redirect:/course/list";
	}
	
	
	//todo - 등록 실패시 오류 페이지 만들기?
	//강의 추가 창 이동
	@RequestMapping(value = "/addlecture", method = RequestMethod.GET)
	public ModelAndView AddLecture( ModelAndView mav, @RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="all") String searchOption){
		
		//코스번호를 가져오기 위한 코스 불러오기 
		List<Course> courseList = courseService.findCosList(searchOption ,keyword);
		
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
