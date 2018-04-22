package com.Edu.Dao;

import java.util.List;
import java.util.Map;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;


public interface CourseMapper {

	Course findCos(int cosno);

	List<Lecture> findCos_lec(int cosno);

	Lecture findLecture(int lecno);

	List<Course> findCosList(Map map);

	void insertCourse(Course cos);

	void insertLecture(Lecture lecture);

	List<Course> findCosCategory1();
	List<Course> findCosCategory2();
	
	List<Course> findProgrammingCategory();
	List<Course> findDesignCategory();
	List<Course> findBusinessCategory();
	

	List<Course> findNewCosList();

	List<Course> findPopCosList();

	void updateCourse(Course cos);

	void updateLecture(Lecture lecture);
}
