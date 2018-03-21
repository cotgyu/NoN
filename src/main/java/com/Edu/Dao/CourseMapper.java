package com.Edu.Dao;

import java.util.List;


import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;


public interface CourseMapper {

	Course findCos(int cosno);

	List<Lecture> findCos_lec(int cosno);

	Lecture findLecVideo(int lecno);

	List<Course> findCosList();

	void insertCourse(Course cos);

	void insertLecture(Lecture lecture);

	List<Course> findCosCategory();
}
