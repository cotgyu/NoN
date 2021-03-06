package com.Edu.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;
import com.Edu.Domain.Page;
import com.Edu.Itemrecommend.*;
import com.Edu.Service.CourseService;

@Controller
@RequestMapping("/course/")
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	//cosno에 맞는 소개 페이지 관련
	@RequestMapping(value = "/intro/{cosno}", method = RequestMethod.GET)
	public ModelAndView Courseintro( ModelAndView mav, @PathVariable("cosno") int cosno, HttpSession session){
		
		//cosno에 맞는 코스정보 불러오기
		Course course = courseService.findCos(cosno);
		
		//cosno에 맞는 강좌들 불러오기
		List<Lecture> lecture = courseService.findCos_lec(cosno);
		
		//세션에서 아이디 받아오기
		String id = (String) session.getAttribute("id");
		
		//수강여부 체크
		boolean checkstate = courseService.ajaxchecksubscribe(id,cosno);
		
		//데이터
		DataConvert DataC = new DataConvert();
		try {
			DataC.Convert();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//추천 강의리스트 뽑기
		ItemRecommend IR = new ItemRecommend();		
		List<String> recommendList = IR.Recommend(cosno);
		List<String> recommendCourseName = new ArrayList<>();
		
		Iterator iterator = recommendList.iterator();
		while (iterator.hasNext()) {
			String a = (String) iterator.next();
		    int element = Integer.parseInt(a);	    
		    recommendCourseName.add(courseService.findCosName(element));
		}


	
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("course",course);
		mav.addObject("lecture",lecture);
		mav.addObject("checkstate",checkstate);
		
		mav.addObject("recommendList",recommendList);
		mav.addObject("recommendCourseName",recommendCourseName);
		
		
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
		Lecture lecture = courseService.findLecture(lecno); 
		
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("course",course);
		mav.addObject("lecturelist",lecturelist);
		mav.addObject("lecture",lecture);
				
		mav.setViewName("/course/player");
				
		return mav;
	}
	
	
	//검색한 코스 리스트 불러오기
	@RequestMapping(value = "/list")
	public ModelAndView SearchCourseList(ModelAndView mav ){
		
			
		//프로그래밍 상세 카테고리 가져오기
		List<Course> ProgrammingCategory = courseService.findProgrammingCategory();
		//디자인 상세 카테고리 가져오기
		List<Course> DesignCategory = courseService.findDesignCategory();
		//비즈니스  상세 카테고리 가져오기
		List<Course> BusinessCategory = courseService.findBusinessCategory();
					
			
		//modelandview에 정보 저장 
		mav = new ModelAndView();

			
		mav.addObject("programmingcategory",ProgrammingCategory);
		mav.addObject("designcategory",DesignCategory);
		mav.addObject("businesscategory",BusinessCategory);
		mav.setViewName("/course/course_searchlist");
					
		return mav;
	}
		
	//키워드 검색 리스트 
	@RequestMapping(value = "/searchajaxlist")
	public ModelAndView SearchAjaxCourseList( ModelAndView mav, 
			@RequestParam(defaultValue="") String keyword, 
			@RequestParam(defaultValue="all") String searchOption,
			@RequestParam(defaultValue="1") int curPage
			){
		//코스 수
		int count = courseService.countCourse(searchOption,keyword);
			
		//페이징 
		Page Page = new Page(count, curPage);
		int start = Page.getPageBegin();
		int end = Page.getPageEnd();
	
		//모든 코스 가져오기 
		List<Course> courseList = courseService.findCosList(start,end,searchOption,keyword);
			
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("courselist",courseList);
		mav.addObject("keyword", keyword);
		mav.addObject("searchOption", searchOption);
		mav.addObject("count", count);
		mav.addObject("Page", Page);
	
		mav.setViewName("/course/ajaxlist");
					
		return mav;
	}
	
		
	
	//todo - 등록 실패시 오류 페이지 만들기? 
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
		String uploadPath = "C:/Users/SK/Desktop/spring_non/src/main/webapp/resources/courseImage";
		
		
		
		//코스 대표이미지 업로드
		UUID uuid = UUID.randomUUID();	    
	    String savedName = uuid.toString()+"_"+file.getOriginalFilename();
	    File target = new File(uploadPath, savedName);
	        
	    FileCopyUtils.copy(file.getBytes(), target);
		
	    //폴더에 저장되는 이름으로 코스사진 이름 변경 
	    cos.setCospicture(savedName);
	    
	    //대표영상 추가시 입력한 유뷰트 주소
	  	String inputvideo = cos.getCosintrovideo();
	  		
	  	//영상 주소 속 watch?v= 부분 찾기
	  	int front = inputvideo.indexOf("watch?v=");
	  	//영상 주소 속 &부분 찾기
	  	//&가 2개 들어가는 주소도 넣어봤는데 일단 정상적을 작동됨. 첫번째 부분만 기록이 되야함...
	  	int back = inputvideo.indexOf("&");
	  	//주소 길이 찾기
	  	int all = inputvideo.length();
	  		
	  	//&이 없는 영상일 경우(indexof는 문자를 못찾으면 -1 반환)
	  	if(back==-1){
	  		//watch?v= 뒷부분 부터 주소 끝부분까지 자르기
	  		String video = inputvideo.substring(front+8, all);
	  		//바뀐 영상이름으로 다시 저장
	  		cos.setCosintrovideo(video);
	  		//수정된 lecture로 db에 입력
	  		courseService.insertCourse(cos);	
	  	}
	  	//list에 있는 영상을 가져올 경우
	  	else{
	 		//watch?v= 뒷부분부터 & 전까지 자르기
	  		String video = inputvideo.substring(front+8,back);
	  		cos.setCosintrovideo(video);
	  		courseService.insertCourse(cos);
	  	}
	    	    
		return "redirect:/course/list";
	}
	
	
	//todo - 등록 실패시 오류 페이지 만들기?
	//강의 추가 창 이동
	@RequestMapping(value = "/addlecture", method = RequestMethod.GET)
	public ModelAndView AddLecture( ModelAndView mav){
		
		//코스번호를 가져오기 위한 코스 불러오기  
		List<Course> courseList = courseService.AllfindCosList();
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("courselist",courseList);	
		
		mav.setViewName("/course/lectureinsert");
				
		return mav;
	}
	//새로운 강의 추가
	@RequestMapping(value = "/insertlecture", method = RequestMethod.POST)
	public String InsertLecture( ModelAndView mav, @ModelAttribute Lecture lecture){
		
		//강의 추가시 입력한 유뷰트 주소
		String inputvideo = lecture.getLecvideo();
		
		//영상 주소 속 watch?v= 부분 찾기
		int front = inputvideo.indexOf("watch?v=");
		//영상 주소 속 &부분 찾기
		//&가 2개 들어가는 주소도 넣어봤는데 일단 정상적을 작동됨. 첫번째 부분만 기록이 되야함...
		int back = inputvideo.indexOf("&");
		//주소 길이 찾기
		int all = inputvideo.length();
		
		//&이 없는 영상일 경우(indexof는 문자를 못찾으면 -1 반환)
		if(back==-1){
			//watch?v= 뒷부분 부터 주소 끝부분까지 자르기
			String video = inputvideo.substring(front+8, all);
			//바뀐 영상이름으로 다시 저장
			lecture.setLecvideo(video);
			//수정된 lecture로 db에 입력
			courseService.insertLecture(lecture);	
		}
		//list에 있는 영상을 가져올 경우
		else{
			//watch?v= 뒷부분부터 & 전까지 자르기
			String video = inputvideo.substring(front+8,back);
			lecture.setLecvideo(video);
			courseService.insertLecture(lecture);
		}
		
		return "redirect:/course/list";
	}
	//수정할 코스 선택 
	@RequestMapping(value = "/selectmodifycourse/", method = RequestMethod.GET)
	public ModelAndView SelectModifyCourse( ModelAndView mav){
		List<Course> allcourse = courseService.AllfindCosList();
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("allcourse",allcourse);	
		
		mav.setViewName("/course/course_selectmodify_cos");		
		
		return mav;
	}
	
	
	//코스 수정 창 이동
	@RequestMapping(value = "/modifycourse/{cosno}", method = RequestMethod.GET)
	public ModelAndView ModifyCourse( ModelAndView mav, @PathVariable("cosno") int cosno){
			
		//코스번호를 가져오기 위한 코스 불러오기 
		Course course = courseService.findCos(cosno);
		//대표 카테고리 가져오기
		List<Course> courseCategory1 = courseService.findCosCategory1();
		//상세 카테고리 가져오기
		List<Course> courseCategory2 = courseService.findCosCategory2();
	
		
		//modelandview에 정보 저장 
		mav = new ModelAndView();
		mav.addObject("course",course);	
		mav.addObject("coursecategory1",courseCategory1);
		mav.addObject("coursecategory2",courseCategory2);
		
		mav.setViewName("/course/coursemodify");
					
		return mav;
	}
	//코스 업데이트
	@RequestMapping(value = "/updatecourse", method = RequestMethod.POST)
	public String UpdateCourse( ModelAndView mav, @ModelAttribute Course cos, MultipartFile file) throws IOException{
		//경로 수정해야하는데 ...음
		String uploadPath = "C:/Users/SK/Desktop/spring_non/src/main/webapp/resources/courseImage";
			
			
			
		//코스 대표이미지 업로드
		UUID uuid = UUID.randomUUID();	    
		String savedName = uuid.toString()+"_"+file.getOriginalFilename();
		File target = new File(uploadPath, savedName);
		        
		FileCopyUtils.copy(file.getBytes(), target);
			
		//폴더에 저장되는 이름으로 코스사진 이름 변경 
		cos.setCospicture(savedName);
		    
		//대표영상 추가시 입력한 유뷰트 주소
		String inputvideo = cos.getCosintrovideo();
		  		
		//영상 주소 속 watch?v= 부분 찾기
		int front = inputvideo.indexOf("watch?v=");
		//영상 주소 속 &부분 찾기
	  	//&가 2개 들어가는 주소도 넣어봤는데 일단 정상적을 작동됨. 첫번째 부분만 기록이 되야함...
	  	int back = inputvideo.indexOf("&");
		//주소 길이 찾기
		int all = inputvideo.length();
		  		
		//&이 없는 영상일 경우(indexof는 문자를 못찾으면 -1 반환)
		if(back==-1){
			//watch?v= 뒷부분 부터 주소 끝부분까지 자르기
		  	String video = inputvideo.substring(front+8, all);
			//바뀐 영상이름으로 다시 저장
	  		cos.setCosintrovideo(video);
	  		//수정된 lecture로 db에 입력
	  		courseService.updateCourse(cos);	
	  	}
	  	//list에 있는 영상을 가져올 경우
	  	else{
	 		//watch?v= 뒷부분부터 & 전까지 자르기
	  		String video = inputvideo.substring(front+8,back);
	  		cos.setCosintrovideo(video);
	  		courseService.updateCourse(cos);
	  	}
		    	    
		return "redirect:/course/list";
	}
	//수정할 강의 선택 
		@RequestMapping(value = "/selectmodifylecture/{cosno}", method = RequestMethod.GET)
		public ModelAndView SelectModifyLecture( ModelAndView mav,  @PathVariable("cosno") int cosno){
			
			//cosno에 맞는 강좌들 불러오기
			List<Lecture> lecture = courseService.findCos_lec(cosno);
			
			
			//modelandview에 정보 저장 
			mav = new ModelAndView();
			mav.addObject("lecture",lecture);	
			
			mav.setViewName("/course/course_selectmodify_lec");		
			
			return mav;
		}
	
	
	//강의 수정 창 이동
		@RequestMapping(value = "/modifylecture/{lecno}", method = RequestMethod.GET)
		public ModelAndView ModifyLecture( ModelAndView mav,
				@PathVariable("lecno") int lecno){
			
			//코스번호를 가져오기 위한 코스 불러오기 
			List<Course> courseList = courseService.AllfindCosList();
			Lecture lecture = courseService.findLecture(lecno);
			//modelandview에 정보 저장 
			mav = new ModelAndView();
			mav.addObject("courselist",courseList);	
			mav.addObject("lecture",lecture);	
			
			mav.setViewName("/course/lecturemodify");
					
			return mav;
		}
		//강의 업데잍 
		@RequestMapping(value = "/updatelecture", method = RequestMethod.POST)
		public String UpdateLecture( ModelAndView mav, @ModelAttribute Lecture lecture) throws IOException{
			
			//강의 추가시 입력한 유뷰트 주소
			String inputvideo = lecture.getLecvideo();
			
			//영상 주소 속 watch?v= 부분 찾기
			int front = inputvideo.indexOf("watch?v=");
			//영상 주소 속 &부분 찾기
			//&가 2개 들어가는 주소도 넣어봤는데 일단 정상적을 작동됨. 첫번째 부분만 기록이 되야함...
			int back = inputvideo.indexOf("&");
			//주소 길이 찾기
			int all = inputvideo.length();
			
			//&이 없는 영상일 경우(indexof는 문자를 못찾으면 -1 반환)
			if(back==-1){
				//watch?v= 뒷부분 부터 주소 끝부분까지 자르기
				String video = inputvideo.substring(front+8, all);
				//바뀐 영상이름으로 다시 저장
				lecture.setLecvideo(video);
				//수정된 lecture로 db에 입력
				courseService.updateLecture(lecture);	
			}
			//list에 있는 영상을 가져올 경우
			else{
				//watch?v= 뒷부분부터 & 전까지 자르기
				String video = inputvideo.substring(front+8,back);
				lecture.setLecvideo(video);
				courseService.updateLecture(lecture);
			}
			
			return "redirect:/course/list";
		}

		//수강
		@RequestMapping(value="/subscribe/{cosno}", method=RequestMethod.GET)
		public String SubscribeCourse(@PathVariable("cosno") int cosno, HttpSession session){
			String id = (String) session.getAttribute("id");
			   
			courseService.subscribe(id,cosno);
			
			return "redirect:/course/mycourse";
		}
		
		//수강취소
		@RequestMapping(value="/subscribecancel/{cosno}", method=RequestMethod.GET)
		public String SubscribeCancel(@PathVariable("cosno") int cosno, HttpSession session){
			String id = (String) session.getAttribute("id");
					   
			courseService.subscribecancel(id,cosno);
					
			return "redirect:/course/mycourse";
		}
		
		
		//내 강좌
		@RequestMapping(value = "/mycourse", method = RequestMethod.GET)
		public ModelAndView MyCourse( ModelAndView mav, HttpSession session){
			
			String id = (String) session.getAttribute("id");
			
			List<Course> course = courseService.mycourse(id);
			
			//modelandview에 정보 저장 
			mav = new ModelAndView();
			mav.addObject("course",course);	
			
			mav.setViewName("/course/mycourse");		
			
			return mav;
		}
			
	
}
