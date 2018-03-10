package com.Edu.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.Edu.Domain.Course;
import com.Edu.Domain.Lecture;

@Service
public interface CourseService {
	public Course findCos(int cosno);
	
	public List<Lecture> findCos_lec(int cosno);

	public Lecture findLecVideo(int lecno);

	public List<Course> findCosList();

	public void insertCourse(Course cos);

	public void insertLecture(Lecture lecture);
}
