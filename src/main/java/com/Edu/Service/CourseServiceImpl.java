package com.Edu.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.CourseMapper;
import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired 
	private CourseMapper courseMapper;
	
	//cosno에 맞는 코스 찾기
	@Override
	public Course findCos(int cosno) {
		return courseMapper.findCos(cosno);
	}
	
	//cosno에 맞는 강좌들 찾기
	@Override
	public List<Lecture> findCos_lec(int cosno) {
		return courseMapper.findCos_lec(cosno);
	}

	//lecno에 맞는 강좌 영상 가져오기 
	@Override
	public Lecture findLecVideo(int lecno) {
		return courseMapper.findLecVideo(lecno);
	}

	//course리스트 불러오기 
	@Override
	public List<Course> findCosList(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		return courseMapper.findCosList(map);
	}
	
	//시간순으로 코스 불러오기
	@Override
	public List<Course> findNewCosList() {
		return courseMapper.findNewCosList();
	}

	//추천수 많은 코스 가져오기
	@Override
	public List<Course> findPopCosList() {
		return courseMapper.findPopCosList();
	}
	
	
	//새로운 course 추가
	@Override
	public void insertCourse(Course cos) {
		courseMapper.insertCourse(cos);
	}
	
	//새로운 lecture 추가
	@Override
	public void insertLecture(Lecture lecture) {
		courseMapper.insertLecture(lecture);
		
	}

	//코스 카테고리 불러오기
	@Override
	public List<Course> findCosCategory() {
		return courseMapper.findCosCategory();
	}


	

}
