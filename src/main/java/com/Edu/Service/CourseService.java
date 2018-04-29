package com.Edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;

@Service
public interface CourseService {
	public Course findCos(int cosno);
	
	public List<Lecture> findCos_lec(int cosno);

	public Lecture findLecture(int lecno);

	public List<Course> findCosList(String searchOption, String keyword);

	public void insertCourse(Course cos);

	public void insertLecture(Lecture lecture);

	public List<Course> findCosCategory1();
	public List<Course> findCosCategory2();
	
	public List<Course> findProgrammingCategory();
	public List<Course> findDesignCategory();
	public List<Course> findBusinessCategory();
		
	
	public List<Course> findNewCosList();

	public List<Course> findPopCosList();

	public void updateCourse(Course cos);

	public void updateLecture(Lecture lecture);
}
