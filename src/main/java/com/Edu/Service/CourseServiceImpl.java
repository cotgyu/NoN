package com.Edu.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Edu.Dao.CourseMapper;
import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;

@Service
public class CourseServiceImpl implements CourseService{
	@Autowired 
	private CourseMapper courseDao;
	@Autowired
	private SqlSession sqlSession;
	
	//cosno에 맞는 코스 찾기
	@Override
	public Course findcos(int cosno) {
		return courseDao.findcos(cosno);
	}
	
	//cosno에 맞는 강좌들 찾기
	@Override
	public List<Lecture> findcos_lec(int cosno) {
		return courseDao.findcos_lec(cosno);
	}
	
	

}
